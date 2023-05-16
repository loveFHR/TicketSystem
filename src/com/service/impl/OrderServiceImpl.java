package com.service.impl;

import com.dao.OrderDao;
import com.dao.impl.OrderDaoImpl;
import com.pojo.Order;
import com.service.OrderService;

public class OrderServiceImpl implements OrderService {
    OrderDao orderDao = new OrderDaoImpl();
    @Override
    public Order selectUserAndFlightById(String userName, Integer flightId) {
        return orderDao.selectUserAndFlightById(userName,flightId);
    }
}
