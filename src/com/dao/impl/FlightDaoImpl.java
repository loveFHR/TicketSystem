package com.dao.impl;

import com.dao.FlightDao;
import com.pojo.Flight;
import com.util.JNDIUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FlightDaoImpl implements FlightDao {
    /**
     * 查询所有航班
     * @param page : 页数
     * @param limit :每页数量
     * @return 航班的集合
     */
    @Override
    public List<Flight> selectAllFlight(String page, String limit) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "select * from `flight`limit ?,?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,(Integer.parseInt(page)-1)*Integer.parseInt(limit));//（页数-1）* 每页数量
            ps.setInt(2,Integer.parseInt(limit)); //每页的数量
            rs = ps.executeQuery();

            ArrayList<Flight> list = new ArrayList<>();
            while (rs.next()) {
                Flight flight = new Flight();
                flight.setFlightId(rs.getInt("f_id"));
                flight.setFlightNumber(rs.getString("f_number"));
                flight.setStartDate(rs.getDate("start_date").toString());//把数据库Date类型转成字符串
                flight.setStartTime(rs.getTime("start_time").toString());//把数据库Time类型转成字符串
                flight.setStartAdd(rs.getString("start_add"));
                flight.setTargetAdd(rs.getString("target_add"));
                flight.setTotalSeats(rs.getInt("total_seats"));
                flight.setAvailableSeats(rs.getInt("available_seats"));
                flight.setPrice(rs.getDouble("price"));
                list.add(flight);
            }
            return list;
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,rs);
        }
        return null;
    }

    /**
     * 查询航班总记录数
     * @return 总记录数
     */
    @Override
    public int countFlight() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "select count(*) from `flight`";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,rs);
        }
        return 0;
    }

    /**
     * 添加航班
     * @param flight
     */
    @Override
    public void insertFlight(Flight flight) {
        Connection conn = null;
        PreparedStatement ps = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "insert into `flight` values (null,?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1,flight.getFlightNumber());
            ps.setDate(2, Date.valueOf(flight.getStartDate()));//将Date字符串转成Date类型
            ps.setTime(3,Time.valueOf(flight.getStartTime()+":00"));//将Time字符串转成Time类型
            ps.setString(4,flight.getStartAdd());
            ps.setString(5,flight.getTargetAdd());
            ps.setInt(6,flight.getTotalSeats());
            ps.setInt(7,flight.getAvailableSeats());
            ps.setDouble(8,flight.getPrice());
            ps.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,null);
        }
    }

    /**
     * 通过ID查询航班
     * @param flightId
     * @return
     */
    @Override
    public Flight selectFlightById(Integer flightId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "select * from `flight` where f_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, flightId);
            rs = ps.executeQuery();
            Flight flight = new Flight();
            if (rs.next()) {
                flight.setFlightId(rs.getInt("f_id"));
                flight.setFlightNumber(rs.getString("f_number"));
                flight.setStartDate(rs.getDate("start_date").toString());
                flight.setStartTime(rs.getTime("start_time").toString());
                flight.setStartAdd(rs.getString("start_add"));
                flight.setTargetAdd(rs.getString("target_add"));
                flight.setTotalSeats(rs.getInt("total_seats"));
                flight.setAvailableSeats(rs.getInt("available_seats"));
                flight.setPrice(rs.getDouble("price"));
            }
            return flight;
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,rs);
        }
        return null;
    }

    /**
     * 修改航班
     * @param flightId
     * @param flight
     */
    @Override
    public void updateFlightById(Integer flightId,Flight flight) {
        Connection conn = null;
        PreparedStatement ps = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "update flight set f_number=?, start_date=?, start_time=?, start_add=?, " +
                    "target_add=?, total_seats=?, available_seats=?,price=? where f_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,flight.getFlightNumber());
            ps.setDate(2, Date.valueOf(flight.getStartDate()));
            ps.setTime(3,Time.valueOf(flight.getStartTime()));
            ps.setString(4,flight.getStartAdd());
            ps.setString(5,flight.getTargetAdd());
            ps.setInt(6,flight.getTotalSeats());
            ps.setInt(7,flight.getAvailableSeats());
            ps.setDouble(8,flight.getPrice());
            ps.setInt(9,flightId);
            ps.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,null);
        }
    }

    @Override
    public void deleteFlightById(Integer flightId) {
        Connection conn = null;
        PreparedStatement ps = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "DELETE FROM flight WHERE f_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,flightId);
            ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            JNDIUtils.close(conn,ps,null);
        }
    }
}
