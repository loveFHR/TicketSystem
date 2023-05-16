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
  <link rel="stylesheet" href="/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="/style/admin.css" media="all">
  <link rel="stylesheet" href="/style/login.css" media="all">
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
        <label >您的身份:</label>
          <input type="radio" name="identity" value="user" title="旅客" checked>
          <input type="radio" name="identity" value="company" title="航空公司">
      </div>

      <div class="layui-form-item">
        <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit" onclick="login()">登 录</button>
      </div>

      <div class="layui-trans layui-form-item layadmin-user-login-other">
        <a href="${pageContext.request.contextPath}/jsp/register.jsp"   class="layadmin-user-jump-change layadmin-link">注册帐号</a>
      </div>
    </div>
  </div>
</div>

<script src="/layui/layui.js"  ></script>
<script src="/jquery-3.6.3/jquery-3.6.3.js"></script>
<script type="text/javascript">
  function login(){
    var name = $('#LAY-user-login-username').val();
    var password = $('#LAY-user-login-password').val();
    var identity = $('input[name = "identity"]:checked').val();
    $.ajax({
      type:'post',
      url:'/CheckLogin?method=1',  //method=1代表登录,method=2代表退出
      data:{'name':name,'password':password,'identity':identity},
      success:function (res) {
        if (res === "company") {
          layer.msg('登录成功', {
            offset: '15px'
            ,icon: 1
            ,time: 1000
          }, function(){
            location.href = '/jsp/company/CompanyMainForm.jsp';
          });
        } else if (res === "traveller") {
          layer.msg('登录成功', {
            offset: '15px'
            ,icon: 1
            ,time: 1000
          }, function(){
            location.href = '/jsp/user/UserMainForm.jsp';
          });
        } else {
          layer.msg('登录失败,请检查用户名或密码');
        }
      }
    })
  }
</script>
</body>
</html>
