<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="const.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/jcy.css">
</head>
<header>
    <div class="my_navbar">
        <nav class="navbar" role="navigation" style="border:none; margin-bottom: 0px">
            <div class="container-fluid">
                <div class="navbar-header"
                     style="color: #ffffff; font-size: 24px; padding-left: 120px; padding-right: 70px;">
                    名字
                </div>
                <div>
                    <ul class="nav navbar-nav">
                        <li><a href="${path}/index">首页</a></li>
                        <li><a href="${path}/car/list">我要租车</a></li>
                        <li><a href="${path}/car/rent_out">有车出租</a></li>
                        <li><a href="${path}/parking/list">我要租车位</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="${path}/register"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                        <li><a href="${path}/login"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
                    </ul>
                </div>
            </div>

        </nav>


    </div>
</header>

<script type="text/javascript">

    $(document).ready(function(){
        $(".navbar-header").css("line-height",$("nav.navbar").height()+"px");
    });
</script>
</html>
