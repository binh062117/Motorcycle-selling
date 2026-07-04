package com.motorcycle.websocket;

import com.motorcycle.model.User;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/ws/notifications", configurator = AdminSocketConfigurator.class)
public class NotificationRealtimeEndpoint {
    @OnOpen
    public void onOpen(Session socketSession) throws IOException {
        HttpSession httpSession = (HttpSession) socketSession.getUserProperties().get("httpSession");
        User user = httpSession == null ? null : (User) httpSession.getAttribute("currentUser");
        if (user == null) {
            socketSession.close(new CloseReason(CloseReason.CloseCodes.VIOLATED_POLICY, "Login required"));
            return;
        }
        socketSession.getUserProperties().put("notificationUserId", user.getId());
        NotificationRealtimeHub.add(user.getId(), socketSession);
    }

    @OnClose
    public void onClose(Session socketSession) {
        Object userId = socketSession.getUserProperties().get("notificationUserId");
        if (userId instanceof Integer) {
            NotificationRealtimeHub.remove((Integer) userId, socketSession);
        }
    }
}
