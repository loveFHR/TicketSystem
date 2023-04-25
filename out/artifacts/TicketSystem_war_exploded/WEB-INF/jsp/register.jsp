<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/4/15
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>注册</title>
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
      <h2>注册</h2>
      <p> </p>
    </div>
    <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
      <div class="layui-form-item">
        <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-name"></label>
        <input type="text" name="name" id="LAY-user-login-name" lay-verify="nickname" placeholder="用户名" class="layui-input">
      </div>

      <div class="layui-form-item">
        <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
        <input type="password" name="password" id="LAY-user-login-password" lay-verify="pass" placeholder="密码" class="layui-input">
      </div>
      <div class="layui-form-item">
        <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-repass"></label>
        <input type="password" name="repass" id="LAY-user-login-repass" lay-verify="required" placeholder="确认密码" class="layui-input">
      </div>

      <div class="layui-form-item">
        <label >身份:</label>
        <input type="radio" name="identity" value="traveller" title="旅客" checked>
        <input type="radio" name="identity" value="travel_agency" title="旅行社">
        <input type="radio" name="identity" value="company" title="航空公司">
      </div>

<%--      <div class="layui-form-item">
        <input type="checkbox" name="agreement" lay-skin="primary" title="同意用户协议" checked>
      </div>--%>
      <div class="layui-form-item">
        <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-reg-submit" onclick="register()">注 册</button>
      </div>
      <div class="layui-trans layui-form-item layadmin-user-login-other">
<%--
        <label>社交账号注册</label>
        <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
        <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
        <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>
--%>

        <a href="Login"   class="layadmin-user-jump-change layadmin-link layui-hide-xs">用已有帐号登录</a>
      </div>
    </div>
  </div>


</div>

<script src="/layui/layui.js"  ></script>
<script src="/jquery-3.6.3/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
  function register() {
    var name = $('#LAY-user-login-name').val();
    var password = $('#LAY-user-login-password').val();
    var repass = $('#LAY-user-login-repass').val();
    var identity = $('input[name="identity"]:checked').val();
    // alert(name+password+repass+identity)
    if (password !== repass) {
      layer.msg('两次密码不相同，请重新输入',{icon: 5})
    } else {
      $.ajax({
        type:'post',
        url:'/CheckRegister',
        data:{
          'name':name,
          'password':password,
          'identity':identity
        },
        dataType:'text',
        success:function (res) {
          if (res === 'success'){
            layer.msg('注册成功',{icon:6})
          }else {
            layer.msg('注册失败',{icon:5})
          }
        }
      })
    }
  }
</script>
<%--<script>
  layui.config({
    base: './/' //静态资源所在路径
  }).extend({
    //index: 'lib/index' //主入口模块
  }).use(['index', 'user'], function(){
    var $ = layui.$
            ,setter = layui.setter
            ,admin = layui.admin
            ,form = layui.form
            ,router = layui.router();

    form.render();

    //提交
    form.on('submit(LAY-user-reg-submit)', function(obj){
      var field = obj.field;

      //确认密码
      if(field.password !== field.repass){
        return layer.msg('两次密码输入不一致');
      }

      //是否同意用户协议
      if(!field.agreement){
        return layer.msg('你必须同意用户协议才能注册');
      }

      //请求接口
      admin.req({
        url: layui.setter.base + 'json/user/reg.js' //实际使用请改成服务端真实接口
        ,data: field
        ,done: function(res){
          layer.msg('注册成功', {
            offset: '15px'
            ,icon: 1
            ,time: 1000
          }, function(){
            location.hash = '/Login'; //跳转到登入页
          });
        }
      });

      return false;
    });
  });
</script>--%>
</body>
</html>
