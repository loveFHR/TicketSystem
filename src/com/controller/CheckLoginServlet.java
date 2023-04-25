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

@WebServlet("/CheckLogin")
public class CheckLoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String identity = request.getParameter("identity");

        UserService userService = new UserServiceImpl();
        User user = userService.selectAllUser(name, password, identity);
        if (user != null && user.getIdentity().equals("company")) {
            response.getWriter().write("company");
        } else if (user != null && user.getIdentity().equals("traveller")) {
            response.getWriter().write("traveller");
        } else {
            response.getWriter().write("fail");
        }
    }
}
