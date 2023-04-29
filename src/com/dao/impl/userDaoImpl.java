package com.dao.impl;

import com.dao.UserDao;
import com.pojo.Order;
import com.pojo.User;
import com.util.JNDIUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class userDaoImpl implements UserDao {
    @Override
    public Boolean selectUserByNameAndPassword(String name, String password, String identity) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "select * from "+identity+" where name = ? and password = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.setString(2,password);
            rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,rs);
        }
        return false;
    }

    @Override
    public Boolean selectUserByName(String name) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "select * from `user` where name = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,rs);
        }
        return false;
    }

    @Override
    public void insertUser(String name, String password) {
        Connection conn = null;
        PreparedStatement ps = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "insert into user values (?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.setString(2,password);
            ps.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,null);
        }
    }

    /*@Override
    public List<Object> selectAllTraveller() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "select * from user where identity = 'traveller'";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            List<Object> list = new ArrayList<>();
            while (rs.next()) {
                User user = new User();
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                list.add(user);
            }
            return list;

        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,rs);
        }
        return null;
    }

    public List<Object> selectAllOrder(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "select * from `order`";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            List<Object> list = new ArrayList<>();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setName(rs.getString("name"));
                order.setGender(rs.getString("gender"));
                order.setIdCard(rs.getString("id_card"));
                order.setStartAdd(rs.getString("start_add"));
                order.setTargetAdd(rs.getString("target_add"));
                order.setTravelTime(rs.getString("travel_time"));
                list.add(order);
            }
            return list;

        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,rs);
        }
        return null;
    }

    public List<Object> selectAllOrder(String page, String limit){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "select * from `order` limit ?,?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,(Integer.parseInt(page)-1)*Integer.parseInt(limit));
            ps.setInt(2,Integer.parseInt(limit));
            rs = ps.executeQuery();
            List<Object> list = new ArrayList<>();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setName(rs.getString("name"));
                order.setGender(rs.getString("gender"));
                order.setIdCard(rs.getString("id_card"));
                order.setStartAdd(rs.getString("start_add"));
                order.setTargetAdd(rs.getString("target_add"));
                order.setTravelTime(rs.getString("travel_time"));
                list.add(order);
            }
            System.out.println(page);
            System.out.println(limit);
            System.out.println(list);
            return list;

        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,rs);
        }
        return null;
    }

    @Override
    public int travellerCount() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "select count(*) as sum from `order`";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                System.out.println(rs.getInt("sum"));
               return rs.getInt("sum");
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,rs);
        }
        return 0;
    }*/
}
