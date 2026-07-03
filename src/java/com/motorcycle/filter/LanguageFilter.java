package com.motorcycle.filter;

import java.io.IOException;
import java.util.Locale;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LanguageFilter implements Filter {
    private static final String DEFAULT_LANG = "vi";

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession();

        String lang = httpRequest.getParameter("lang");
        if (!"en".equalsIgnoreCase(lang) && !"vi".equalsIgnoreCase(lang)) {
            Object saved = session.getAttribute("appLang");
            lang = saved == null ? DEFAULT_LANG : String.valueOf(saved);
        }

        lang = "en".equalsIgnoreCase(lang) ? "en" : DEFAULT_LANG;
        session.setAttribute("appLang", lang);
        session.setAttribute("appLocale", new Locale(lang, "en".equals(lang) ? "US" : "VN"));
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
