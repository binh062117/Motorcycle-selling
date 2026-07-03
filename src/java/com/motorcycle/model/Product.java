package com.motorcycle.model;

import java.math.BigDecimal;

public class Product extends BaseEntity {
    private String name;
    private String sku;
    private Brand brand;
    private Category category;
    private BigDecimal price;
    private int stock;
    private String displacement;
    private String horsepower;
    private String weight;
    private String imageUrl;
    private String description;
    private boolean active = true;

    public Product() {
    }

    public Product(int id, String name, String sku, Brand brand, Category category, BigDecimal price, int stock) {
        super(id);
        this.name = name;
        this.sku = sku;
        this.brand = brand;
        this.category = category;
        this.price = price;
        this.stock = stock;
    }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; touch(); }
    public String getSku() { return sku; }
    public void setSku(String sku) { this.sku = sku; touch(); }
    public Brand getBrand() { return brand; }
    public void setBrand(Brand brand) { this.brand = brand; touch(); }
    public Category getCategory() { return category; }
    public void setCategory(Category category) { this.category = category; touch(); }
    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; touch(); }
    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; touch(); }
    public String getDisplacement() { return displacement; }
    public void setDisplacement(String displacement) { this.displacement = displacement; touch(); }
    public String getHorsepower() { return horsepower; }
    public void setHorsepower(String horsepower) { this.horsepower = horsepower; touch(); }
    public String getWeight() { return weight; }
    public void setWeight(String weight) { this.weight = weight; touch(); }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; touch(); }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; touch(); }
    public boolean isActive() { return active; }
    public void setActive(boolean active) { this.active = active; touch(); }
}
