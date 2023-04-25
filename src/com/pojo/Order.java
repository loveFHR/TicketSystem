package com.pojo;

public class Order {
    private Integer id;
    private String name;
    private String gender;
    private String idCard;//身份证
    private String travelTime;
    private String startAdd;
    private String targetAdd;

    public Order() {
    }

    public Order(Integer id, String name, String gender, String idCard, String travelTime, String startAdd, String targetAdd) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.idCard = idCard;
        this.travelTime = travelTime;
        this.startAdd = startAdd;
        this.targetAdd = targetAdd;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getTravelTime() {
        return travelTime;
    }

    public void setTravelTime(String travelTime) {
        this.travelTime = travelTime;
    }

    public String getStartAdd() {
        return startAdd;
    }

    public void setStartAdd(String startAdd) {
        this.startAdd = startAdd;
    }

    public String getTargetAdd() {
        return targetAdd;
    }

    public void setTargetAdd(String targetAdd) {
        this.targetAdd = targetAdd;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", idCard='" + idCard + '\'' +
                ", travelTime='" + travelTime + '\'' +
                ", startAdd='" + startAdd + '\'' +
                ", targetAdd='" + targetAdd + '\'' +
                '}';
    }
}
