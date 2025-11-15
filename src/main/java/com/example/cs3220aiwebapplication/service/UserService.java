package com.example.cs3220aiwebapplication.service;

import com.example.cs3220aiwebapplication.model.User;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class UserService {

    private final Map<String, User> users = new HashMap<>();

    public boolean register(String fullName, String username, String password) {
        if (users.containsKey(username)) return false;

        User u = new User();
        u.setFullName(fullName);
        u.setUsername(username);
        u.setPassword(password);

        users.put(username, u);
        return true;
    }

    public User validateLogin(String username, String password) {
        User u = users.get(username);
        if (u != null && u.getPassword().equals(password)) return u;
        return null;
    }
}