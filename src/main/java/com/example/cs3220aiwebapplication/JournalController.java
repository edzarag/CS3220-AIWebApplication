package com.example.cs3220aiwebapplication;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/entries")
public class JournalController {

    private final List<JournalEntry> entries = new ArrayList<>();
    private final AuthController authController;
    private long nextEntryId = 1;

    public JournalController(AuthController authController) {
        this.authController = authController;
    }

    private Optional<User> currentUser(HttpSession session) {
        Long uid = (Long) session.getAttribute("userId");
        if (uid == null) return Optional.empty();
        return authController.findById(uid);
    }

    @GetMapping
    public String list(Model model, HttpSession session) {
        Optional<User> u = currentUser(session);
        if (u.isEmpty()) return "redirect:/login";

        List<JournalEntry> userEntries = entries.stream()
                .filter(e -> e.getUser().getId().equals(u.get().getId()))
                .sorted(Comparator.comparing(JournalEntry::getCreatedAt).reversed())
                .collect(Collectors.toList());

        model.addAttribute("entries", userEntries);
        model.addAttribute("username", u.get().getUsername());
        return "journalentries";
    }

    @GetMapping("/new")
    public String newEntry(HttpSession session, Model model) {
        if (currentUser(session).isEmpty()) return "redirect:/login";
        return "newentry";
    }

    @PostMapping("/new")
    public String create(@RequestParam String title,
                         @RequestParam String content,
                         @RequestParam(required = false) String mood,
                         HttpSession session) {

        Optional<User> u = currentUser(session);
        if (u.isEmpty()) return "redirect:/login";

        JournalEntry e = new JournalEntry();
        e.setId(nextEntryId++);
        e.setUser(u.get());
        e.setTitle(title);
        e.setContent(content);
        e.setMood(mood);
        e.setCreatedAt(LocalDateTime.now());

        entries.add(e);
        return "redirect:/entries";
    }

    @GetMapping("/{id}")
    public String view(@PathVariable Long id, HttpSession session, Model model) {
        Optional<User> u = currentUser(session);
        if (u.isEmpty()) return "redirect:/login";

        return entries.stream()
                .filter(e -> e.getId().equals(id) && e.getUser().getId().equals(u.get().getId()))
                .findFirst()
                .map(e -> {
                    model.addAttribute("entry", e);
                    model.addAttribute("username", u.get().getUsername());
                    return "viewentry";
                })
                .orElse("redirect:/entries");
    }

    @GetMapping("/{id}/edit")
    public String editPage(@PathVariable Long id, HttpSession session, Model model) {
        Optional<User> u = currentUser(session);
        if (u.isEmpty()) return "redirect:/login";

        return entries.stream()
                .filter(e -> e.getId().equals(id) && e.getUser().getId().equals(u.get().getId()))
                .findFirst()
                .map(e -> {
                    model.addAttribute("entry", e);
                    model.addAttribute("username", u.get().getUsername());
                    return "editentry";
                })
                .orElse("redirect:/entries");
    }

    @PostMapping("/{id}/edit")
    public String edit(@PathVariable Long id,
                       @RequestParam String title,
                       @RequestParam String content,
                       @RequestParam(required = false) String mood,
                       HttpSession session) {

        Optional<User> u = currentUser(session);
        if (u.isEmpty()) return "redirect:/login";

        entries.stream()
                .filter(e -> e.getId().equals(id) && e.getUser().getId().equals(u.get().getId()))
                .findFirst()
                .ifPresent(e -> {
                    e.setTitle(title);
                    e.setContent(content);
                    e.setMood(mood);
                });

        return "redirect:/entries";
    }

    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id, HttpSession session) {
        Optional<User> u = currentUser(session);
        if (u.isEmpty()) return "redirect:/login";

        entries.removeIf(e -> e.getId().equals(id) && e.getUser().getId().equals(u.get().getId()));

        return "redirect:/entries";
    }
}

