package com.motorcycle.filter;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CsrfFilter implements Filter {
    public void init(FilterConfig filterConfig) {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        Object token = req.getSession().getAttribute("csrfToken");
        if (token == null) {
            token = UUID.randomUUID().toString();
            req.getSession().setAttribute("csrfToken", token);
        }
        req.setAttribute("csrfToken", token);

        String submittedToken = req.getParameter("csrfToken");
        if ("POST".equalsIgnoreCase(req.getMethod()) && submittedToken != null && !submittedToken.equals(token)) {
            res.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        chain.doFilter(request, response);
    }

    public void destroy() {
    }
}
