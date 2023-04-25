<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/4/15
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>登录</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="/layui/css/layui.css"   media="all">
  <link rel="stylesheet" href="/style/admin.css"   media="all">
  <link rel="stylesheet" href="/style/login.css"   media="all">
</head>
<body>


<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">

  <div class="layadmin-user-login-main">

    <div class="layadmin-user-login-box layadmin-user-login-header">
      <h2>请先登录</h2>
      <p> </p>
    </div>

    <div class="layadmin-user-login-box layadmin-user-login-body layui-form">

      <div class="layui-form-item">
        <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
        <input type="text" name="username" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input">
      </div>

      <div class="layui-form-item">
        <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
        <input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input">
      </div>

      <div class="layui-form-item">
        <label >身份:</label>
          <input type="radio" name="identity" value="traveller" title="旅客" checked>
          <input type="radio" name="identity" value="travel_agency" title="旅行社">
          <input type="radio" name="identity" value="company" title="航空公司">
      </div>

      <div class="layui-form-item">
        <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit" onclick="login()">登 录</button>
      </div>

      <div class="layui-trans layui-form-item layadmin-user-login-other">
<%--
        <label>社交账号登入</label>
        <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
        <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
        <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>
--%>

        <a href="${pageContext.request.contextPath}/Register"   class="layadmin-user-jump-change layadmin-link">注册帐号</a>
      </div>
    </div>
  </div>
</div>

<script src="/layui/layui.js"  ></script>
<script src="/jquery-3.6.3/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
  function login(){
    var name = $('#LAY-user-login-username').val();
    var password = $('#LAY-user-login-password').val();
    var identity = $('input[name = "identity"]:checked').val();
    //alert("用户名:" + name + "密码:" + password + "entity" + entity);
    $.ajax({
      type:'post',
      url:'/CheckLogin',
      data:{'name':name,'password':password,'identity':identity},//发送到服务器的数据
      dataType:"text",//传回来的数据类型
      success:function (res) {
        if (res === "company") {
          //登入成功的提示与跳转
          layer.msg('登录成功', {
            offset: '15px'
            ,icon: 1
            ,time: 1000
          }, function(){
            location.href = '/CompanyMainForm'; //后台主页
          });
          //window.location.href = "/CompanyMainForm";
        } else if (res === "traveller") {
          layer.msg('登录成功', {
            offset: '15px'
            ,icon: 1
            ,time: 1000
          }, function(){
            location.href = '/TravellerMainForm'; //后台主页
          });
          //window.location.href = "/TravellerMainForm";
        } else {
          layer.msg('登录失败');
        }
      }
    })
  }
</script>
<%--<script>
  layui.config({
    base: '../../layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'user'], function(){
    var $ = layui.$
            ,setter = layui.setter
            ,admin = layui.admin
            ,form = layui.form
            ,router = layui.router()
            ,search = router.search;

    form.render();

    //提交
    form.on('submit(LAY-user-login-submit)', function(obj){

      //请求登入接口
      admin.req({
        url: layui.setter.base + 'json/user/login.js' //实际使用请改成服务端真实接口
        ,data: obj.field
        ,done: function(res){

          //请求成功后，写入 access_token
          layui.data(setter.tableName, {
            key: setter.request.tokenName
            ,value: res.data.access_token
          });

          //登入成功的提示与跳转
          layer.msg('登入成功', {
            offset: '15px'
            ,icon: 1
            ,time: 1000
          }, function(){
            location.href = '../..'; //后台主页
          });
        }
      });

    });

  });
</script>--%>
</body>
</html>
