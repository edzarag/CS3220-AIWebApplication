package com.example.cs3220aiwebapplication.controller;

import com.example.cs3220aiwebapplication.model.JournalEntry;
import com.example.cs3220aiwebapplication.service.JournalService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class MoodInsightsController {

    private final JournalService journalService;

    public MoodInsightsController(JournalService journalService) {
        this.journalService = journalService;
    }

    @GetMapping("/mood-insights")
    public String insights(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        List<JournalEntry> entries = journalService.getEntriesFor(username);
        double averageMood = journalService.getAverageMoodFor(username);

        model.addAttribute("entries", entries);
        model.addAttribute("averageMood", averageMood);

        String summary;

        if (entries.isEmpty()) {
            summary = "No entries yet. Start journaling to see AI mood insights!";
        } else if (averageMood < 4) {
            summary = "Your mood has been low lately. Consider resting or talking to someone supportive.";
        } else if (averageMood < 7) {
            summary = "Your mood has been moderate. Keep journaling to better understand your patterns.";
        } else {
            summary = "You're doing great! Keep up your healthy habits and positive mindset.";
        }

        model.addAttribute("summary", summary);
        return "moodinsights";
    }
}