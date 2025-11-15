package com.example.cs3220aiwebapplication.controller;

import com.example.cs3220aiwebapplication.model.JournalEntry;
import com.example.cs3220aiwebapplication.service.AiService;
import com.example.cs3220aiwebapplication.service.JournalService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/entries")
public class JournalController {

    private final JournalService journalService;
    private final AiService aiService;

    public JournalController(JournalService journalService, AiService aiService) {
        this.journalService = journalService;
        this.aiService = aiService;
    }

    private String requireLogin(HttpSession session) {
        return (String) session.getAttribute("username");
    }

    @GetMapping
    public String list(HttpSession session, Model model) {
        String username = requireLogin(session);
        if (username == null) return "redirect:/login";

        List<JournalEntry> entries = journalService.getEntriesFor(username);
        model.addAttribute("entries", entries);
        return "journalentries";
    }

    @GetMapping("/new")
    public String newEntry(HttpSession session) {
        if (requireLogin(session) == null) return "redirect:/login";
        return "newentry";
    }

    @PostMapping("/new")
    public String create(@RequestParam String text,
                         @RequestParam int mood,
                         HttpSession session) {

        String username = requireLogin(session);
        if (username == null) return "redirect:/login";

        JournalEntry entry = new JournalEntry();
        entry.setText(text);
        entry.setMood(mood);
        entry.setOwner(username);

        aiService.analyze(entry);
        journalService.add(entry);

        return "redirect:/entries";
    }

    @GetMapping("/{id}")
    public String view(@PathVariable int id,
                       HttpSession session,
                       Model model) {

        String username = requireLogin(session);
        if (username == null) return "redirect:/login";

        JournalEntry entry = journalService.getById(id);
        if (entry == null || !entry.getOwner().equals(username))
            return "redirect:/entries";

        model.addAttribute("entry", entry);
        return "viewentry";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable int id,
                           HttpSession session,
                           Model model) {

        String username = requireLogin(session);
        if (username == null) return "redirect:/login";

        JournalEntry entry = journalService.getById(id);
        if (entry == null || !entry.getOwner().equals(username))
            return "redirect:/entries";

        model.addAttribute("entry", entry);
        return "editentry";
    }

    @PostMapping("/{id}/edit")
    public String update(@PathVariable int id,
                         @RequestParam String text,
                         @RequestParam int mood,
                         HttpSession session) {

        String username = requireLogin(session);
        if (username == null) return "redirect:/login";

        JournalEntry entry = journalService.getById(id);
        if (entry == null || !entry.getOwner().equals(username))
            return "redirect:/entries";

        entry.setText(text);
        entry.setMood(mood);
        aiService.analyze(entry);
        journalService.update(entry);

        return "redirect:/entries/" + id;
    }

    @GetMapping("/{id}/delete")
    public String deleteForm(@PathVariable int id,
                             HttpSession session,
                             Model model) {

        String username = requireLogin(session);
        if (username == null) return "redirect:/login";

        JournalEntry entry = journalService.getById(id);
        if (entry == null || !entry.getOwner().equals(username))
            return "redirect:/entries";

        model.addAttribute("entry", entry);
        return "deleteentry";
    }

    @PostMapping("/{id}/delete")
    public String delete(@PathVariable int id,
                         HttpSession session) {

        String username = requireLogin(session);
        if (username == null) return "redirect:/login";

        JournalEntry entry = journalService.getById(id);
        if (entry != null && entry.getOwner().equals(username))
            journalService.delete(id);

        return "redirect:/entries";
    }
}