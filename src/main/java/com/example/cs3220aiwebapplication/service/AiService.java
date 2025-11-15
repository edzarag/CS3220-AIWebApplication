package com.example.cs3220aiwebapplication.service;

import com.example.cs3220aiwebapplication.model.JournalEntry;
import org.springframework.stereotype.Service;

import java.util.Arrays;

@Service
public class AiService {

    public void analyze(JournalEntry entry) {
        int mood = entry.getMood();

        if (mood <= 3) {
            entry.setAiMood("Very Low");
            entry.setAiSentiment("Negative");
            entry.setAiTips(Arrays.asList(
                    "Reach out to a supportive person.",
                    "Take a small walk outside.",
                    "Try breathing exercises."
            ));
        }
        else if (mood <= 7) {
            entry.setAiMood("Moderate");
            entry.setAiSentiment("Neutral");
            entry.setAiTips(Arrays.asList(
                    "Keep journaling your thoughts.",
                    "Stay hydrated and take a break.",
                    "Get a bit of sunlight."
            ));
        }
        else {
            entry.setAiMood("High");
            entry.setAiSentiment("Positive");
            entry.setAiTips(Arrays.asList(
                    "Celebrate your achievements!",
                    "Share something good with a friend.",
                    "Reward yourself for your progress."
            ));
        }
    }
}