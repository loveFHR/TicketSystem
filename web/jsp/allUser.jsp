<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/4/28
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>table模块快速使用</title>
  <link rel="stylesheet" href="/layui/css/layui.css" media="all">
</head>
<body>

<table id="demo" lay-filter="test"></table>

<script src="/layui/layui.js"></script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
  layui.use('table', function(){
    var table = layui.table;

    //第一个实例
    table.render({
      elem: '#demo'
      ,height: 'full-100'
      ,url: '/SelectAllTraveller' //数据接口
      ,method:'get'
      ,page: true //开启分页
      ,cols: [[ //表头
        {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
        ,{field: 'name', title: '用户名', width:100, sort: true}
        ,{field: 'gender', title: '性别', width:80}
        ,{field: 'idCard', title: '身份证', width: 180}
        ,{field: 'travelTime', title: '旅行时间', width: 180}
        ,{field: 'startAdd', title: '出发地', width: 100, sort: true}
        ,{field: 'targetAdd', title: '目的地', width: 100, sort: true}
        ,{field: 'right', title: '操作', width: 150, toolbar:'#barDemo'}
      ]]
    });
    //监听行工具事件
    table.on('tool(test)', function(obj) {
      var data = obj.data;
      //console.log(obj)
      if (obj.event === 'del') {
        layer.confirm('真的删除行么', function (index) {
          obj.del();
          layer.close(index);
        });
      } else if (obj.event === 'edit') {
        layer.prompt({
          formType: 2
          , value: data.email
        }, function (value, index) {
          obj.update({
            email: value
          });
          layer.close(index);
        });
      }
    });
  });
</script>
</body>
</html>
