package com.example.cs3220aiwebapplication;

import java.time.LocalDateTime;

public class JournalEntry {
    private Long id;
    private User user;
    private String title;
    private String content;
    private String mood;
    private LocalDateTime createdAt;

    public JournalEntry() {
        this.createdAt = LocalDateTime.now();
    }

    public JournalEntry(User user, String title, String content, String mood) {
        this.user = user;
        this.title = title;
        this.content = content;
        this.mood = mood;
        this.createdAt = LocalDateTime.now();
    }

    // getters + setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getMood() { return mood; }
    public void setMood(String mood) { this.mood = mood; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}

