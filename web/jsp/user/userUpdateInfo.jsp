<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/5/25
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改航班</title>
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
        <label class="layui-form-label required">ID</label>
        <div class="layui-input-block">
            <input type="text" name="userId" lay-verify="required" class="layui-input" value="${user.userId}" readonly>
            <tip>ID不可修改</tip>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="name" lay-verify="required" lay-reqtext="用户名不能为空" placeholder="请输入用户名" class="layui-input" value="${user.name}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="password" lay-verify="required" lay-reqtext="密码不能为空" placeholder="请输入密码" class="layui-input" value="${user.password}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">性别</label>
        <div class="layui-input-inline">
            <input type="radio" id="male" name="gender" value="男" title="男">
            <input type="radio" id="female" name="gender" value="女" title="女">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">身份证</label>
        <div class="layui-input-block">
            <input type="text" name="idNumber" lay-verify="required" lay-reqtext="身份证不能为空" placeholder="请输入身份证" class="layui-input" value="${user.idNumber}">
            <tip>请再次确认身份证是否填写正确哦！！</tip>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认修改</button>
        </div>
    </div>
</div>
</div>
<script src="/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$;

        var gender = '${user.gender}';
        if (gender === '男') {
            $('input[name=gender][value=男]').prop('checked', true);
        } else if (gender === '女') {
            $('input[name=gender][value=女]').prop('checked', true);
        }
        form.render();
        //监听提交
        form.on('submit(saveBtn)', function (data) {
            /* 18位身份证的正则表达式验证
            var idNumber = data.data.idNumber
            var regExp = /^([1-6][1-9]|50)\d{4}(18|19|20)\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/
                  --->   /^[1-9]\d{5}(18|19|20)\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/
                         /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/

            var ok = regExp.test(idNumber)
            if(!ok){
              layer.alert("身份证不合法")
            } else{}
            */
            $.ajax({
                type:"POST",
                url:"/user?method=update",
                data:{
                    updateData:JSON.stringify(data.field)
                },
                success:function (res){
                    if (res === "success"){
                        var index = layer.alert("修改成功", {
                            title: '最终的提交信息'
                        }, function () {
                            // 关闭弹出层
                            layer.close(index);
                            var iframeIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(iframeIndex);
                        });
                    }else {
                        layer.msg('修改失败',{icon:5})
                    }
                }
            })
        });
    });
</script>
</body>
