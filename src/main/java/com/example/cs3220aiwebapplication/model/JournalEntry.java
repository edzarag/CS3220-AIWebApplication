package com.example.cs3220aiwebapplication.model;

import java.time.LocalDate;
import java.util.List;

public class JournalEntry {

    private int id;
    private LocalDate date;
    private String text;
    private int mood;
    private String aiMood;
    private String aiSentiment;
    private List<String> aiTips;
    private String owner; // username

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public LocalDate getDate() { return date; }

    public void setDate(LocalDate date) { this.date = date; }

    public String getText() { return text; }

    public void setText(String text) { this.text = text; }

    public int getMood() { return mood; }

    public void setMood(int mood) { this.mood = mood; }

    public String getAiMood() { return aiMood; }

    public void setAiMood(String aiMood) { this.aiMood = aiMood; }

    public String getAiSentiment() { return aiSentiment; }

    public void setAiSentiment(String aiSentiment) { this.aiSentiment = aiSentiment; }

    public List<String> getAiTips() { return aiTips; }

    public void setAiTips(List<String> aiTips) { this.aiTips = aiTips; }

    public String getOwner() { return owner; }

    public void setOwner(String owner) { this.owner = owner; }
}