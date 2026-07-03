package com.motorcycle.filter;

import com.motorcycle.model.User;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthenticationFilter implements Filter {
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
                res.sendRedirect(req.getContextPath() + "/login.jsp");
                return;
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
}
