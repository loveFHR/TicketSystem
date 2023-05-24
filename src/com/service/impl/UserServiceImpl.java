package com.service.impl;

import com.dao.UserDao;
import com.dao.impl.userDaoImpl;
import com.pojo.User;
import com.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao userDao = new userDaoImpl();
    @Override
    public Boolean selectUserByNameAndPassword(String name, String password, String identity) {
        return userDao.selectUserByNameAndPassword(name,password,identity);
    }

    @Override
    public Boolean selectUserByName(String name) {
        return userDao.selectUserByName(name);
    }

    @Override
    public void insertUser(String name, String password) {
        userDao.insertUser(name,password);
    }

    @Override
    public List<User> selectAllUser(String page, String limit) {
        return userDao.selectAllUser(page, limit);
    }

    @Override
    public int userCount() {
        return userDao.userCount();
    }

    @Override
    public void updateUserById(Integer userId, User user) {
        userDao.updateUserById(userId,user);
    }

    @Override
    public void deleteUserById(Integer userId) {
        userDao.deleteUserById(userId);
    }

    @Override
    public User selectUserById(Integer userId) {
        return userDao.selectUserById(userId);
    }

    @Override
    public User selectByIdAndName(Integer userId, String name) {
        return userDao.selectByIdAndName(userId, name);
    }
}
