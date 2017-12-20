<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="const.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/jcy.css">
    <style>
        .logo-text{
            font-size: 24px;
            font-weight: bold;
            color: #888888;
            padding: 5px;
            border: 2px solid #888888;
            border-radius: 15px;
        }
    </style>
</head>

<footer class="container-flex-vertical-center offset-80" style="justify-content: space-around;">
    <div class="container-center">
        <img src="${path}/static/img/24h.svg" class="logo_img"/>
        <div class="offset-20 logo-text">全天候服务</div>
    </div>
    <div class="container-center">
        <img src="${path}/static/img/car.svg" class="logo_img"/>
        <div class="offset-20 logo-text">车型齐全</div>
    </div>
    <div class="container-center">
        <img src="${path}/static/img/convenient.svg" class="logo_img"/>
        <div class="offset-20 logo-text">自主选车</div>
    </div>

</footer>
</html>
