package com.example.cs3220aiwebapplication.service;

import com.example.cs3220aiwebapplication.model.JournalEntry;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class JournalService {

    private final List<JournalEntry> entries = new ArrayList<>();
    private int nextId = 1;

    public List<JournalEntry> getEntriesFor(String username) {
        List<JournalEntry> result = new ArrayList<>();
        for (JournalEntry e : entries) {
            if (e.getOwner().equals(username)) result.add(e);
        }
        return result;
    }

    public JournalEntry getById(int id) {
        for (JournalEntry e : entries) {
            if (e.getId() == id) return e;
        }
        return null;
    }

    public void add(JournalEntry entry) {
        entry.setId(nextId++);
        entry.setDate(LocalDate.now());
        entries.add(entry);
    }

    public void update(JournalEntry updated) {
        for (int i = 0; i < entries.size(); i++) {
            if (entries.get(i).getId() == updated.getId()) {
                entries.set(i, updated);
                return;
            }
        }
    }

    public void delete(int id) {
        entries.removeIf(e -> e.getId() == id);
    }

    public double getAverageMoodFor(String username) {
        List<JournalEntry> userEntries = getEntriesFor(username);
        if (userEntries.isEmpty()) return 0;

        int sum = 0;
        for (JournalEntry e : userEntries) sum += e.getMood();

        return (double) sum / userEntries.size();
    }
}