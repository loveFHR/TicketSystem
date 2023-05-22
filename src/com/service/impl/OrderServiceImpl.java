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
    public List<Order> selectByUserName(String name) {
        return orderDao.selectByUserName(name);
    }
}
