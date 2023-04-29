package com.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import com.pojo.Flight;
import com.service.FlightService;
import com.service.impl.FlightServiceImpl;

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

@WebServlet("/flight")
public class FlightController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String method = req.getParameter("method");
        FlightService flightService = new FlightServiceImpl();
        HttpSession session = req.getSession();

        if (method.equals("select")){  //显示所有航班
            String page = req.getParameter("page");
            String limit = req.getParameter("limit");//点击对应页数时发送的数据，页数，每页数量

            List<Flight> list = flightService.selectAllFlight(page,limit);
            Map<String,Object> map = new HashMap<>();
            map.put("code",0);
            map.put("msg","");
            map.put("count",flightService.countFlight());
            map.put("data",list);
            resp.getWriter().write(JSONObject.toJSON(map).toString());//向前端发送数据

        } else if (method.equals("insert")) { //添加航班信息
            String addData = req.getParameter("addData"); //从前端取得添加航班的json字符串
            Flight flight = JSON.parseObject(addData, Flight.class);//将json字符串转为航班对象

            flightService.insertFlight(flight); //添加用户
            resp.getWriter().write("success"); //向前端发送成功消息

        } else if (method.equals("updForm")) { //通过ID查询航班并将信息写入表单方便修改
            String flightId = req.getParameter("flightId");
            Flight flight = flightService.selectFlightById(Integer.parseInt(flightId));//查询出选中要修改航班的信息
            session.setAttribute("flight",flight); //通过session传数据让前端通过el表达式接收
            session.setAttribute("flightId",flightId);
            System.out.println(flightId);
            resp.getWriter().write("success");

        } else if (method.equals("update")) {
            String updateData = req.getParameter("updateData");
            Flight flight = JSON.parseObject(updateData, Flight.class);//将json字符串转为航班对象
            flightService.updateFlightById(flight.getFlightId(),flight);
            resp.getWriter().write("success");

        } else if (method.equals("delete")) {

        }
    }
}
