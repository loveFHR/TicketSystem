package com.dao;

import com.pojo.Order;
import com.pojo.User;

import java.util.List;

public interface UserDao {
     User selectAllUser(String name, String password, String identity);
     List<Object> selectAllTraveller();
     List<Object> selectAllOrder();
     List<Object> selectAllOrder(String page,String limit);

     int travellerCount();
}
