package com.controller;

import com.pojo.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CheckRegister")
public class CheckRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");

        UserService userService = new UserServiceImpl();
        Boolean result = userService.selectUserByName(name);
        if(!result){
            userService.insertUser(name,password);
            resp.getWriter().write("success");
        } else {
            resp.getWriter().write("fail");
        }
    }
}
