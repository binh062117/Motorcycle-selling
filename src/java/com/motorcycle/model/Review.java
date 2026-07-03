package com.motorcycle.model;

public class Review extends BaseEntity {
    private User user;
    private Product product;
    private int rating;
    private String comment;

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; touch(); }
    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; touch(); }
    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; touch(); }
    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; touch(); }
}
