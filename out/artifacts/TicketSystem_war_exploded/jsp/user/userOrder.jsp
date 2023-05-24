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
<script src="/layui/layui.js"></script>
<script>
    layui.use(['table'], function(){
        var $ = layui.$
        var table = layui.table;

        // 创建渲染实例
        table.render({
            elem: '#ID-table-demo-css'
            ,url:'/order?method=selectByUserName&name=${name}'
            ,page: true
            ,lineStyle: 'height: 180px;' // 定义表格的多行样式
            ,css: [
                '.layui-table-page{text-align: center;}' // 让分页栏居中
            ].join('')
            ,cols: [[
                {minWidth:600, templet: '#ID-table-demo-css-1'},
                {templet: '#ID-table-demo-css-3'},
                {templet: '#ID-table-demo-css-2'},
                {templet: function(res) {
                        // 判断特定要求，添加按钮
                        if (res.status === '未支付') {
                            return '<a class="layui-btn layui-btn-warm layui-btn-radius" lay-event="repay">立即支付</a>' +
                                '<a class="layui-btn layui-btn-danger layui-btn-radius" lay-event="cancel">取消订单</a>';
                        } else if (res.status === '已支付') {
                            return '<a class="layui-btn layui-btn-radius" lay-event="print">打印出票</a>' +
                                '<a class="layui-btn layui-btn-danger layui-btn-radius" lay-event="return">取消订单</a>'
                        } else if (res.status === '已出票'){
                            return "请到'我的机票'查看";
                        } else {
                            return ''
                        }
                    }}
            ]]
        });
        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'repay') {
                layer.confirm('确认支付吗', function (index) {
                    $.ajax({
                        type:'POST',
                        url:'/order?method=repay',
                        data:{'orderId':data.orderId,'status':'已支付'},
                        success:function (res){
                            if (res === 'success'){
                                layer.msg('支付成功',{
                                    offset: '15px'
                                    ,icon: 1
                                    ,time: 1500
                                });
                                table.reload('ID-table-demo-css')
                                layer.close(index);
                            } else
                                layer.alert("支付失败!")
                        }
                    })
                });
            } else if (obj.event === 'cancel') {
                layer.confirm('确定取消吗', function (index) {
                    $.ajax({
                        type:'POST',
                        url:'/order?method=cancel',
                        data:{'orderId':data.orderId,'flightId':data.flight.flightId,'status':'已取消'},
                        success:function (res){
                            if (res === 'success'){
                                table.reload('ID-table-demo-css')
                                layer.close(index);
                            } else
                                layer.msg("支付失败!")
                        }
                    })
                })
            }else if (obj.event === 'return') {
                layer.confirm('确定取消吗，取消将返还购票费用', function (index) {
                    $.ajax({
                        type:'POST',
                        url:'/order?method=cancel',
                        data:{'orderId':data.orderId,'flightId':data.flight.flightId,'status':'已取消'},
                        success:function (res){
                            if (res === 'success'){
                                table.reload('ID-table-demo-css')
                                layer.close(index);
                            } else
                                layer.msg("支付失败!")
                        }
                    })
                })
            } else if (obj.event === 'print'){
                layer.confirm('确定打印吗',function (index) {
                    $.ajax({
                        type:'POST',
                        //url:'/ticket?method=insert',
                        url:'/order?method=print',
                        data:{'orderId':data.orderId},
                        success:function (res) {
                            if (res === 'success'){
                                table.reload('ID-table-demo-css')
                                layer.close(index);
                            }
                        }
                    })
                })
            }
        });
    });
</script>
</body>
</html>