package com.service;

import com.pojo.Order;

import java.util.List;

public interface OrderService {
    Order selectUserAndFlightById(String userName, Integer flightId);
    void insertOrder(Order order);
    List<Order> selectByUserName(String name);
}