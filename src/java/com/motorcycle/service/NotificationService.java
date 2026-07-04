package com.motorcycle.service;

import com.motorcycle.dao.NotificationDao;
import com.motorcycle.dao.UserDao;
import com.motorcycle.model.Notification;
import com.motorcycle.model.Order;
import com.motorcycle.model.User;
import com.motorcycle.websocket.NotificationRealtimeHub;
import java.util.List;

public class NotificationService {
    private final NotificationDao notificationDao = new NotificationDao();
    private final UserDao userDao = new UserDao();

    public List<Notification> recentFor(User user) {
        return notificationDao.findRecentForUser(user.getId());
    }

    public int unreadCountFor(User user) {
        return notificationDao.countUnreadForUser(user.getId());
    }

    public void markAllRead(User user) {
        notificationDao.markAllRead(user.getId());
    }

    public void notifyOrderCreated(Order order) {
        User customer = order.getCustomer();
        if (customer != null) {
            Notification customerNotification = create(customer,
                    "Đặt lịch thành công",
                    "Đơn #" + order.getCode() + " đã được tạo thành công. Showroom sẽ kiểm tra và xác nhận sớm.");
            NotificationRealtimeHub.sendToUser(customer.getId(), customerNotification);
        }

        for (User admin : userDao.findAll()) {
            if (!admin.isAdmin()) {
                continue;
            }
            Notification adminNotification = create(admin,
                    "Có đơn đặt lịch mới",
                    "Đơn #" + order.getCode() + " từ " + customerName(order) + " vừa được tạo.");
            NotificationRealtimeHub.sendToUser(admin.getId(), adminNotification);
        }
    }

    private Notification create(User user, String title, String message) {
        Notification notification = new Notification();
        notification.setUser(user);
        notification.setTitle(title);
        notification.setMessage(message);
        notification.setRead(false);
        return notificationDao.insert(notification);
    }

    private String customerName(Order order) {
        if (order.getCustomer() == null || order.getCustomer().getFullName().isEmpty()) {
            return "khách hàng";
        }
        return order.getCustomer().getFullName();
    }
}
