package com.pojo;


public class Flight {
    private Integer flightId;
    private String flightNumber;
    private String startDate;
    private String startTime;
    private String startAdd;
    private String targetAdd;
    private Integer totalSeats;
    private Integer availableSeats;
    private Double price;

    public Flight() {
    }

    public Flight(Integer flightId, String flightNumber, String startDate, String startTime, String startAdd,
                  String targetAdd, Integer totalSeats, Integer availableSeats, Double price) {
        this.flightId = flightId;
        this.flightNumber = flightNumber;
        this.startDate = startDate;
        this.startTime = startTime;
        this.startAdd = startAdd;
        this.targetAdd = targetAdd;
        this.totalSeats = totalSeats;
        this.availableSeats = availableSeats;
        this.price = price;
    }

    public Integer getFlightId() {
        return flightId;
    }

    public void setFlightId(Integer flightId) {
        this.flightId = flightId;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
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

    public Integer getTotalSeats() {
        return totalSeats;
    }

    public void setTotalSeats(Integer totalSeats) {
        this.totalSeats = totalSeats;
    }

    public Integer getAvailableSeats() {
        return availableSeats;
    }

    public void setAvailableSeats(Integer availableSeats) {
        this.availableSeats = availableSeats;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Flight{" +
                "flightId='" + flightId + '\'' +
                ", flightNumber='" + flightNumber + '\'' +
                ", startDate='" + startDate + '\'' +
                ", startTime='" + startTime + '\'' +
                ", startAdd='" + startAdd + '\'' +
                ", targetAdd='" + targetAdd + '\'' +
                ", totalSeats=" + totalSeats +
                ", availableSeats=" + availableSeats +
                ", price=" + price +
                '}';
    }
}
