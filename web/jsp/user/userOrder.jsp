<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/5/4
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>旅客管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/layui/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
    </div>
</div>
<script src="/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: '/order?method=selectByUserName&name=${name}',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print'],
            skin: 'line',
            cols: [[
                {field: 'user.name',  title: '用户名', templet:function (res){return res.user.name}},
                {field: 'user.idNumber',  title: '身份证',templet:function (res){return res.user.idNumber}},
                {field: 'flight.flightNumber',  title: '航班号',templet:function (res){return res.flight.flightNumber}},
                {field: 'flight.startDate',  title: '出发日期',templet:function (res){return res.flight.startDate}},
                {field: 'flight.startTime',  title: '出发时间',templet:function (res){return res.flight.startTime}},
                {field: 'flight.startAdd',  title: '始发地',templet:function (res){return res.flight.startAdd},style: 'font-weight:bold'},
                {field: 'flight.targetAdd',  title: '目的地',templet:function (res){return res.flight.targetAdd},style: 'font-weight:bold'},
                {field: 'cabin',  title: '舱位'},
                {field: 'notes',  title: '备注'},
                {field: 'status',  title: '状态'},
                //自定义列
                {
                    title: '操作',
                    templet: function(res) {
                        console.log(res)
                        console.log(res.flight.flightNumber)
                        // 判断特定要求，添加按钮
                        if (res.status === '未支付') {
                            return '<button class="layui-btn layui-btn-warm">立即支付</button>';
                        } else if (res.status === '已支付') {
                            return '<button class="layui-btn layui-btn-warm">打印出票</button>'
                        } else {
                            return '';
                        }
                    }
                }
            ]]
        });
    });
</script>
</body>
</html>
