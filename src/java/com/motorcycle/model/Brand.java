package com.motorcycle.model;

public class Brand extends BaseEntity {
    private String name;
    private String origin;

    public Brand() {
    }

    public Brand(int id, String name, String origin) {
        super(id);
        this.name = name;
        this.origin = origin;
    }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; touch(); }
    public String getOrigin() { return origin; }
    public void setOrigin(String origin) { this.origin = origin; touch(); }
}
