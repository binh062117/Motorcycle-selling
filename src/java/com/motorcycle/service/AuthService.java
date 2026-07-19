package com.motorcycle.service;

import com.motorcycle.dao.RoleDao;
import com.motorcycle.dao.UserDao;
import com.motorcycle.model.Role;
import com.motorcycle.model.User;
import com.motorcycle.util.PasswordUtil;
import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.Base64;
import java.util.Optional;
import java.util.UUID;

public class AuthService {
    public static final int REMEMBER_DAYS = 30;
    private final MailService mailService = new MailService();
    private final UserDao userDao = new UserDao();
    private final RoleDao roleDao = new RoleDao();
    private final SecureRandom secureRandom = new SecureRandom();

    public Optional<User> login(String email, String password) {
        Optional<User> user = userDao.findByEmail(email);
        if (!user.isPresent() || !user.get().isActive() || !PasswordUtil.matches(password, user.get().getPasswordHash())) {
            return Optional.empty();
        }
        return user;
    }

    public User register(String firstName, String lastName, String email, String phone, String password) {
        validateRegistration(firstName, lastName, email, phone, password);
        Optional<User> existing = findByEmail(email);
        if (existing.isPresent()) {
            throw new IllegalArgumentException("Email \u0111\u00e3 t\u1ed3n t\u1ea1i trong h\u1ec7 th\u1ed1ng.");
        }
        Role customer = roleDao.findByName("Customer")
                .orElseThrow(() -> new IllegalStateException("Customer role is missing in database."));
        User user = new User(0, firstName, lastName, email, phone, PasswordUtil.sha256(password), customer);
        userDao.insert(user);
        mailService.sendRegistrationConfirmation(user);
        return user;
    }

    public Optional<User> findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    public String issueRememberToken(User user) {
        byte[] random = new byte[32];
        secureRandom.nextBytes(random);
        String token = Base64.getUrlEncoder().withoutPadding().encodeToString(random);
        userDao.updateRememberToken(user.getId(), PasswordUtil.sha256(token), LocalDateTime.now().plusDays(REMEMBER_DAYS));
        return user.getId() + ":" + token;
    }

    public Optional<User> loginWithRememberToken(String cookieValue) {
        if (cookieValue == null || !cookieValue.contains(":")) {
            return Optional.empty();
        }
        String[] parts = cookieValue.split(":", 2);
        try {
            int userId = Integer.parseInt(parts[0]);
            String token = parts[1];
            if (token.trim().isEmpty()) {
                return Optional.empty();
            }
            return userDao.findByRememberToken(userId, PasswordUtil.sha256(token));
        } catch (NumberFormatException ex) {
            return Optional.empty();
        }
    }

    public void clearRememberToken(User user) {
        if (user != null) {
            userDao.updateRememberToken(user.getId(), null, null);
        }
    }

    public String createResetToken(String email) {
        User user = findByEmail(email).orElseThrow(() -> new IllegalArgumentException("Kh\u00f4ng t\u00ecm th\u1ea5y email."));
        String token = UUID.randomUUID().toString();
        user.setResetToken(token);
        userDao.update(user);
        mailService.sendResetPassword(user, token);
        return token;
    }

    public String createResetTokenAfterIdentityCheck(String email, String phone) {
        if (isBlank(email) || isBlank(phone)) {
            throw new IllegalArgumentException("Vui l\u00f2ng nh\u1eadp email v\u00e0 s\u1ed1 \u0111i\u1ec7n tho\u1ea1i \u0111\u00e3 \u0111\u0103ng k\u00fd.");
        }
        User user = findByEmail(email).orElseThrow(() -> new IllegalArgumentException("Th\u00f4ng tin x\u00e1c minh kh\u00f4ng kh\u1edbp."));
        if (user.getPhone() == null || !normalizePhone(user.getPhone()).equals(normalizePhone(phone))) {
            throw new IllegalArgumentException("Th\u00f4ng tin x\u00e1c minh kh\u00f4ng kh\u1edbp.");
        }
        String token = UUID.randomUUID().toString();
        user.setResetToken(token);
        userDao.update(user);
        mailService.sendResetPassword(user, token);
        return token;
    }

    public boolean resetPassword(String token, String newPassword) {
        Optional<User> user = userDao.findByResetToken(token);
        if (!user.isPresent()) {
            return false;
        }
        user.get().setPasswordHash(PasswordUtil.sha256(newPassword));
        user.get().setResetToken(null);
        userDao.update(user.get());
        return true;
    }

