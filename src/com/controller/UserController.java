package com.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.pojo.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/user")
public class UserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        UserService userService = new UserServiceImpl();
        HttpSession session = req.getSession();
        String method = req.getParameter("method");

        switch (method) {
            case "select": //查询所有用户
                String page = req.getParameter("page");
                String limit = req.getParameter("limit");
                List<User> list = userService.selectAllUser(page, limit);
                Map<String, Object> map = new HashMap<>();
                map.put("code", 0);
                map.put("msg", "");
                map.put("count", userService.userCount());
                map.put("data", list);
                resp.getWriter().write(JSONObject.toJSON(map).toString());
                break;
            case "updForm": { //通过id查找用户
                String userId = req.getParameter("userId");
                User user = userService.selectUserById(Integer.parseInt(userId));//查询出选中要修改用户的信息

                session.setAttribute("user", user); //通过session传数据让前端通过el表达式接收

                resp.getWriter().write("success");
                break;
            }
            case "update": { //修改用户
                String updateData = req.getParameter("updateData");
                User user = JSON.parseObject(updateData, User.class);//将json字符串转为用户对象

                userService.updateUserById(user.getUserId(), user);
                resp.getWriter().write("success");
                break;
            }
            case "delete": { //删除用户
                String delData = req.getParameter("delData");
                userService.deleteUserById(Integer.parseInt(delData));//删除用户

                resp.getWriter().write("success"); //向前端发送成功消息

                break;
            }
        }
    }
}
