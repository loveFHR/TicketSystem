<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/5/1
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>欢迎</title>
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
</head>
<body>

<div class="layui-carousel" id="test1">
    <div carousel-item>
        <div><a href="javascript:;"><img src="/image/图片1.jpg"></a> </div>
        <div><a href="javascript:;"><img src="/image/图片2.jpg"></a> </div>
        <div><a href="javascript:;"><img src="/image/图片3.jpg"></a> </div>
        <div><a href="javascript:;"><img src="/image/图片4.jpg"></a> </div>
    </div>
</div>
<!-- 条目中可以是任意内容，如：<img src=""> -->

<script src="/layui/layui.js"></script>
<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,arrow: 'hover' //悬停显示箭头
            ,full:true //这个是全屏，不要就删了
            //,anim: 'updown' //切换动画方式,默认左右
        });
    });
</script>
</body>
</html>
