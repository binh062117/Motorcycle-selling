package com.motorcycle.service;

import com.motorcycle.dao.RoleDao;
import com.motorcycle.dao.UserDao;
import com.motorcycle.model.Role;
import com.motorcycle.model.User;
import com.motorcycle.util.PasswordUtil;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Optional;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class GoogleOAuthService {
    private final UserDao userDao = new UserDao();
    private final RoleDao roleDao = new RoleDao();

    public String buildAuthorizationUrl(String redirectUri, String state) {
        GoogleConfig config = GoogleConfig.fromEnvironment();
        if (!config.isConfigured()) {
            throw new IllegalStateException("Chưa cấu hình GOOGLE_CLIENT_ID hoặc GOOGLE_CLIENT_SECRET.");
        }
        return "https://accounts.google.com/o/oauth2/v2/auth"
                + "?client_id=" + encode(config.clientId)
                + "&redirect_uri=" + encode(redirectUri)
                + "&response_type=code"
                + "&scope=" + encode("openid email profile")
                + "&state=" + encode(state)
                + "&access_type=offline"
                + "&prompt=select_account";
    }

    public User loginWithCode(String code, String redirectUri) {
        GoogleConfig config = GoogleConfig.fromEnvironment();
        if (!config.isConfigured()) {
            throw new IllegalStateException("Chưa cấu hình GOOGLE_CLIENT_ID hoặc GOOGLE_CLIENT_SECRET.");
        }
        String tokenJson = post("https://oauth2.googleapis.com/token",
                "code=" + encode(code)
                        + "&client_id=" + encode(config.clientId)
                        + "&client_secret=" + encode(config.clientSecret)
                        + "&redirect_uri=" + encode(redirectUri)
                        + "&grant_type=authorization_code");
        String accessToken = jsonValue(tokenJson, "access_token");
        String idToken = jsonValue(tokenJson, "id_token");
        if (accessToken.isEmpty()) {
            throw new IllegalArgumentException("Không nhận được access token từ Google.");
        }
        String profileJson = get("https://openidconnect.googleapis.com/v1/userinfo", accessToken);
        String idTokenPayload = decodeJwtPayload(idToken);
        String email = jsonValue(profileJson, "email");
        String givenName = jsonValue(profileJson, "given_name");
        String familyName = jsonValue(profileJson, "family_name");
        String name = jsonValue(profileJson, "name");
        String picture = normalizePictureUrl(jsonValue(profileJson, "picture"));
        if (email.isEmpty()) {
            email = jsonValue(idTokenPayload, "email");
        }
        if (givenName.isEmpty()) {
            givenName = jsonValue(idTokenPayload, "given_name");
        }
        if (familyName.isEmpty()) {
            familyName = jsonValue(idTokenPayload, "family_name");
        }
        if (name.isEmpty()) {
            name = jsonValue(idTokenPayload, "name");
        }
        if (picture.isEmpty()) {
            picture = normalizePictureUrl(jsonValue(idTokenPayload, "picture"));
        }
        if (email.isEmpty()) {
            throw new IllegalArgumentException("Google không trả về email.");
        }
        Optional<User> existing = userDao.findByEmail(email);
        if (existing.isPresent()) {
            User user = existing.get();
            boolean changed = false;
            if (!picture.isEmpty() && !picture.equals(user.getAvatarUrl())) {
                user.setAvatarUrl(picture);
                changed = true;
            }
            if ((user.getFirstName() == null || user.getFirstName().trim().isEmpty()) && !givenName.isEmpty()) {
                user.setFirstName(givenName);
                changed = true;
            }
            if ((user.getLastName() == null || user.getLastName().trim().isEmpty()) && !familyName.isEmpty()) {
                user.setLastName(familyName);
                changed = true;
            }
            if ((user.getFullName() == null || user.getFullName().trim().isEmpty()) && !name.isEmpty()) {
                user.setFirstName(name);
                changed = true;
            }
            return changed ? userDao.update(user) : user;
        }
        Role customer = roleDao.findByName("Customer").orElse(new Role(2, "Customer"));
        User user = new User(0, givenName.isEmpty() ? (name.isEmpty() ? email : name) : givenName, familyName, email, "",
                PasswordUtil.sha256(UUID.randomUUID().toString()), customer);
        user.setActive(true);
        user.setAvatarUrl(picture);
        return userDao.insert(user);
    }

    private String post(String endpoint, String body) {
        try {
            HttpURLConnection connection = (HttpURLConnection) new URL(endpoint).openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
            connection.setDoOutput(true);
            try (OutputStream os = connection.getOutputStream()) {
                os.write(body.getBytes(StandardCharsets.UTF_8));
            }
            return read(connection);
        } catch (Exception ex) {
            throw new IllegalStateException("Không gọi được Google OAuth token endpoint.", ex);
        }
    }

    private String get(String endpoint, String accessToken) {
        try {
            HttpURLConnection connection = (HttpURLConnection) new URL(endpoint).openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Authorization", "Bearer " + accessToken);
            return read(connection);
        } catch (Exception ex) {
            throw new IllegalStateException("Không lấy được hồ sơ Google.", ex);
        }
    }

    private String read(HttpURLConnection connection) throws Exception {
        int status = connection.getResponseCode();
        BufferedReader reader = new BufferedReader(new InputStreamReader(
                status >= 400 ? connection.getErrorStream() : connection.getInputStream(), StandardCharsets.UTF_8));
        StringBuilder builder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            builder.append(line);
        }
        if (status >= 400) {
            throw new IllegalStateException(builder.toString());
        }
        return builder.toString();
    }

    private String jsonValue(String json, String key) {
        if (json == null || json.isEmpty()) {
            return "";
        }
        Matcher matcher = Pattern.compile("\"" + Pattern.quote(key) + "\"\\s*:\\s*\"((?:\\\\.|[^\"\\\\])*)\"").matcher(json);
        return matcher.find() ? unescapeJsonString(matcher.group(1)) : "";
    }

    private String unescapeJsonString(String value) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < value.length(); i++) {
            char current = value.charAt(i);
            if (current != '\\' || i + 1 >= value.length()) {
                result.append(current);
                continue;
            }
            char escaped = value.charAt(++i);
            switch (escaped) {
                case '"':
                case '\\':
                case '/':
                    result.append(escaped);
                    break;
                case 'b':
                    result.append('\b');
                    break;
                case 'f':
                    result.append('\f');
                    break;
                case 'n':
                    result.append('\n');
                    break;
                case 'r':
                    result.append('\r');
                    break;
                case 't':
                    result.append('\t');
                    break;
                case 'u':
                    if (i + 4 < value.length()) {
                        String hex = value.substring(i + 1, i + 5);
                        try {
                            result.append((char) Integer.parseInt(hex, 16));
                            i += 4;
                        } catch (NumberFormatException ex) {
                            result.append("\\u").append(hex);
                            i += 4;
                        }
                    } else {
                        result.append("\\u");
                    }
                    break;
                default:
                    result.append(escaped);
                    break;
            }
        }
        return result.toString();
    }

    private String decodeJwtPayload(String token) {
        if (token == null || token.trim().isEmpty()) {
            return "";
        }
        String[] parts = token.split("\\.");
        if (parts.length < 2) {
            return "";
        }
        try {
            byte[] payload = Base64.getUrlDecoder().decode(parts[1]);
            return new String(payload, StandardCharsets.UTF_8);
        } catch (IllegalArgumentException ex) {
            return "";
        }
    }

    private String normalizePictureUrl(String picture) {
        if (picture == null) {
            return "";
        }
        String trimmed = picture.trim();
        return (trimmed.startsWith("https://") || trimmed.startsWith("http://")) ? trimmed : "";
    }

    private String encode(String value) {
        try {
            return URLEncoder.encode(value, StandardCharsets.UTF_8.name());
        } catch (Exception ex) {
            throw new IllegalArgumentException(ex);
        }
    }

    private static class GoogleConfig {
        private final String clientId;
        private final String clientSecret;

        private GoogleConfig(String clientId, String clientSecret) {
            this.clientId = clientId;
            this.clientSecret = clientSecret;
        }

        private boolean isConfigured() {
            return !clientId.isEmpty() && !clientSecret.isEmpty();
        }

        private static GoogleConfig fromEnvironment() {
            return new GoogleConfig(value("GOOGLE_CLIENT_ID", ""), value("GOOGLE_CLIENT_SECRET", ""));
        }

        private static String value(String key, String fallback) {
            String system = System.getProperty(key);
            if (system != null && !system.trim().isEmpty()) {
                return system.trim();
            }
            String env = System.getenv(key);
            return env == null || env.trim().isEmpty() ? fallback : env.trim();
        }
    }
}
