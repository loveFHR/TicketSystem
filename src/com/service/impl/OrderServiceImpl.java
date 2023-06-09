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
    public int selectByUserNameCount(String name) {
        return orderDao.selectByUserNameCount(name);
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
    public int selectAllOrderCount() {
        return orderDao.selectAllOrderCount();
    }

    @Override
    public List<Order> selectTicketByName(String name, String page, String limit) {
        return orderDao.selectTicketByName(name, page, limit);
    }

    @Override
    public List<Order> companySelectOrder(String name, String startAdd, String createTime, String page, String limit) {
        return orderDao.companySelectOrder(name, startAdd, createTime, page, limit);
    }

    @Override
    public int companySelectOrderCount(String name, String startAdd, String createTime) {
        return orderDao.companySelectOrderCount(name, startAdd, createTime);
    }
}
