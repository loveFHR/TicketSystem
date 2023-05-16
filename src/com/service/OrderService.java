package com.service;

import com.pojo.Order;

public interface OrderService {
    Order selectUserAndFlightById(String userName, Integer flightId);
}
