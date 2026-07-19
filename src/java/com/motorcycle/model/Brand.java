package com.motorcycle.model;

import java.text.Normalizer;

public class Brand extends BaseEntity {
    private String name;
    private String origin;
    private String logoUrl;

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
    public String getOriginCode() {
        if (origin == null) {
            return "unknown";
        }
        String normalized = Normalizer.normalize(origin.trim(), Normalizer.Form.NFD)
                .replaceAll("\\p{M}", "")
                .toLowerCase();
        if ("y".equals(normalized) || "italy".equals(normalized) || "italia".equals(normalized)) {
            return "italy";
        }
        if ("nhat ban".equals(normalized) || "japan".equals(normalized)) {
            return "japan";
        }
        if ("phap".equals(normalized) || "france".equals(normalized)) {
            return "france";
        }
        return "unknown";
    }
    public String getLogoUrl() { return logoUrl; }
    public void setLogoUrl(String logoUrl) { this.logoUrl = logoUrl; touch(); }
}
