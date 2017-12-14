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
            <div class="container-center col-md-9">
                <form action="${path}/customer/customerModify" method="post">
                    <input hidden name="id" value="${customer.id}">
                    <input hidden name="phone" value="${customer.phone}">
                    <div class="offset-30 col-sm-12 col-md-12 form-group container-flex-horizontal-center">
                        <label>手机号</label>
                        <div class="" id="phone">${customer.phone}</div>
                    </div>
                    <div class="col-sm-12 col-md-12 form-group container-flex-horizontal-center">
                        <label class="form-control-label">姓名</label>
                        <div class="to-hide">${customer.name}</div>
                        <input class="form-control" id="name" name="name" type="text" placeholder="姓名" style="display: none;">
                    </div>
                    <div class="col-sm-12 col-md-12 form-group container-flex-horizontal-center">
                        <label class="form-control-label" style="display: none;">密码</label>
                        <input class="form-control" id="password" name="password" type="password" placeholder="密码" style="display: none;">
                    </div>
                    <div class="offset-15 col-sm-12 col-md-12 form-group container-flex-horizontal-center">
                        <input type="submit" class="btn-md-my btn-usual" style="width: 15%;display: none;">
                    </div>
                </form>

                    <div class="offset-15 col-sm-12 col-md-12 form-group container-flex-horizontal-center to-hide">
                        <button class="btn-md-my btn-usual" style="width: 15%;" onclick="startModify()">修改</button>
                    </div>

            </div>
        </div>
    </div>

<!-- Page Footer -->
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>

<script type="text/javascript">
function startModify() {
    $(".form-control").show();
    $(".form-control-label").show();
    $("input[type=submit]").show();
    $(".to-hide").hide()
}


</script>
</html>
