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
    <div class="layui-header header">
        <div class="layui-logo layui-hide-xs layui-bg-black">
            <a class="logo" href="./welcome.jsp">
                <img src="/image/logo.png">
            </a>
            用户系统
        </div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;" id="user-name">
                    <img src="/image/头像.png" class="layui-nav-img">
                    ${name}(旅客)
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javaScript:;" id="btn2">修改资料</a></dd>
                    <hr/>
                    <dd><a href="/CheckLogin?method=2">退出</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域-->
            <ul class="layui-nav layui-nav-tree" lay-shrink="all" lay-filter="test">
                <li class="layui-nav-item btn"><a href="javascript:;" lay-href="/jsp/user/userQueryFlight.jsp">查询航班</a></li>
                <li class="layui-nav-item btn"><a href="javascript:;" lay-href="/jsp/user/userOrder.jsp">我的订单</a></li>
                <li class="layui-nav-item btn"><a href="javascript:;" lay-href="/jsp/user/userTicket.jsp">我的机票</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe src="/jsp/user/welcome.jsp" id="main" height="100%" width="100%"></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        @机票预定系统:用户预定
    </div>
</div>
<script src="/layui/layui.js"></script>
<script>
    layui.use('element',function (){
        var element = layui.element;
        var $=layui.jquery;
        $(document).ready(function (){
            $(".btn>a ").click(function (e){ //当左侧导航栏下的超链接被点击时
                e.preventDefault();
                $('#main').attr("src",$(this).attr("lay-href"));//将iframe的src值改为被点击的超链接的lay-href的值
            });
        });
        $("#btn2").click(function (){
            $.ajax({
                type:"POST",
                url:"/user?method=userUpdForm",
                data:{
                    name:'${name}'
                },
                success:function (){
                    var index = layer.open({
                        title: '修改资料',
                        type: 2,
                        shade: 0.2,
                        maxmin:true,
                        shadeClose: true,
                        area: ['70%', '70%'],
                        content: '/jsp/user/userUpdateInfo.jsp',
                    });
                    $(window).on("resize", function () {
                        layer.full(index);
                    });
                }
            })
        })
    });
</script>
</body>
</html>

