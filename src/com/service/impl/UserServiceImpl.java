package com.service.impl;

import com.dao.UserDao;
import com.dao.impl.userDaoImpl;
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

/*    @Override
    public List<Object> selectAllTraveller() {
        return userDao.selectAllTraveller();
    }

    @Override
    public List<Object> selectAllOrder() {
        return userDao.selectAllOrder();
    }

    @Override
    public List<Object> selectAllOrder(String page, String limit) {
        return userDao.selectAllOrder(page, limit);
    }

    @Override
    public int travellerCount() {
        return userDao.travellerCount();
    }*/
}
