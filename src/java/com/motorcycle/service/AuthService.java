package com.motorcycle.service;

import com.motorcycle.dao.RoleDao;
import com.motorcycle.dao.UserDao;
import com.motorcycle.model.Role;
import com.motorcycle.model.User;
import com.motorcycle.util.PasswordUtil;
import java.util.Optional;
import java.util.UUID;

public class AuthService {
    private final MailService mailService = new MailService();
    private final UserDao userDao = new UserDao();
    private final RoleDao roleDao = new RoleDao();

    public Optional<User> login(String email, String password) {
        Optional<User> user = userDao.findByEmail(email);
        if (!user.isPresent() || !user.get().isActive() || !PasswordUtil.matches(password, user.get().getPasswordHash())) {
            return Optional.empty();
        }
        return user;
    }

    public User register(String firstName, String lastName, String email, String phone, String password) {
        Optional<User> existing = findByEmail(email);
        if (existing.isPresent()) {
            throw new IllegalArgumentException("Email đã tồn tại trong hệ thống.");
        }
        Role customer = roleDao.findByName("Customer").orElse(new Role(2, "Customer"));
        User user = new User(0, firstName, lastName, email, phone, PasswordUtil.sha256(password), customer);
        userDao.insert(user);
        mailService.sendRegistrationConfirmation(user);
        return user;
    }

    public Optional<User> findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    public String createResetToken(String email) {
        User user = findByEmail(email).orElseThrow(() -> new IllegalArgumentException("Không tìm thấy email."));
        String token = UUID.randomUUID().toString();
        user.setResetToken(token);
        userDao.update(user);
        mailService.sendResetPassword(user, token);
        return token;
    }

    public boolean resetPassword(String token, String newPassword) {
        Optional<User> user = userDao.findByResetToken(token);
        if (!user.isPresent()) {
            return false;
        }
        user.get().setPasswordHash(PasswordUtil.sha256(newPassword));
        user.get().setResetToken(null);
        userDao.update(user.get());
        return true;
    }

    public void updateProfile(User user, String firstName, String lastName, String phone, String address) {
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPhone(phone);
        user.setAddress(address);
        userDao.update(user);
    }

    public boolean changePassword(User user, String oldPassword, String newPassword) {
        if (!PasswordUtil.matches(oldPassword, user.getPasswordHash())) {
            return false;
        }
        user.setPasswordHash(PasswordUtil.sha256(newPassword));
        userDao.update(user);
        return true;
    }
}
