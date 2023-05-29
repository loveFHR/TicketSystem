package com.dao;

import com.pojo.Order;

import java.util.List;

public interface OrderDao {
    Order selectUserAndFlightById(String userName,Integer flightId);
    void insertOrder(Order order);
    List<Order> selectByUserName(String name,String page, String limit);
    int selectByUserNameCount(String name);
    List<Order> selectAllOrder(String page, String limit);
    int selectAllOrderCount();
    List<Order> selectTicketByName(String name,String page, String limit);
    void updateStatus(Integer orderId,String status);
    List<Order> companySelectOrder(String name,String startAdd,String createTime, String page, String limit);
    int companySelectOrderCount(String name,String startAdd,String createTime);
}
