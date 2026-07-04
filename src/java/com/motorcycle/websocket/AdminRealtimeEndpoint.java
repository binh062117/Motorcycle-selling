package com.motorcycle.websocket;

import com.motorcycle.model.User;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/ws/admin", configurator = AdminSocketConfigurator.class)
public class AdminRealtimeEndpoint {
    @OnOpen
    public void onOpen(Session socketSession) throws IOException {
        HttpSession httpSession = (HttpSession) socketSession.getUserProperties().get("httpSession");
        User user = httpSession == null ? null : (User) httpSession.getAttribute("currentUser");
        if (user == null || !user.isAdmin()) {
            socketSession.close(new CloseReason(CloseReason.CloseCodes.VIOLATED_POLICY, "Admin role required"));
            return;
        }
        AdminRealtimeHub.add(socketSession);
    }

    @OnClose
    public void onClose(Session socketSession) {
        AdminRealtimeHub.remove(socketSession);
    }
}
