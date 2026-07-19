package com.motorcycle.filter;

import com.motorcycle.model.User;
import com.motorcycle.service.AuthService;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthenticationFilter implements Filter {
    private static final String REMEMBER_COOKIE = "ducati_remember";
    private final AuthService authService = new AuthService();
    private final Set<String> protectedPrefixes = new HashSet<String>(Arrays.asList(
            "/profile",
            "/checkout",
            "/order-history",
            "/order-detail",
            "/admin"
    ));

    public void init(FilterConfig filterConfig) {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String path = req.getServletPath();
        if (isProtected(path)) {
            User user = (User) req.getSession().getAttribute("currentUser");
            if (user == null) {
                Optional<User> remembered = authService.loginWithRememberToken(cookieValue(req, REMEMBER_COOKIE));
                if (remembered.isPresent()) {
                    req.getSession().setAttribute("currentUser", remembered.get());
                } else {
                    clearRememberCookie(req, res);
                    res.sendRedirect(req.getContextPath() + "/login.jsp");
                    return;
                }
            }
        }
        chain.doFilter(request, response);
    }

    private boolean isProtected(String path) {
        for (String prefix : protectedPrefixes) {
            if (path != null && path.startsWith(prefix)) {
                return true;
            }
        }
        return false;
    }

    public void destroy() {
    }

    private String cookieValue(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return "";
        }
        for (Cookie cookie : cookies) {
            if (name.equals(cookie.getName())) {
                return cookie.getValue();
            }
        }
        return "";
    }

    private void clearRememberCookie(HttpServletRequest request, HttpServletResponse response) {
        Cookie cookie = new Cookie(REMEMBER_COOKIE, "");
        cookie.setHttpOnly(true);
        cookie.setPath(cookiePath(request));
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }

    private String cookiePath(HttpServletRequest request) {
        String contextPath = request.getContextPath();
        return contextPath == null || contextPath.isEmpty() ? "/" : contextPath;
    }
}
