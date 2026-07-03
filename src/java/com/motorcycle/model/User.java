package com.motorcycle.model;

public class User extends BaseEntity {
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String address;
    private String passwordHash;
    private Role role;
    private boolean active = true;
    private String resetToken;

    public User() {
    }

    public User(int id, String firstName, String lastName, String email, String phone, String passwordHash, Role role) {
        super(id);
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.passwordHash = passwordHash;
        this.role = role;
    }

    public String getFullName() {
        return ((lastName == null ? "" : lastName) + " " + (firstName == null ? "" : firstName)).trim();
    }

    public boolean isAdmin() {
        return role != null && "Admin".equalsIgnoreCase(role.getName());
    }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; touch(); }
    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; touch(); }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; touch(); }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; touch(); }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; touch(); }
    public String getPasswordHash() { return passwordHash; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; touch(); }
    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; touch(); }
    public boolean isActive() { return active; }
    public void setActive(boolean active) { this.active = active; touch(); }
    public String getResetToken() { return resetToken; }
    public void setResetToken(String resetToken) { this.resetToken = resetToken; touch(); }
}
