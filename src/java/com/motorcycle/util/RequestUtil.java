package com.motorcycle.util;

import javax.servlet.http.HttpServletRequest;

public final class RequestUtil {
    private RequestUtil() {
    }

    public static String param(HttpServletRequest request, String name) {
        String value = request.getParameter(name);
        return value == null ? "" : value.trim();
    }

    public static int intParam(HttpServletRequest request, String name, int fallback) {
        try {
            return Integer.parseInt(param(request, name));
        } catch (NumberFormatException ex) {
            return fallback;
        }
    }
}
