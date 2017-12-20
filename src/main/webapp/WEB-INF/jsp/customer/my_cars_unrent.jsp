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
                    <li><a href="${path}/customer/my_info">我的基本信息</a></li>
                    <li class="active"><a href="${path}/customer/my_cars_unrent">我的空闲车辆</a></li>
                    <li><a href="${path}/customer/my_rentout">我的求租订单</a></li>
                    <li><a href="${path}/customer/my_rentin">我的租车订单</a></li>
                    <li><a href="${path}/customer/my_parking">我的车位订单</a></li>
                    <li><a href="${path}/customer/my_message">查看留言</a></li>
                </ul>
            </div>
            <div class="container-center col-md-9">
                <ul id="listContainer" class="container list-vertical-container">
                    <c:forEach items="${cars}" var="c">
                        <li class="row list-vertical-item">
                            <div class="col-xs-3 col-md-3">
                            <c:choose>
                                <c:when test="${not empty c.photo}">
                                    <img class="car-img" src="${path}/${c.photo}" alt="无法显示">
                                </c:when>
                                <c:otherwise>
                                    <img class="car-img" src="${path}/static/img/car.svg" alt="无法显示">
                                </c:otherwise>
                            </c:choose>
                            </div>

                            <div class="col-xs-3 col-md-3 text-left">
                                <div class="car-title">
                                        ${c.brand}&nbsp;-&nbsp;${c.brandType}
                                </div>
                                <div class="car-brief">
                                        ${c.passengerNum}人座 &nbsp;&nbsp; ${c.manufactureYear}年产
                                </div>
                                <div class="car-brief">
                                        提车地:&nbsp;&nbsp;${c.city}
                                </div>
                            </div>
                            <div class="col-xs-3 col-md-3 text-left">
                                <div class="car-brief">
                                    日租：￥${c.priceDay}/日
                                </div>
                                <div class="car-brief">
                                    周租：￥${c.priceWeek}/周
                                </div>
                                <div class="car-brief">
                                    月租：￥${c.priceMonth}/月
                                </div>
                            </div>
                            <div class="col-xs-3 col-md-3 container-flex-horizontal-center container-flex-vertical-center" style="height: 88px;">
                                <button class="btn-square btn-list" style="line-height: 24px;" onclick="javascript:location='${path}/customer/modify_car?carId=${c.id}'">修改</button>
                            </div>
                        </li>
                    </c:forEach>

                </ul>
            </div>
        </div>
    </div>

    <!-- Page Footer -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>

<script type="text/javascript">
    function startModify() {
        $(".form-control").show();
        $("input[type=submit]").show();
        $(".to-hide").hide()
    }


</script>
</html>
