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
    /**
     * 在订票时将用户和航班联合查询
     * @param userName
     * @param flightId
     * @return
     */
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

    /**
     * 订票成功后添加订单
     * @param order
     */
    @Override
    public void insertOrder(Order order) {
        Connection conn = null;
        PreparedStatement ps = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "insert into `order` (user_id, flight_id, cabin, notes, `status`) values (?,?,?,?,?)";
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

    /**
     * 通过用户姓名查询订单
     * @param name
     * @return
     */
    @Override
    public List<Order> selectByUserName(String name,String page, String limit) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JNDIUtils.getConnection();
            String sql = "select * from `order`,flight,`user` where flight_id = f_id and user_id = u_id and username = ? order by `create_time` desc limit ?,?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.setInt(2,(Integer.parseInt(page)-1)*Integer.parseInt(limit));//（页数-1）* 每页数量
            ps.setInt(3,Integer.parseInt(limit)); //每页的数量
            rs = ps.executeQuery();
            List list = new ArrayList();
            while (rs.next()) {
                Order order = new Order();
                User user = new User();
                Flight flight = new Flight();
                user.setName(rs.getString("username"));
                user.setIdNumber(rs.getString("id_number"));
                flight.setFlightId(rs.getInt("flight_id"));
                flight.setFlightNumber(rs.getString("f_number"));
                flight.setStartDate(rs.getDate("start_date").toString());
                flight.setStartTime(rs.getTime("start_time").toString());
                flight.setStartAdd(rs.getString("start_add"));
                flight.setTargetAdd(rs.getString("target_add"));
                flight.setPrice(rs.getDouble("price"));
                order.setOrderId(rs.getInt("order_id"));
                order.setStatus(rs.getString("status"));
                order.setCabin(rs.getString("cabin"));
                order.setNotes(rs.getString("notes"));
                order.setCreateTime(rs.getTimestamp("create_time").toString());
                order.setUpdateTime(rs.getTimestamp("update_time").toString());
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

    @Override
    public int selectByUserNameCount(String name) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JNDIUtils.getConnection();
            String sql = "select count(*) from `order`,flight,`user` where flight_id = f_id and user_id = u_id and username = ? order by `create_time` desc";
            ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.executeQuery();
            if (rs.next())
                return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,rs);
        }
        return 0;
    }

    /**
     * 当用户重新支付、取消订单时修改订单状态
     * @param orderId
     * @param status
     */
    @Override
    public void updateStatus(Integer orderId,String status) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = JNDIUtils.getConnection();
            String sql ="update `order` set status=? where order_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,status);
            ps.setInt(2,orderId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,null);
        }
    }

    /**
     * 管理员查询所有订单
     * @param page
     * @param limit
     * @return
     */
    @Override
    public List<Order> selectAllOrder(String page, String limit) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JNDIUtils.getConnection();
            String sql = "select * from `order`,flight,`user` where flight_id = f_id and user_id = u_id order by `create_time` desc limit ?,?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,(Integer.parseInt(page)-1)*Integer.parseInt(limit));//（页数-1）* 每页数量
            ps.setInt(2,Integer.parseInt(limit)); //每页的数量
            rs = ps.executeQuery();
            List list = new ArrayList();
            while (rs.next()) {
                Order order = new Order();
                User user = new User();
                Flight flight = new Flight();
                user.setName(rs.getString("username"));
                user.setIdNumber(rs.getString("id_number"));
                flight.setFlightId(rs.getInt("flight_id"));
                flight.setFlightNumber(rs.getString("f_number"));
                flight.setStartDate(rs.getDate("start_date").toString());
                flight.setStartTime(rs.getTime("start_time").toString());
                flight.setStartAdd(rs.getString("start_add"));
                flight.setTargetAdd(rs.getString("target_add"));
                flight.setPrice(rs.getDouble("price"));
                order.setOrderId(rs.getInt("order_id"));
                order.setStatus(rs.getString("status"));
                order.setCabin(rs.getString("cabin"));
                order.setNotes(rs.getString("notes"));
                order.setCreateTime(rs.getTimestamp("create_time").toString());
                order.setUpdateTime(rs.getTimestamp("update_time").toString());
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

    @Override
    public int selectAllOrderCount() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JNDIUtils.getConnection();
            String sql = "select count(*) from `order`,flight,`user` where flight_id = f_id and user_id = u_id order by `create_time` desc";
            ps = conn.prepareStatement(sql);
            ps.executeQuery();
            if (rs.next())
                return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return 0;
    }

    @Override
    public List<Order> selectTicketByName(String name,String page, String limit) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JNDIUtils.getConnection();
            String sql = "select * from `order`,flight,`user` where flight_id = f_id and user_id = u_id and username = ? and status in ('已出票') order by `create_time` desc limit ?,?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.setInt(2,(Integer.parseInt(page)-1)*Integer.parseInt(limit));//（页数-1）* 每页数量
            ps.setInt(3,Integer.parseInt(limit)); //每页的数量
            rs = ps.executeQuery();
            List list = new ArrayList();
            while (rs.next()) {
                Order order = new Order();
                User user = new User();
                Flight flight = new Flight();
                user.setName(rs.getString("username"));
                user.setIdNumber(rs.getString("id_number"));
                flight.setFlightId(rs.getInt("flight_id"));
                flight.setFlightNumber(rs.getString("f_number"));
                flight.setStartDate(rs.getDate("start_date").toString());
                flight.setStartTime(rs.getTime("start_time").toString());
                flight.setStartAdd(rs.getString("start_add"));
                flight.setTargetAdd(rs.getString("target_add"));
                flight.setPrice(rs.getDouble("price"));
                order.setOrderId(rs.getInt("order_id"));
                order.setStatus(rs.getString("status"));
                order.setCabin(rs.getString("cabin"));
                order.setNotes(rs.getString("notes"));
                order.setCreateTime(rs.getTimestamp("create_time").toString());
                order.setUpdateTime(rs.getTimestamp("update_time").toString());
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
