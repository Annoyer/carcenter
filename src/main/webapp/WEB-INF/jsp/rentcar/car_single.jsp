<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我要租车</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/jcy.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/style.css">
</head>

<body>
<!-- Page Header -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!--页面内容-->
<div class="offset-80">
    <div class="container page_content offset-80">
        <div class="row text_title" id="itemId">${car.brand}-${car.brandType}</div>
        <div class="row">
            <div class="col-xs-8 col-md-8 item_img_wrapper_lg">
                <img class="img_fill" id="itemImgLg" src="${path}/${car.photo}"/>
            </div>
            <div class="col-xs-4 col-md-4">
                <div class="car-price-lg">
                    日租：${car.priceDay}/日
                </div>
                <div class="car-price-lg">
                    周租：${car.priceWeek}/周
                </div>
                <div class="car-price-lg">
                    月租：${car.priceMonth}/月
                </div>
                <button class="btn-usual" onclick="javascript:location='${path}/carOrder/rent_in?carId='+${car.id}">马上预约</button>
                <button class="btn-usual">联系车主</button>
            </div>
        </div>

        <div class="offset_60">
            <div class="text_title_sm">详细参数</div>
            <hr class="my_hr_long"/>
            <div>
                <table class="table_attribute">
                    <tbody>
                    <tr>
                        <td id="userType">取车点：  ${car.city}</td>
                        <td id="lensHeight">牌照：  ${car.license}</td>
                    </tr>
                    <tr>
                        <td id="form">出厂年份：  ${car.manufactureYear}</td>
                        <td id="lensWidth">颜色：  ${car.color}</td>
                    </tr>
                    <tr>
                        <td id="glassesType">座位：  ${car.passengerNum}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <hr class="my_hr_long"/>
        </div>


        <div class="offset_60">
            <div class="text_title_sm">评价</div>
            <div>
                <table class="table">
                    <tbody id="commentListBody">
                    <c:forEach items="${comments}" var="c">
                        ${c.content}-${c.carOrder.id}-${c.carOrder.customer.name}
                    </c:forEach>

                    <%--<tr>--%>
                    <%--<td class="comment_wrapper">--%>
                    <%--<div class="comment_user_name">相叶雅纪</div>--%>
                    <%--<div class="comment_content">hhhhhhhhhhhhhhhhh哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或、hhhhh哈哈哈哈哈哈哈哈哈哈哈</div>--%>
                    <%--<div class="comment_timestamp">2016-12-25 16:00:00</div>--%>
                    <%--</td>--%>
                    <%--</tr>--%>

                    </tbody>
                </table>
                <hr class="my_hr_long"/>
                <div class="display_center">
                    <ul id="commentNavbar" class="pagination pagination-sm">
                        <%--<li><a href="#">&laquo;</a></li>--%>
                        <%--<li class="active"><a href="#">1</a></li>--%>
                        <%--<li><a href="#">2</a></li>--%>
                        <%--<li><a href="#">3</a></li>--%>
                        <%--<li><a href="#">4</a></li>--%>
                        <%--<li><a href="#">5</a></li>--%>
                        <%--<li><a href="#">&raquo;</a></li>--%>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Page Footer -->
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>

<script type="text/javascript">


</script>
</html>
