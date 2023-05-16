<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/4/29
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加航班</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/layui/css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div class="layui-form layuimini-form">
    <div class="layui-form-item">
        <label class="layui-form-label required">航班号</label>
        <div class="layui-input-block">
            <input type="text" name="flightNumber" lay-verify="required" lay-reqtext="航班号不能为空" placeholder="请输入航班号" class="layui-input">
            <tip>请再次确认航班号是否填写正确哦！！</tip>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label required">出发日期</label>
        <div class="layui-input-block">
            <input type="date" name="startDate" lay-verify="required" lay-reqtext="日期不能为空" placeholder="请输入日期" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">出发时间</label>
        <div class="layui-input-block">
            <input type="time" name="startTime" lay-verify="required" lay-reqtext="时间不能为空" placeholder="请输入时间" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">始发地</label>
        <div class="layui-input-block">
            <input type="text" name="startAdd" lay-verify="required" lay-reqtext="始发地不能为空" placeholder="请输入始发地" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">目的地</label>
        <div class="layui-input-block">
            <input type="text" name="targetAdd" lay-verify="required" lay-reqtext="目的地不能为空" placeholder="请输入目的地" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">总座位数</label>
        <div class="layui-input-block">
            <input type="number" name="totalSeats" lay-verify="required" lay-reqtext="总座位数不能为空" placeholder="请输入总座位数" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">可用座位数</label>
        <div class="layui-input-block">
            <input type="number" name="availableSeats" lay-verify="required" lay-reqtext="可用座位数不能为空" placeholder="请输入可用座位数" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">价格</label>
        <div class="layui-input-block">
            <input type="number" name="price" lay-verify="required" lay-reqtext="价格不能为空" placeholder="请输入价格" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认添加</button>
        </div>
    </div>
</div>
<script src="/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$;

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            $.ajax({
                type:"POST",
                url:"/flight?method=insert",
                data:{
                    addData:JSON.stringify(data.field)
                },
                success:function (res){
                    if (res === "success") {
                        var index = layer.alert("添加成功", {
                            title: '最终的提交信息'
                        }, function () {
                            // 关闭弹出层
                            layer.close(index);
                            window.location.reload();
                            var iframeIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(iframeIndex);
                        });
                    } else {
                        layer.msg('添加失败，请检查航班号是否正确', {icon:5, time:2000})
                    }
                }
            })
        });

    });
</script>
</body>
</html>