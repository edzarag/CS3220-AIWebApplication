package com.example.cs3220aiwebapplication;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class AuthController {

    private final List<User> users = new ArrayList<>();
    private long nextUserId = 1;

    @GetMapping("/login")
    public String loginPage(Model model, HttpSession session) {
        // if already logged in, redirect to dashboard
        Long uid = (Long) session.getAttribute("userId");
        if (uid != null) {
            return "redirect:/dashboard";
        }
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {

        Optional<User> u = users.stream()
                .filter(user -> user.getUsername().equals(username))
                .findFirst();

        if (u.isPresent() && u.get().getPassword().equals(password)) {
            session.setAttribute("userId", u.get().getId());
            return "redirect:/dashboard";
        }

        model.addAttribute("error", "Invalid username or password");
        model.addAttribute("username", username);
        return "login";
    }

    @GetMapping("/register")
    public String registerPage(HttpSession session) {
        Long uid = (Long) session.getAttribute("userId");
        if (uid != null) {
            return "redirect:/dashboard";
        }
        return "register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String username,
                           @RequestParam String password,
                           HttpSession session,
                           Model model) {

        if (users.stream().anyMatch(u -> u.getUsername().equals(username))) {
            model.addAttribute("error", "Username already exists");
            model.addAttribute("username", username);
            return "register";
        }

        User u = new User(username, password);
        u.setId(nextUserId++);
        users.add(u);

        session.setAttribute("userId", u.getId());
        return "redirect:/dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    // helper to get user by ID
    public Optional<User> findById(Long id) {
        return users.stream().filter(u -> u.getId().equals(id)).findFirst();
    }

    @PostConstruct
    public void init() {
        User testUser = new User("testuser", "Test@1234");
        testUser.setId(nextUserId++);
        users.add(testUser);
    }
}