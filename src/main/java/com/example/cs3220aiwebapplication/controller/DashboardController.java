package com.example.cs3220aiwebapplication.controller;

import com.example.cs3220aiwebapplication.service.JournalService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    private final JournalService journalService;

    public DashboardController(JournalService journalService) {
        this.journalService = journalService;
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        String fullName = (String) session.getAttribute("fullName");

        if (username == null) return "redirect:/login";

        model.addAttribute("fullName", fullName);
        model.addAttribute("averageMood", journalService.getAverageMoodFor(username));

        return "dashboard";
    }
}