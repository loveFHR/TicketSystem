<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/5/1
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>订购</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/layui/css/public.css" media="all">
    <link rel="stylesheet" href="/layui/css/modules/step-lay/step.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <div class="layui-fluid">
            <div class="layui-card">
                <div class="layui-card-body" style="padding-top: 40px;">
                    <div class="layui-carousel" id="stepForm" lay-filter="stepForm" style="margin: 0 auto;">
                        <div carousel-item>
                            <div> <%--第一页--%>
                                <form class="layui-form" style="margin: 0 auto;max-width: 460px;padding-top: 40px;">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">用户名:</label>
                                        <div class="layui-input-block">
                                            <div class="layui-form-mid layui-word-aux">${order.user.name}</div>
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">身份证:</label>
                                        <div class="layui-input-block">
                                            <div class="layui-form-mid layui-word-aux">${order.user.idNumber}</div>
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label required">性别:</label>
                                        <div class="layui-input-block">
                                            <div class="layui-form-mid layui-word-aux">${order.user.gender}</div>
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">航班席位:</label>
                                        <div class="layui-input-block">
                                            <select name="cabin1" id="cabin1" lay-verify="required">
                                                <option value="经济舱">经济舱</option>
                                                <option value="商务舱">商务舱</option>
                                                <option value="头等舱">头等舱</option>
                                            </select>

                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">备注说明:</label>
                                        <div class="layui-input-block">
                                            <textarea placeholder="订单备注" id="notes1" class="layui-textarea"></textarea>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-input-block">
                                            <button class="layui-btn" lay-submit lay-filter="formStep" >
                                                &emsp;下一步&emsp;
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div> <%--第二页--%>
                                <form class="layui-form" style="margin: 0 auto;max-width: 460px;padding-top: 40px;">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">始发地:</label>
                                        <div class="layui-input-block">
                                            <div class="layui-form-mid layui-word-aux">${order.flight.startAdd}</div>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">目的地:</label>
                                        <div class="layui-input-block">
                                            <div class="layui-form-mid layui-word-aux">${order.flight.targetAdd}</div>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">日期:</label>
                                        <div class="layui-input-block">
                                            <div class="layui-form-mid layui-word-aux">${order.flight.startDate}</div>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">时间:</label>
                                        <div class="layui-input-block">
                                            <div class="layui-form-mid layui-word-aux">${order.flight.startTime}</div>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">舱位:</label>
                                        <div class="layui-input-block">
                                            <div id="cabin2" class="layui-form-mid layui-word-aux"></div>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">价格:</label>
                                        <div class="layui-input-block">
                                            <div class="layui-form-mid layui-word-aux">${order.flight.price}元</div>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">备注说明:</label>
                                        <div class="layui-input-block">
                                            <div class="layui-form-mid layui-word-aux" id="notes2"></div>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-input-block">
                                            <button type="button" class="layui-btn layui-btn-primary pre">上一步</button>
                                            <button class="layui-btn" lay-submit lay-filter="formStep2">
                                                &emsp;确认支付${order.flight.price}元&emsp;
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div>//第三页
                                <div style="text-align: center;margin-top: 90px;">
                                    <i class="layui-icon layui-circle"
                                       style="color: white;font-size:30px;font-weight:bold;background: #52C41A;padding: 20px;line-height: 80px;">&#xe605;</i>
                                    <div style="font-size: 24px;color: #333;font-weight: 500;margin-top: 30px;">
                                        支付成功
                                    </div>
                                    <div style="font-size: 14px;color: #666;margin-top: 20px;">正在为您生成订单...</div>
                                </div>
                                <div style="text-align: center;margin-top: 50px;">
                                    <button class="layui-btn next">再买一张</button>
                                    <button class="layui-btn layui-btn-primary">确定</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/layui/layui.js" charset="utf-8"></script>
<script src="/layui/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use([ 'form', 'step'], function () {
        var $ = layui.$,
            form = layui.form,
            step = layui.step;

        step.render({
            elem: '#stepForm',
            filter: 'stepForm',
            width: '100%', //设置容器宽度
            stepWidth: '750px',
            height: '500px',
            stepItems: [{
                title: '确认旅客信息'
            }, {
                title: '确认航班信息'
            }, {
                title: '完成'
            }]
        });

        form.on('submit(formStep)', function (data) {
            $('#cabin2').text($('#cabin1').val())
            $('#notes2').text($('#notes1').val())
            step.next('#stepForm');
            return false;  // 阻止默认 form 跳转
        });

        form.on('submit(formStep2)', function (data) {
            $.ajax({
                type:"POST",
                url:"/order"
            })
            step.next('#stepForm');
            return false;  // 阻止默认 form 跳转
        });

        $('.pre').click(function () {
            step.pre('#stepForm');
        });

        $('.next').click(function () {
            step.next('#stepForm');
        });
    })
</script>
</body>
</html>