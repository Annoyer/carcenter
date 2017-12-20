<%--
  Created by IntelliJ IDEA.
  User: sts
  Date: 2017/12/13
  Time: PM4:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>查找车辆</title>

    <link href="${path}/static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="${path}/static/css/animate.min.css" rel="stylesheet">
    <link href="${path}/static/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
</head>
<body class="gray-bg">
<div class="ibox-content">
    <div class="row m-b-sm m-t-sm">

        <div class="col-md-11">
            <div class="input-group">
                <input id="inputId" type="text" placeholder="请输入车辆ID" class="input-sm form-control"> <span class="input-group-btn">
                <button type="button" class="btn btn-sm btn-primary" onclick="searchCar()">搜索</button> </span>
            </div>
        </div>
    </div>

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row" id="tableContent">
            <c:forEach items="${car}" var="car">
                <div class="col-sm-4">
                    <div class="contact-box">
                        <div onclick="javascript:window.location.href = '${path}/admin/car_detail?id=${car.id}'" style="cursor: pointer;">
                            <div class="col-sm-4">
                                <div class="text-center">
                                    <img alt="image" class="img-circle m-t-xs img-responsive" src="${path}/${car.photo}">
                                    <div class="m-t-xs font-bold">ID:${car.id}</div>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <h3><strong>品牌：${car.brand}</strong></h3>
                                <p><i class="fa fa-map-marker"></i>车牌号:${car.license}</p>
                                <address>
                                    <strong>出厂日期：${car.manufactureYear}</strong><br>
                                    颜色：${car.color}<br>
                                    核载人数:${car.passengerNum}<a href=""></a><br>
                                    车主ID：${car.ownerId}<br>
                                    发布时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${car.createTime}"/><br>
                                    状态:
                                        <c:choose>
                                            <c:when test="${car.status==0}">待租</c:when>
                                            <c:when test="${car.status==1}">已租</c:when>
                                            <c:when test="${car.status==2}">有订单待进行</c:when>
                                            <c:when test="${car.status==3}">待审核</c:when>
                                        </c:choose>
                                </address>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>



        </div>
    </div>
</div>
<script src="${path}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${path}/static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="${path}/static/js/content.min.js?v=1.0.0"></script>
<script>
    $(document).ready(function(){$(".contact-box").each(function(){animationHover(this,"pulse")})});
    function searchCar() {
        var id = $("#inputId").val();
        if (id==null || id==""){
            location.reload();
        } else {
            window.location.href = '${path}/admin/car_detail?id=' + id;
        }
    }

</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
