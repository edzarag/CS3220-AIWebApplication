package com.example.cs3220aiwebapplication;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    private final AuthController authController;

    public HomeController(AuthController authController) {
        this.authController = authController;
    }

    @GetMapping("/")
    public String home(HttpSession session, Model model) {
        Long uid = (Long) session.getAttribute("userId");

        if (uid != null) {
            authController.findById(uid).ifPresent(u -> model.addAttribute("username", u.getUsername()));
        }

        return "homepage";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        Long uid = (Long) session.getAttribute("userId");

        if (uid == null) return "redirect:/login";

        authController.findById(uid).ifPresent(u -> model.addAttribute("username", u.getUsername()));

        return "dashboard";
    }
}