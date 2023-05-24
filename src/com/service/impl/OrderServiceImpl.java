package com.service.impl;

import com.dao.OrderDao;
import com.dao.impl.OrderDaoImpl;
import com.pojo.Order;
import com.service.OrderService;

import java.util.List;

public class OrderServiceImpl implements OrderService {
    OrderDao orderDao = new OrderDaoImpl();
    @Override
    public Order selectUserAndFlightById(String userName, Integer flightId) {
        return orderDao.selectUserAndFlightById(userName,flightId);
    }

    @Override
    public void insertOrder(Order order) {
        orderDao.insertOrder(order);
    }

    @Override
    public List<Order> selectByUserName(String name,String page, String limit) {
        return orderDao.selectByUserName(name,page,limit);
    }

    @Override
    public void updateStatus(Integer orderId, String status) {
        orderDao.updateStatus(orderId, status);
    }
    @Override
    public List<Order> selectAllOrder(String page, String limit) {
        return orderDao.selectAllOrder(page, limit);
    }

    @Override
    public List<Order> selectTicketByName(String name, String page, String limit) {
        return orderDao.selectTicketByName(name, page, limit);
    }
}
