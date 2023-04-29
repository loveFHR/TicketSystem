package com.dao;

import com.pojo.Order;
import com.pojo.User;

import java.util.List;

public interface UserDao {
     Boolean selectUserByNameAndPassword(String name, String password, String identity);
     Boolean selectUserByName(String name);
     void insertUser(String name, String password);
     /*List<Object> selectAllTraveller();
     List<Object> selectAllOrder();
     List<Object> selectAllOrder(String page,String limit);

     int travellerCount();*/
}
