<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/4/17
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>主页</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">
            用户系统
        </div>
        <ul class="layui-nav layui-layout-left" lay-bar="disabled">
            <li class="layui-nav-item">您的身份:大帅逼</li>
        </ul>
        <ul class="layui-nav layui-layout-right ">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;" id="user-name">
                    <img src="/image/头像.png" class="layui-nav-img">
                    ${name}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">修改资料</a></dd>
                    <dd><a href="">设置</a></dd>
                    <hr/>
                    <dd><a href="/CheckLogin?method=2">退出</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-shrink="all" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">查询及预定</a>
                    <dl class="layui-nav-child">
                        <dd class="left"><a href="javascript:;" lay-href="/jsp/userQueryFlight.jsp">查询航班</a></dd>
                        <dd class="left"><a href="javascript:;" lay-href="/jsp/userOrder.jsp">查看订单</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">机票</a>
                    <dl class="layui-nav-child">
                        <dd class="left"><a href="javascript:;" lay-href="/jsp/userTicket.jsp">查看机票</a></dd>
                        <dd class="left"><a href="javascript:;" lay-href="/jsp/rebook.jsp">改签</a></dd>
                        <dd class="left"><a href="javascript:;" lay-href="/jsp/returnTicket.jsp">退票</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe src="/jsp/welcome.jsp" id="main" height="100%" width="100%"></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        @冯华荣真帅,杨飞扬也帅
    </div>
</div>
<script src="/layui/layui.js"></script>
<script>
    layui.use('element',function (){
        var element = layui.element;
        var $=layui.jquery;
        $(document).ready(function (){
            $(".left>a").click(function (e){
                e.preventDefault();
                $('#main').attr("src",$(this).attr("lay-href"));
            });
        });
    });
</script>
</body>
</html>

