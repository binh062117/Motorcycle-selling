package com.motorcycle.model;

public class Notification extends BaseEntity {
    private User user;
    private String title;
    private String message;
    private boolean read;

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; touch(); }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; touch(); }
    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; touch(); }
    public boolean isRead() { return read; }
    public void setRead(boolean read) { this.read = read; touch(); }
}
