package com.service;

import com.dao.UserDao;
import com.pojo.Order;
import com.pojo.User;

import java.util.List;

public interface UserService {

    Boolean selectUserByNameAndPassword(String name, String password,String identity);
    Boolean selectUserByName(String name);
    void insertUser(String name, String password);
    /*List<Object> selectAllTraveller();
    List<Object> selectAllOrder();

    List<Object> selectAllOrder(String page,String limit);

    int travellerCount();*/
}
