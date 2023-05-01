<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/4/28
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>旅客管理</title>
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
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                  <input type="text" name="sex" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-inline">
                <label class="layui-form-label">ID</label>
                <div class="layui-input-inline">
                  <input type="text" name="city" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-inline">
                <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
              </div>
            </div>
          </form>
        </div>
      </fieldset>

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
        elem: '#currentTableId',
        url: '/user?method=select',
        toolbar: '#toolbarDemo',
        defaultToolbar: ['filter', 'exports', 'print'],
        cols: [[
          {type: "checkbox", width: 50},
          {field: 'userId', width: 80, title: 'ID', sort: true},
          {field: 'name', width: 120, title: '用户名'},
          {field: 'password', width: 150, title: '密码'},
          {field: 'gender', width: 120, title: '性别', sort: true},
          {field: 'idNumber', width: 150, title: '身份证'},
          {title: '操作', width: 120, toolbar: '#currentTableBar', align: "center"}
        ]],
        limits: [5, 10, 15, 20, 25, 50, 100],//每页可选数据数
        limit: 5, //每页默认显示5条数据
        page: true,//开启分页
        skin: 'line'
      });

      // 监听搜索操作
      form.on('submit(data-search-btn)', function (data) {
        var result = JSON.stringify(data.field);
        layer.alert(result, {
          title: '最终的搜索信息'
        });

        //执行搜索重载
        table.reload('currentTableId', {
          page: {
            curr: 1//重新从第 1 页开始
          }
          , where: {
            searchParams: result
          }
        }, 'data');

        return false;
      });
      //监听表格复选框选择
      table.on('checkbox(currentTableFilter)', function (obj) {
        console.log(obj)
      });

      table.on('tool(currentTableFilter)', function (obj) {
        var data = obj.data;
        if (obj.event === 'edit') {
          $.ajax({
            type:"POST",
            url:"/user?method=updForm",
            data:{
              userId:data.userId
            },
            success:function (data){
              var index = layer.open({
                title: '编辑用户',
                type: 2,
                shade: 0.2,
                maxmin:true,
                shadeClose: true,
                area: ['100%', '100%'],
                content: '/jsp/updateUser.jsp',
              });
              $(window).on("resize", function () {
                layer.full(index);
              });
              return false;
            }
          })
        } else if (obj.event === 'delete') {
          layer.confirm('真的要删除么', function (index) {
            $.ajax({
              type:"GET",
              data:{
                delData:data.userId
              },
              url:"/user?method=delete",
              success:function (res){
                if (res === "success") {//如果成功
                  layer.msg('删除成功', {
                    icon: 6,
                    time: 500
                  }, function () {//重新加载表格
                    table.reload()
                    var iframeIndex = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(iframeIndex);
                  });
                } else {
                  layer.msg("删除失败");
                }
              }
            })
            layer.close(index);
          });
        }
      });
    });
  </script>
</body>
</html>