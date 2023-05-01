<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/5/1
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>查询飞机</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/layui/css/public.css" media="all">
</head>
<body>
    <div class="layuimini-container">
        <div class="layuimini-main">

            <fieldset class="table-search-fieldset">
                <legend>查询航班</legend>
                <div style="margin: 10px 10px 10px 10px">
                    <form class="layui-form" action="">
                            <div class="layui-form-item">
                                <label class="layui-form-label">始发地</label>
                                <div class="layui-input-inline">
                                    <select id="startAdd" name="startAdd" lay-verify="required">
                                        <option value="">--请选择始发地--</option>

                                    </select>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">目的地</label>
                                <div class="layui-input-inline">
                                    <select id="targetAdd" name="targetAdd" lay-verify="required">
                                        <option value="">--请选择目的地--</option>
                                    </select>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">日期</label>
                                <div class="layui-input-inline">
                                    <input type="date" name="startDate" lay-verify="required" lay-reqtext="日期不能为空" placeholder="请选择日期" class="layui-input">
                                </div>
                            </div>

                            <div class="layui-inline">
                                <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                                <button type="reset" class="layui-btn layui-btn-primary"><i class="layui-icon"></i> 重置</button>
                            </div>
                    </form>
                </div>
            </fieldset>

            <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

            <script type="text/html" id="currentTableBar">
                <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="book">订购</a>
            </script>

        </div>
    </div>
    <script src="/layui/layui.js" charset="utf-8"></script>
    <script>
        layui.use(['form','table'], function(){
            var $ = layui.jquery,
                form = layui.form,
                table = layui.table;

            table.render({
                elem: '#currentTableId',  //指定原始 table 容器的选择器或 DOM
                url: '/flight?method=select',
                cols: [[ //表头
                    {field: 'flightNumber', width: 120, title: '航班号', sort: true},
                    {field: 'startDate', width: 150, title: '起飞日期', sort: true},
                    {field: 'startTime', width: 150, title: '起飞时间', sort: true},
                    {field: 'startAdd', width: 120, title: '始发地'},
                    {field: 'targetAdd', width: 120, title: '目的地'},
                    {field: 'totalSeats', width: 120, title: '总座位数'},
                    {field: 'availableSeats', width: 120, title: '可用座位数'},
                    {field: 'price', width: 120, title: '价格',sort:true},
                    {title: '操作', width: 120, toolbar: '#currentTableBar', align: "center"}
                ]],
                limits: [5, 10, 15, 20, 25, 50, 100],//每页条数的选择项
                limit: 5, //每页默认显示5条数据
                page: true,//开启分页
                skin: 'line' //用于设定表格风格,line （行边框风格）
            });
            table.on('tool(currentTableFilter)', function (obj) {
                var data = obj.data;
                if (obj.event === 'book') {

                    console.log(data)
                    var index = layer.open({
                        title: '订购航班',
                        type: 2,
                        shade: 0.2,
                        maxmin:true,
                        shadeClose: true,
                        area: ['100%', '100%'],
                        content: '/jsp/book.jsp',
                    });
                    $(window).on("resize", function () {
                        layer.full(index);
                    });
                    return false;
                }
            });
            form.render()
        });
    </script>
</body>
</html>
