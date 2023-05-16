package com.controller;

import com.pojo.Order;
import com.service.OrderService;
import com.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/order")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        HttpSession session = req.getSession();
        resp.setContentType("text/html;charset=utf-8");
        OrderService orderService = new OrderServiceImpl();
        if (method.equals("insert")){
            String userName = req.getParameter("userName");
            String flightId = req.getParameter("flightId");
            Order order = orderService.selectUserAndFlightById(userName, Integer.parseInt(flightId));
            session.setAttribute("order",order);
            resp.getWriter().write("success");
        }
    }
}
