package com.pojo;

public class User {
    private String name;
    private String password;
    private String identity;//身份

    public User() {
    }

    public User(String name, String password, String identity) {
        this.name = name;
        this.password = password;
        this.identity = identity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    @Override
    public String toString() {
        return "Login{" +
                "name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", identity='" + identity + '\'' +
                '}';
    }

}
