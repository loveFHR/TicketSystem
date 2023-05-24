<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/4/26
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>航班管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/layui/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">始发地</label>
                            <div class="layui-input-inline">
                                <input id="inputStartAdd" type="text" name="startAdd" autocomplete="off" class="layui-input" placeholder="请输入或选择始发地">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">目的地</label>
                            <div class="layui-input-inline">
                                <input id="inputTargetAdd" type="text" name="targetAdd" autocomplete="off" class="layui-input" placeholder="请输入目的地" >
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">日期</label>
                            <div class="layui-input-inline">
                                <input type="date" id="inputStartDate" name="startDate"  placeholder="请选择日期" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn "  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加 </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>

    </div>
</div>
<script src="/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',  //指定原始 table 容器的选择器或 DOM
            url: '/flight?method=select',
            toolbar: '#toolbarDemo', //开启表格头部工具栏区域
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],  //配置头部工具栏右侧的图标按钮
            cols: [[ //表头
                {type: "checkbox", width: 50},
                {field: 'flightId', width: 80, title: 'ID', sort: true},
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
            limit: 10, //每页默认显示10条数据
            page: true,//开启分页
            skin: 'line' //用于设定表格风格,line （行边框风格）
        });

        /**
         * 监听搜索事件
         */
        form.on('submit(data-search-btn)', function () {
            var startAdd = $('#inputStartAdd').val()
            var targetAdd = $('#inputTargetAdd').val()
            var startDate = $('#inputStartDate').val()
            //执行搜索重载
            table.reload('currentTableId',{
                url:'/flight?method=selectFlightByAddAndDate&startAdd='+startAdd+'&targetAdd='+targetAdd+'&startDate='+startDate,
                page: {
                    curr: 1//重新从第 1 页开始
                }
                , where: {
                    startAdd:startAdd,
                    targetAdd:targetAdd,
                    startDate:startDate
                }
            });
            return false
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '添加航班',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: './addFlight.jsp',
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            }
        });
        /**
         * 通过ID删除航班
         * @param flightIds
         */
        function deleteFlightByIds(flightIds){
            $.ajax({
                type:"GET",
                data:{
                    delData:flightIds
                },
                url:"/flight?method=delete",
                success:function (res){
                    if (res === "success") {//如果成功
                        layer.msg('删除成功', {
                            icon: 6,
                            time: 500
                        }, function () {//重新加载页面
                            table.reload('currentTableId');
                            var iframeIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(iframeIndex);
                        });
                    } else {
                        layer.msg("删除失败");
                    }
                }
            })
        }
        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                $.ajax({
                    type:"POST",
                    url:"/flight?method=updForm",
                    data:{
                        flightId:data.flightId
                    },
                    success:function (data){
                        var index = layer.open({
                            title: '编辑航班',
                            type: 2,
                            shade: 0.2,
                            maxmin:true,
                            shadeClose: true,
                            area: ['100%', '100%'],
                            content: './updateFlight.jsp',
                        });
                        $(window).on("resize", function () {
                            layer.full(index);
                        });
                        return false;
                    }
                })
            } else if (obj.event === 'delete') {
                layer.confirm('真的要删除么', function (index) {
                    deleteFlightByIds(data.flightId)
                    layer.close(index);
                });
            }
        });

    });
</script>
</body>
</html>
