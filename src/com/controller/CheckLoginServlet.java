package com.controller;

import com.pojo.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/CheckLogin")
public class CheckLoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String identity = request.getParameter("identity");
        String method = request.getParameter("method");

        HttpSession session = request.getSession();

        if(method.equals("2")){      //退出登录
            session.invalidate();    //销毁session
            response.sendRedirect("/jsp/login.jsp");
        }else {  //登录
            UserService userService = new UserServiceImpl();
            Boolean result = userService.selectUserByNameAndPassword(name, password, identity);

            if (result && identity.equals("company")) {
                session.setAttribute("name",name);
                session.setAttribute("isCompany",true);
                response.getWriter().write("company");
            } else if (result && identity.equals("user")) {
                session.setAttribute("name",name);
                session.setAttribute("isUser",true);
                response.getWriter().write("traveller");
            } else {
                response.getWriter().write("fail");
            }
        }
    }
}
