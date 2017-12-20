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
                    <li><a href="${path}/customer/my_cars_unrent">我的空闲车辆</a></li>
                    <li class="active"><a href="${path}/customer/my_rentout">我的求租订单</a></li>
                    <li><a href="${path}/customer/my_rentin">我的租车订单</a></li>
                    <li><a href="${path}/customer/my_parking">我的车位订单</a></li>
                    <li><a href="${path}/customer/my_message">查看留言</a></li>
                </ul>
            </div>
            <div class="container-center col-md-9">
                <ul id="listContainer" class="container list-vertical-container">
                    <c:forEach items="${orders}" var="o">
                        <li class="row list-vertical-item">
                            <c:choose>
                                <c:when test="${not empty o.car.photo}">
                                    <img class="col-xs-3 col-md-3" src="${path}/${o.car.photo}" alt="无法显示">
                                </c:when>
                                <c:otherwise>
                                    <img class="col-xs-3 col-md-3" src="${path}/static/img/car.svg" alt="无法显示">
                                </c:otherwise>
                            </c:choose>

                            <div class="col-xs-3 col-md-3">
                                <div class="car-title">
                                        ${o.car.brand}&nbsp;-&nbsp;${o.car.brandType}
                                </div>
                                <div class="car-brief">
                                        ${o.car.passengerNum}人座
                                </div>
                                <div class="order-status">
                                    订单状态：
                                    <c:choose>
                                        <c:when test="${o.status==-3}">
                                            已拒绝
                                        </c:when>
                                        <c:when test="${o.status==-2}">
                                            顾客取消审核中
                                        </c:when>
                                        <c:when test="${o.status==-1}">
                                            已取消
                                        </c:when>
                                        <c:when test="${o.status==0}">
                                            待进行
                                        </c:when>
                                        <c:when test="${o.status==1}">
                                            进行中
                                        </c:when>
                                        <c:when test="${o.status==2}">
                                            待确认
                                        </c:when>
                                        <c:when test="${o.status==3}">
                                            历史订单
                                        </c:when>
                                        <c:when test="${o.status==4}">
                                            已评价
                                        </c:when>
                                        <c:otherwise>
                                            未知
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="col-xs-3 col-md-3">
                                <div class="car-brief">
                                    提车地：${o.car.city}
                                </div>
                                <div class="car-brief">
                                    提车日期：<fmt:formatDate pattern="yyyy-MM-dd" value="${o.startDay}" />
                                </div>
                                <div class="car-brief">
                                    还车日期：<fmt:formatDate pattern="yyyy-MM-dd" value="${o.endDay}" />
                                </div>
                            </div>
                            <div class="col-xs-3 col-md-3">
                                <div class="car-price-lg">
                                    ￥${o.price}
                                </div>
                                <c:choose>
                                    <c:when test="${o.status==2}">
                                        <button class="btn-square btn-list" onclick="dealOrder(${o.id},true)">接单</button>
                                        <button class="btn-square btn-list" onclick="dealOrder(${o.id},false)">拒绝</button>
                                    </c:when>
                                </c:choose>
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
</html>
<script type="text/javascript">
    function dealOrder(id,isAccept){
        $.ajax({
            method: 'POST',
            url: '${path}/carOrder/dealByOwner',
            data: {
                orderId: id,
                isAccept:isAccept
            },
            dataType: "json",
            success: function (data) {
                if (data.success==true){
                    alert("操作成功！");
                    location.reload();
                } else {
                    alert(data.error);
                }
            }
        });
    }
</script>
