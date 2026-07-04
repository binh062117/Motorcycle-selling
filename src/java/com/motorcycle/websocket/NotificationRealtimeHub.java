package com.motorcycle.websocket;

import com.motorcycle.model.Notification;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;
import javax.websocket.Session;

public final class NotificationRealtimeHub {
    private static final Map<Integer, Set<Session>> USER_SESSIONS = new ConcurrentHashMap<Integer, Set<Session>>();

    private NotificationRealtimeHub() {
    }

    static void add(int userId, Session session) {
        Set<Session> sessions = USER_SESSIONS.get(userId);
        if (sessions == null) {
            sessions = new CopyOnWriteArraySet<Session>();
            USER_SESSIONS.put(userId, sessions);
        }
        sessions.add(session);
    }

    static void remove(int userId, Session session) {
        Set<Session> sessions = USER_SESSIONS.get(userId);
        if (sessions != null) {
            sessions.remove(session);
            if (sessions.isEmpty()) {
                USER_SESSIONS.remove(userId);
            }
        }
    }

    public static void sendToUser(int userId, Notification notification) {
        Set<Session> sessions = USER_SESSIONS.get(userId);
        if (sessions == null || sessions.isEmpty()) {
            return;
        }
        String payload = notificationPayload(notification);
        for (Session session : sessions) {
            if (session.isOpen()) {
                session.getAsyncRemote().sendText(payload);
            } else {
                remove(userId, session);
            }
        }
    }

    private static String notificationPayload(Notification notification) {
        String createdAt = notification.getCreatedAt() == null ? "" : notification.getCreatedAt().toString();
        return "{"
                + "\"type\":\"NOTIFICATION\","
                + "\"notification\":{"
                + "\"id\":" + notification.getId() + ","
                + "\"title\":\"" + escape(notification.getTitle()) + "\","
                + "\"message\":\"" + escape(notification.getMessage()) + "\","
                + "\"read\":" + notification.isRead() + ","
                + "\"createdAt\":\"" + escape(createdAt) + "\""
                + "}"
                + "}";
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
