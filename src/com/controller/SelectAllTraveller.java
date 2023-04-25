package com.controller;


import com.alibaba.fastjson.JSONObject;
import com.pojo.Order;
import com.pojo.Vo;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.List;

@WebServlet("/SelectAllTraveller")
public class SelectAllTraveller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");

        UserService userService = new UserServiceImpl();
        List<Object> list = userService.selectAllOrder(page,limit);

        resp.setContentType("text/html;charset=utf-8");
        Vo vo = new Vo();
        vo.setCode(0);
        vo.setMsg("success");
        vo.setCount(userService.travellerCount());
        vo.setData(list);
        resp.getWriter().write(JSONObject.toJSON(vo).toString());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
