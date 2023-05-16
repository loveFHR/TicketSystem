package com.dao.impl;

import com.dao.OrderDao;
import com.pojo.Flight;
import com.pojo.Order;
import com.pojo.User;
import com.util.JNDIUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
                user.setName(rs.getString("username"));
                user.setIdNumber(rs.getString("id_number"));
                user.setGender(rs.getString("gender"));
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
}
