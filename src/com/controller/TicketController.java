package com.controller;

import com.service.OrderService;
import com.service.TicketService;
import com.service.impl.OrderServiceImpl;
import com.service.impl.TicketServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ticket")
public class TicketController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        HttpSession session = req.getSession();
        resp.setContentType("text/html;charset=utf-8");
        TicketService ticketService = new TicketServiceImpl();
        OrderService orderService = new OrderServiceImpl();
        if (method.equals("insert")){
            String orderId = req.getParameter("orderId");
            orderService.updateStatus(Integer.parseInt(orderId),"已打印");
            ticketService.insertById(Integer.parseInt(orderId));
            resp.getWriter().write("success");
        }
    }
}
