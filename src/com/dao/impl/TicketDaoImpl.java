package com.dao.impl;

import com.dao.TicketDao;
import com.pojo.Flight;
import com.pojo.Order;
import com.pojo.Ticket;
import com.pojo.User;
import com.util.JNDIUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TicketDaoImpl implements TicketDao {
    @Override
    public void insertById(Integer orderId) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = JNDIUtils.getConnection();
            String sql = "insert into `ticket` (order_id,`status`) values (?,'已出票')";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,orderId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,null);
        }
    }

}
