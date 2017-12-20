<%--
  Created by IntelliJ IDEA.
  User: sts
  Date: 2017/12/13
  Time: PM2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>


<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>首页</title>

    <link href="${path}/static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="${path}/static/css/animate.min.css" rel="stylesheet">
    <link href="${path}/static/css/style.min.css?v=4.0.0" rel="stylesheet">
    <base target="_blank">

</head>

<body class="gray-bg">
<div class="row  border-bottom white-bg dashboard-header">
    <div class="col-sm-12">
        <blockquote class="text-warning" style="font-size:34px">
            Welcome to this management system~\(≧▽≦)/~
        </blockquote>

        <hr>
    </div>
    <div class="col-sm-3">
        <h2>Hello,Management</h2>
        <p>Wish you have a nice day！</p>
    </div>
    <div class="col-sm-5">
        <h2>
            CAR CENTERε-(´∀｀; )
        </h2>
        <br>
        <h3>这是一个车辆管理系统，管理员可以在这里实现对用户，</h3>
        <br>
        <h3>车辆，租车位，留言，新闻的全方位管理。高效而又美观。</h3>


        <br>

    </div>
    <div class="col-sm-4">
        <h2>Instruction manual┏ (^ω^)=</h2>
        <br>
            <h4>管理员中心：</h4>
        <ul>
            <li>用户管理：所有用户信息(增删改查)。</li>
            <li>停车位管理：停车位数目、月租金价格、日租金价格、位置、是否已被租</li>
            <li>车辆信息管理：车辆的基本信息，以及状态</li>
            <li>车辆信息变更审核</li>
            <li>订单管理：租车位订单、租车订单、发布租车请求的 查看&审核</li>
            <li>新闻动态管理：增、删、改、查</li>
            <li>留言管理：查看、删除</li>
        </ul>
    </div>

</div>


<script src="${path}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${path}/static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="${path}/static/js/plugins/layer/layer.min.js"></script>
<script src="${path}/static/js/content.min.js"></script>
<script src="${path}/static/js/welcome.min.js"></script>
</body>

</html>
