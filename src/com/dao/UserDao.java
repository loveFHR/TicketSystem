package com.dao;

import com.pojo.User;

import java.util.List;

public interface UserDao {
     Boolean selectUserByNameAndPassword(String name, String password, String identity);
     Boolean selectUserByName(String name);
     void insertUser(String name, String password);
     List<User> selectAllUser(String page, String limit);
     int userCount();
     void updateUserById(Integer userId, User user);
     void deleteUserById(Integer userId);
     User selectUserById(Integer userId);
     User selectByIdAndName(Integer userId,String name);
}
