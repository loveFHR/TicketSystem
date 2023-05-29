package com.dao.impl;

import com.dao.UserDao;
import com.pojo.User;
import com.util.JNDIUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class userDaoImpl implements UserDao {
    /**
     * 通过用户名和密码查询用户(管理员)，并传入身份
     * 用于登录验证
     * @param name
     * @param password
     * @param identity
     * @return
     */
    @Override
    public Boolean selectUserByNameAndPassword(String name, String password, String identity) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "select * from "+identity+" where username = ? and password = ?";
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
    /**
     * 通过用户名查找用户
     * 用于注册时确保用户名唯一
     * @param name
     * @return
     */
    @Override
    public Boolean selectUserByName(String name) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "select * from `user` where username = ?";
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

    /**
     * 插入用户的用户名和密码，
     * 用于注册时存入数据库
     * @param name
     * @param password
     */
    @Override
    public void insertUser(String name, String password) {
        Connection conn = null;
        PreparedStatement ps = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "insert into user values (null,?,?,null,null)";
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

    /**
     * 查询所有用户
     * @return 用户集合
     */
    @Override
    public List<User> selectAllUser(String page, String limit) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "SELECT * FROM `user` LIMIT ?,?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,(Integer.parseInt(page)-1)*Integer.parseInt(limit));//（页数-1）* 每页数量
            ps.setInt(2,Integer.parseInt(limit)); //每页的数量
            rs = ps.executeQuery();
            List<User> list = new ArrayList<>();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("u_id"));
                user.setName(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setIdNumber(rs.getString("id_number"));
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

    /**
     * 查询用户的总记录数
     * @return
     */
    @Override
    public int userCount() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "select count(*) from `user`";
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
     * 根据ID查询用户
     * @param userId
     * @param user
     */
    @Override
    public void updateUserById(Integer userId, User user) {
        Connection conn = null;
        PreparedStatement ps = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "update `user` set username=?, password=?, gender=?, id_number=? where u_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,user.getName());
            ps.setString(2,user.getPassword());
            ps.setString(3,user.getGender());
            ps.setString(4,user.getIdNumber());
            ps.setInt(5,userId);
            ps.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,null);
        }
    }

    /**
     * 管理员通过id删除用户
     * @param userId
     */
    @Override
    public void deleteUserById(Integer userId) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = JNDIUtils.getConnection();
            String sql = "DELETE FROM `user` WHERE u_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,null);
        }
    }

    /**
     * 通过ID查询用户
     * @param userId
     * @return
     */
    @Override
    public User selectUserById(Integer userId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "SELECT * FROM `user` WHERE u_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,userId);
            rs = ps.executeQuery();
            User user = new User();
            if (rs.next()) {
                user.setUserId(rs.getInt("u_id"));
                user.setName(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setIdNumber(rs.getString("id_number"));
            }
            return user;
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,rs);
        }
        return null;
    }

    /**
     * 通过ID和name模糊搜索
     * @param idNumber
     * @param name
     * @return
     */
    @Override
    public List<User> selectByIdNumberAndName(String idNumber, String name) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "SELECT * FROM `user` WHERE id_number like ? and username like ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,"%"+idNumber+"%");
            ps.setString(2,"%"+name+"%");
            rs = ps.executeQuery();
            List<User> list = new ArrayList<>();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("u_id"));
                user.setName(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setIdNumber(rs.getString("id_number"));
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

    /**
     * 通过姓名查找用户
     * @param name
     * @return
     */
    @Override
    public User selectByName(String name) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = JNDIUtils.getConnection();
            String sql = "SELECT * FROM `user` WHERE username = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            rs = ps.executeQuery();
            User user = new User();
            if (rs.next()) {
                user.setUserId(rs.getInt("u_id"));
                user.setName(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setIdNumber(rs.getString("id_number"));
            }
            return user;
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JNDIUtils.close(conn,ps,rs);
        }
        return null;
    }
}
