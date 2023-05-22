package com.dao.impl;

import com.dao.OrderDao;
import com.pojo.Flight;
import com.pojo.Order;
import com.pojo.User;
import com.util.JNDIUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao {
    @Override
    public Order selectUserAndFlightById(String userName, Integer flightId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JNDIUtils.getConnection();
            String sql = "SELECT * FROM user ,flight WHERE username = ? AND f_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,userName);
            ps.setInt(2,flightId);
            rs = ps.executeQuery();
            Order order = new Order();
            User user = new User();
            Flight flight = new Flight();
            if (rs.next()){
                user.setUserId(rs.getInt("u_id"));
                user.setName(rs.getString("username"));
                user.setIdNumber(rs.getString("id_number"));
                user.setGender(rs.getString("gender"));
                flight.setFlightId(rs.getInt("f_id"));
                flight.setFlightNumber(rs.getString("f_number"));
                flight.setStartDate(rs.getDate("start_date").toString());//把数据库Date类型转成字符串
                flight.setStartTime(rs.getTime("start_time").toString());//把数据库Time类型转成字符串
                flight.setStartAdd(rs.getString("start_add"));
                flight.setTargetAdd(rs.getString("target_add"));
                flight.setTotalSeats(rs.getInt("total_seats"));
                flight.setAvailableSeats(rs.getInt("available_seats"));
                flight.setPrice(rs.getDouble("price"));
                order.setUser(user);
                order.setFlight(flight);
            }
            return order;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,rs);
        }
        return null;
    }

    @Override
    public void insertOrder(Order order) {
        Connection conn = null;
        PreparedStatement ps = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "insert into `order` values (null,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,order.getUser().getUserId());
            ps.setInt(2,order.getFlight().getFlightId());
            ps.setString(3,order.getCabin());
            ps.setString(4,order.getNotes());
            ps.setString(5,order.getStatus());
            ps.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,null);
        }
    }

    @Override
    public List<Order> selectByUserName(String name) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JNDIUtils.getConnection();
            String sql = "select * from `order`,flight,`user` where flight_id = f_id and user_id = u_id and username = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            rs = ps.executeQuery();
            List list = new ArrayList();
            while (rs.next()) {
                Order order = new Order();
                User user = new User();
                Flight flight = new Flight();
                user.setName(rs.getString("username"));
                user.setIdNumber(rs.getString("id_number"));
                flight.setFlightNumber(rs.getString("f_number"));
                flight.setStartDate(rs.getDate("start_date").toString());
                flight.setStartTime(rs.getTime("start_time").toString());
                flight.setStartAdd(rs.getString("start_add"));
                flight.setTargetAdd(rs.getString("target_add"));
                order.setStatus(rs.getString("status"));
                order.setCabin(rs.getString("cabin"));
                order.setNotes(rs.getString("notes"));
                order.setUser(user);
                order.setFlight(flight);
                list.add(order);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,rs);
        }
        return null;
    }
}
