package com.motorcycle.service;

import com.motorcycle.dao.RoleDao;
import com.motorcycle.dao.UserDao;
import com.motorcycle.model.Role;
import com.motorcycle.model.User;
import java.util.List;

public class AdminService {
    private final UserDao userDao = new UserDao();
    private final RoleDao roleDao = new RoleDao();

    public List<User> findUsers() {
        return userDao.findAll();
    }

    public boolean updateRole(int accountId, String roleName) {
        Role role = roleDao.findByName(roleName).orElse(new Role(2, "Customer"));
        return userDao.updateRole(accountId, role.getId());
    }
}
