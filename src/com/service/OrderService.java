package com.service;

import com.pojo.Order;

import java.util.List;

public interface OrderService {
    Order selectUserAndFlightById(String userName, Integer flightId);
    void insertOrder(Order order);
    List<Order> selectByUserName(String name,String page, String limit);
    List<Order> selectAllOrder(String page, String limit);
    List<Order> selectTicketByName(String name,String page, String limit);
    void updateStatus(Integer orderId,String status);
}