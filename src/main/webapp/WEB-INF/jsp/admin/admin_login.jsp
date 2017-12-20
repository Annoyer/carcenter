<%--
  Created by IntelliJ IDEA.
  User: joy12
  Date: 2017/12/3
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@include file="../common/const.jsp" %>
<html>
<head>
    <title>登录</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

    <link href="${path}/static/css/jcy.css" rel="stylesheet">

    <style>
        .form-control{
            width: 30%;
        }
    </style>
</head>
<body>
<div class="offset-50 container container-center">
    <div class="col-sm-12 col-md-12 page-title">管理员登录</div>
    <div class="offset-30 col-sm-12 col-md-12 form-group container-flex-horizontal-center">
        <input class="form-control" id="name" type="text" placeholder="管理员账号">
    </div>
    <div class="col-sm-12 col-md-12 form-group container-flex-horizontal-center">
        <input class="form-control" id="password" type="password" placeholder="密码">
    </div>
    <div class="offset-15 col-sm-12 col-md-12 form-group container-flex-horizontal-center">
        <button class="btn-md-my btn-usual" style="width: 15%" onclick="login()">确认</button>
    </div>
    <div class="col-sm-12 col-md-12 offset-30 font-warning" style="display: none">请完善信息</div>
</div>

</body>
</html>
<script type="text/javascript">
    function login() {
        var name = $("#name").val();
        var password = $("#password").val();
        if (name!=null && password!=null){
            $.ajax({
                method: 'POST',
                url: '${path}/admin/login',
                data: {
                    name: name,
                    password:password
                },
                dataType: "json",
                success: function (data) {
                    if (data.success==true){
                        window.location.href="${path}/admin/main";
                    } else {
                        alert(data.error);
                    }
                }
            });
        } else{
            $(".font-warning").show();
        }
    }
</script>
