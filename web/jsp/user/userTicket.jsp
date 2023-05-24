<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/5/24
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/layui/css/layui.css" rel="stylesheet">
</head>
<body>
<div style="padding: 16px;">
    <table class="layui-hide" id="ID-table-demo-css" lay-filter="currentTableFilter"></table>
</div>
<script type="text/html" id="ID-table-demo-css-1">
    <div style="align-content: center">
        <h3>{{d.flight.startAdd}}<span class="to">→</span>{{d.flight.targetAdd}}</h3>
        <p>{{d.flight.startDate}}  {{d.flight.startTime}}</p>
        <p>{{d.cabin}}</p>
        <p>￥{{d.flight.price}}元</p>
        <p>姓名:{{d.user.name}}  身份证:{{d.user.idNumber}}</p>
    </div>
</script>
<script type="text/html" id="ID-table-demo-css-2">
    <div >
        <p>{{d.status}}</p>
    </div>
</script>
<script type="text/html" id="ID-table-demo-css-3">
    <div >
        <p>创建时间:{{d.createTime}}</p>
        <p>修改时间:{{d.updateTime}}</p>
    </div>
</script>
<script type="text/html" id="currentTableBar">
    <a class="layui-btn layui-btn-radius layui-btn-danger data-count-delete" lay-event="delete">退票</a>
</script>
<script src="/layui/layui.js"></script>
<script>
    layui.use(['table'], function(){
        var $ = layui.$
        var table = layui.table;

        // 创建渲染实例
        table.render({
            elem: '#ID-table-demo-css'
            ,url:'/order?method=selectTicketByName&name=${name}'
            ,page: true
            ,lineStyle: 'height: 180px;' // 定义表格的多行样式
            ,css: [
                '.layui-table-page{text-align: center;}' // 让分页栏居中
            ].join('')
            ,cols: [[
                {minWidth:600, templet: '#ID-table-demo-css-1'},
                {templet: '#ID-table-demo-css-3'},
                {templet: '#ID-table-demo-css-2'},
                {toolbar: '#currentTableBar', align: "center"}
            ]]
        });
        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'delete') {
                layer.confirm('确定取消吗', function (index) {
                    $.ajax({
                        type:'POST',
                        url:'/order?method=delete',
                        data:{'orderId':data.orderId,'flightId':data.flight.flightId},
                        success:function (res){
                            if (res === 'success'){
                                table.reload('ID-table-demo-css')
                                layer.close(index);
                            } else
                                layer.msg("支付失败!")
                        }
                    })
                })
            }
        });
    });
</script>
</body>
</html>
