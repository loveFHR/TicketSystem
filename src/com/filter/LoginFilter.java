package com.filter;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebFilter("/*")
public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //向下转型
        HttpServletRequest request=(HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        HttpSession session = request.getSession();

        String url = request.getRequestURI();
        if (url.contains("/company/") && !isCompany(session)) {
            response.sendRedirect("/jsp/login.jsp");
        } else if (url.contains("/user/") && !isUser(session)) {
            response.sendRedirect("/jsp/login.jsp");
        } else {
            filterChain.doFilter(request, response);
        }
    }

    private boolean isCompany(HttpSession session) {
        Boolean isCompany = (Boolean) session.getAttribute("isCompany");
        return isCompany != null && isCompany;
    }

    private boolean isUser(HttpSession session) {
        Boolean isUser = (Boolean) session.getAttribute("isUser");
        return isUser != null && isUser;
    }

}
