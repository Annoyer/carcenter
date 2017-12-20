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
                    <li><a href="${path}/customer/my_rentout">我的求租订单</a></li>
                    <li><a href="${path}/customer/my_rentin">我的租车订单</a></li>
                    <li class="active"><a href="${path}/customer/my_parking">我的车位订单</a></li>
                    <li><a href="${path}/customer/my_message">查看留言</a></li>
                </ul>
            </div>
            <div class="container-center col-md-9">
                <ul id="listContainer" class="container list-vertical-container">
                    <c:forEach items="${orders}" var="o">
                        <li class="row list-vertical-item">
                            <div class="col-xs-4 col-md-4">
                                <div class="car-title">
                                    ${o.parkingPlace.parkingLot.name}
                                </div>
                                <div class="car-brief">
                                    车位号：${o.parkingPlace.identifier}
                                </div>
                                <div class="car-brief">
                                    地址：${o.parkingPlace.parkingLot.address}
                                </div>
                            </div>
                            <div class="col-xs-4 col-md-4">
                                <div class="car-brief">
                                    起始日期：<fmt:formatDate pattern="yyyy-MM-dd" value="${o.startDay}" />
                                </div>
                                <div class="car-brief">
                                    结束日期：<fmt:formatDate pattern="yyyy-MM-dd" value="${o.endDay}" />
                                </div>
                                <div class="order-status">
                                    订单状态：
                                    <c:choose>
                                    <c:when test="${o.status==-1}">
                                        已取消
                                    </c:when>
                                    <c:when test="${o.status==1}">
                                        进行中
                                    </c:when>
                                    <c:when test="${o.status==2}">
                                        待开始
                                    </c:when>
                                    <c:when test="${o.status==3}">
                                        历史订单
                                    </c:when>
                                    <c:otherwise>
                                        待开始
                                    </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="col-xs-4 col-md-4">
                                <div class="car-price-lg">
                                    ￥${o.price}
                                </div>
                                <c:choose>
                                    <c:when test="${o.status==0}">
                                        <button class="btn-square btn-list" onclick="cancelOrder(${o.id})">取消订单</button>
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
    function cancelOrder(id){
        $.ajax({
            method: 'POST',
            url: '${path}/parking/cancel',
            data: {
                orderId: id
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

