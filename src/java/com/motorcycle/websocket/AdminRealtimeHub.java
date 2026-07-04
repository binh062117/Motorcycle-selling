package com.motorcycle.websocket;

import com.motorcycle.model.Order;
import java.math.BigDecimal;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import javax.websocket.Session;

public final class AdminRealtimeHub {
    private static final Set<Session> SESSIONS = new CopyOnWriteArraySet<Session>();

    private AdminRealtimeHub() {
    }

    static void add(Session session) {
        SESSIONS.add(session);
    }

    static void remove(Session session) {
        SESSIONS.remove(session);
    }

    public static void orderCreated(Order order, List<Order> allOrders) {
        broadcast(orderPayload("ORDER_CREATED", order, dashboardStats(allOrders)));
    }

    public static void orderStatusUpdated(Order order, List<Order> allOrders) {
        broadcast(orderPayload("ORDER_STATUS_UPDATED", order, dashboardStats(allOrders)));
    }

    private static String orderPayload(String type, Order order, String statsJson) {
        StringBuilder json = new StringBuilder();
        json.append('{')
                .append("\"type\":\"").append(type).append("\",")
                .append("\"order\":{")
                .append("\"id\":").append(order.getId()).append(',')
                .append("\"code\":\"").append(escape(order.getCode())).append("\",")
                .append("\"customer\":\"").append(escape(order.getCustomer() == null ? "" : order.getCustomer().getFullName())).append("\",")
                .append("\"status\":\"").append(escape(order.getStatus())).append("\",")
                .append("\"total\":").append(order.getTotal() == null ? "0" : order.getTotal().setScale(0, BigDecimal.ROUND_HALF_UP).toPlainString())
                .append("},")
                .append("\"stats\":").append(statsJson)
                .append('}');
        return json.toString();
    }

    private static String dashboardStats(List<Order> orders) {
        int orderCount = orders == null ? 0 : orders.size();
        int pendingOrders = 0;
        BigDecimal revenue = BigDecimal.ZERO;
        if (orders != null) {
            for (Order order : orders) {
                if (isPending(order.getStatus())) {
                    pendingOrders++;
                }
                if (order.getTotal() != null) {
                    revenue = revenue.add(order.getTotal());
                }
            }
        }
        return "{"
                + "\"orderCount\":" + orderCount + ","
                + "\"pendingOrders\":" + pendingOrders + ","
                + "\"dashboardRevenue\":" + revenue.setScale(0, BigDecimal.ROUND_HALF_UP).toPlainString()
                + "}";
    }

    private static boolean isPending(String status) {
        if (status == null) {
            return false;
        }
        String normalized = status.toLowerCase();
        return normalized.contains("pending")
                || normalized.contains("new")
                || normalized.contains("chờ")
                || normalized.contains("cho duyet")
                || normalized.contains("duyệt")
                || normalized.contains("duyá");
    }

    private static void broadcast(String message) {
        for (Session session : SESSIONS) {
            if (session.isOpen()) {
                session.getAsyncRemote().sendText(message);
            } else {
                SESSIONS.remove(session);
            }
        }
    }

    private static String escape(String value) {
        if (value == null) {
            return "";
        }
        return value.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\r", "\\r")
                .replace("\n", "\\n");
    }
}
