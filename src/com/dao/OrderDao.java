package com.dao;

import com.pojo.Order;

import java.util.List;

public interface OrderDao {
    Order selectUserAndFlightById(String userName,Integer flightId);
}
