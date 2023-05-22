package com.pojo;

public class Order {
    private Integer orderId;
    private String cabin;//舱位
    private String notes;//备注
    private String status;//状态
    private User user;
    private Flight flight;
    public Order() {
    }

    public Order(Integer orderId, String cabin, User user, Flight flight) {
        this.orderId = orderId;
        this.cabin = cabin;
        this.user = user;
        this.flight = flight;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getCabin() {
        return cabin;
    }

    public void setCabin(String cabin) {
        this.cabin = cabin;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Flight getFlight() {
        return flight;
    }

    public void setFlight(Flight flight) {
        this.flight = flight;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", cabin='" + cabin + '\'' +
                ", notes='" + notes + '\'' +
                ", status='" + status + '\'' +
                ", user=" + user +
                ", flight=" + flight +
                '}';
    }
}
