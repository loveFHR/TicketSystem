<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/4/15
  Time: 18:10
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
            后台管理系统
        </div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
                    ${name}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">Your Profile</a></dd>
                    <dd><a href="">Settings</a></dd>
                    <dd><a href="/CheckLogin?method=2" id="sign out" target="_self">Sign out</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                </a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">主要功能</a>
                    <dl class="layui-nav-child" >
                        <dd class="left"><a href="javascript:;" lay-href="./allUser.jsp">查询所有旅客</a></dd>
                        <dd class="left"><a href="javascript:;" lay-href="./allFlight.jsp">查询所有航班</a></dd>
                        <dd class="left"><a href="javascript:;" lay-href="">查询所有订单</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe src="/jsp/company/allUser.jsp" id="main" height="100%" width="100%"></iframe>
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
