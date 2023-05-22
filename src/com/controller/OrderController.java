package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.pojo.Order;
import com.service.FlightService;
import com.service.OrderService;
import com.service.impl.FlightServiceImpl;
import com.service.impl.OrderServiceImpl;

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
        FlightService flightService = new FlightServiceImpl();
        switch (method) {
            case "selectUserAndFlightById": {
                String userName = req.getParameter("userName");
                String flightId = req.getParameter("flightId");
                Order order = orderService.selectUserAndFlightById(userName, Integer.parseInt(flightId));
                session.setAttribute("order", order);
                resp.getWriter().write("success");
                break;
            }
            case "insert": {
                String cabin = req.getParameter("cabin");
                String notes = req.getParameter("notes");
                String status = req.getParameter("status");
                Order order = (Order) session.getAttribute("order");
                order.setCabin(cabin);
                order.setNotes(notes);
                order.setStatus(status);
                orderService.insertOrder(order);
                flightService.updateSeats(order.getFlight().getFlightId(), "-");//修改可用座位数

                session.removeAttribute("order");
                break;
            }
            case "selectByUserName":
                String name = req.getParameter("name");
                List<Order> list = orderService.selectByUserName(name);
                Map<String,Object> map = new HashMap<>();
                map.put("code", 0);
                map.put("msg", "");
                map.put("count", list.size());
                map.put("data", list);
                resp.getWriter().write(JSONObject.toJSON(map).toString());//向前端发送数据
                break;
        }
    }
}
