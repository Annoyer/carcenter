<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户中心</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/jcy.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/style.css">
</head>

<body>
<!-- Page Header -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!--页面内容-->
<div class="offset-80">
    <div class="offset-50 container container-center">
        <div class="row">
            <h2 class="col-md-3 text-center">个人中心</h2>
            <hr class="col-md-12"/>
        </div>
        <div class="row">
            <div class="infotab col-md-3">
                <ul class="nav2 nav-pills nav-stacked">
                    <li class="active"><a href="${path}/customer/my_info">我的基本信息</a></li>
                    <li><a href="${path}/customer/my_cars_unrent">我的空闲车辆</a></li>
                    <li><a href="${path}/customer/my_rentout">我的求租订单</a></li>
                    <li><a href="${path}/customer/my_rentin">我的租车订单</a></li>
                    <li><a href="${path}/customer/my_parking">我的车位订单</a></li>
                    <li><a href="${path}/customer/my_message">查看留言</a></li>
                </ul>
            </div>
            <div class="col-md-1"></div>
            <div id="infoContainer" class="container-center col-md-8 text-left" style="font-size: 18px;">
                <div class="offset-30 col-sm-12 col-md-12 form-group container-flex-horizontal-left">
                    <div class="col-sm-3 col-md-3">手机号:</div>
                    <div class="col-sm-9 col-md-9">${customer.phone}</div>
                </div>
                <div class="col-sm-12 col-md-12 form-group container-flex-horizontal-left">
                    <div class="col-sm-3 col-md-3">姓名:</div>
                    <div class="col-sm-9 col-md-9">${customer.name}</div>
                </div>
                <div class="offset-15 col-sm-12 col-md-12 form-group container-flex-horizontal-center to-hide">
                    <button class="btn-square btn-md-my" style="width: 10%;" onclick="startModify()">修改</button>
                </div>

            </div>
            <div id="formContainer" class="container-center col-md-8 text-left" style="display: none;font-size: 18px;">
                <form action="${path}/customer/customerModify" method="post">
                    <input hidden name="id" value="${customer.id}">
                    <input hidden name="phone" value="${customer.phone}">
                    <div class="offset-30 col-sm-12 col-md-12 form-group container-flex-horizontal-left">
                        <label class="col-sm-3 col-md-3">手机号:</label>
                        <div class="col-sm-9 col-md-9">${customer.phone}</div>
                    </div>
                    <div class="col-sm-12 col-md-12 form-group container-flex-horizontal-left">
                        <label class="col-sm-3 col-md-3 form-control-label">姓名:</label>
                        <input class="col-sm-9 col-md-9 form-control" id="name" name="name" type="text" placeholder="姓名">
                    </div>
                    <div class="col-sm-12 col-md-12 form-group container-flex-horizontal-left">
                        <label class="col-sm-3 col-md-3 form-control-label">密码:</label>
                        <input class="col-sm-9 col-md-9 form-control" id="password" name="password" type="password" placeholder="密码">
                    </div>
                    <div class="offset-15 col-sm-12 col-md-12 form-group container-flex-horizontal-center">
                        <input type="submit" class="btn-square btn-md-my btn-form" style="width: 10%;">
                        &nbsp;&nbsp;&nbsp;
                        <div class="btn-square btn-md-my btn-form" style="width: 10%;cursor:pointer;text-align: center;" onclick="cancelModify()">取消</div>
                    </div>
                </form>

            </div>
        </div>
    </div>

<!-- Page Footer -->
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>

<script type="text/javascript">
function startModify() {
    $("#infoContainer").hide();
    $("#formContainer").show();
}

function cancelModify() {
    $("#infoContainer").show();
    $("#formContainer").hide();
}


</script>
</html>