    public boolean resetPassword(String token, String newPassword, String confirmPassword) {
        if (isBlank(token)) {
            throw new IllegalArgumentException("Phi\u00ean \u0111\u1ed5i m\u1eadt kh\u1ea9u kh\u00f4ng h\u1ee3p l\u1ec7.");
        }
        if (isBlank(newPassword) || newPassword.length() < 6) {
            throw new IllegalArgumentException("M\u1eadt kh\u1ea9u ph\u1ea3i c\u00f3 \u00edt nh\u1ea5t 6 k\u00fd t\u1ef1.");
        }
        if (!newPassword.equals(confirmPassword)) {
            throw new IllegalArgumentException("X\u00e1c nh\u1eadn m\u1eadt kh\u1ea9u kh\u00f4ng kh\u1edbp.");
        }
        Optional<User> user = userDao.findByResetToken(token);
        if (!user.isPresent()) {
            throw new IllegalArgumentException("Phi\u00ean \u0111\u1ed5i m\u1eadt kh\u1ea9u \u0111\u00e3 h\u1ebft h\u1ea1n ho\u1eb7c kh\u00f4ng h\u1ee3p l\u1ec7.");
        }
        user.get().setPasswordHash(PasswordUtil.sha256(newPassword));
        user.get().setResetToken(null);
        clearRememberToken(user.get());
        userDao.update(user.get());
        return true;
    }

    public void updateProfile(User user, String firstName, String lastName, String phone, String address) {
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPhone(phone);
        user.setAddress(address);
        userDao.update(user);
    }

    public boolean changePassword(User user, String oldPassword, String newPassword) {
        return changePassword(user, user == null ? "" : user.getEmail(), user == null ? "" : user.getPhone(), oldPassword, newPassword, newPassword);
    }

    public boolean changePassword(User user, String email, String phone, String oldPassword, String newPassword, String confirmPassword) {
        if (user == null) {
            throw new IllegalArgumentException("Phi\u00ean \u0111\u0103ng nh\u1eadp \u0111\u00e3 h\u1ebft h\u1ea1n.");
        }
        if (isBlank(email) || isBlank(phone)) {
            throw new IllegalArgumentException("Vui l\u00f2ng x\u00e1c minh email v\u00e0 s\u1ed1 \u0111i\u1ec7n tho\u1ea1i \u0111\u00e3 \u0111\u0103ng k\u00fd.");
        }
        if (!user.getEmail().equalsIgnoreCase(email.trim())
                || user.getPhone() == null
                || !normalizePhone(user.getPhone()).equals(normalizePhone(phone))) {
            throw new IllegalArgumentException("Th\u00f4ng tin x\u00e1c minh kh\u00f4ng kh\u1edbp.");
        }
        if (!PasswordUtil.matches(oldPassword, user.getPasswordHash())) {
            throw new IllegalArgumentException("M\u1eadt kh\u1ea9u hi\u1ec7n t\u1ea1i kh\u00f4ng \u0111\u00fang.");
        }
        if (isBlank(newPassword) || newPassword.length() < 6) {
            throw new IllegalArgumentException("M\u1eadt kh\u1ea9u ph\u1ea3i c\u00f3 \u00edt nh\u1ea5t 6 k\u00fd t\u1ef1.");
        }
        if (!newPassword.equals(confirmPassword)) {
            throw new IllegalArgumentException("X\u00e1c nh\u1eadn m\u1eadt kh\u1ea9u kh\u00f4ng kh\u1edbp.");
        }
        user.setPasswordHash(PasswordUtil.sha256(newPassword));
        clearRememberToken(user);
        userDao.update(user);
        return true;
    }

    private void validateRegistration(String firstName, String lastName, String email, String phone, String password) {
        if (isBlank(firstName) || isBlank(lastName) || isBlank(email) || isBlank(phone) || isBlank(password)) {
            throw new IllegalArgumentException("Vui l\u00f2ng nh\u1eadp \u0111\u1ea7y \u0111\u1ee7 th\u00f4ng tin \u0111\u0103ng k\u00fd.");
        }
        if (!email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
            throw new IllegalArgumentException("Email kh\u00f4ng \u0111\u00fang \u0111\u1ecbnh d\u1ea1ng.");
        }
        if (password.length() < 6) {
            throw new IllegalArgumentException("M\u1eadt kh\u1ea9u ph\u1ea3i c\u00f3 \u00edt nh\u1ea5t 6 k\u00fd t\u1ef1.");
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }

    private String normalizePhone(String phone) {
        return phone == null ? "" : phone.replaceAll("[^0-9]", "");
    }
}
