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
        <div class="row">
            <div class="col-xs-8 col-md-8 item_img_wrapper_lg">
                <img class="img_fill" id="itemImgLg" src="${path}/${car.photo}"/>
            </div>
            <div class="offset-50 col-xs-4 col-md-4">
                <div class="row text_title" id="itemId">${car.brand}-${car.brandType}</div>
                <div class="row" style="font-size: 18px;">
                    <div class="offset-20 col-xs-12 col-md-12">
                        日租：
                        <span class="car-price-lg">
                            ￥${car.priceDay}
                        </span>
                        /日
                    </div>
                    <div class="offset-20 col-xs-12 col-md-12">
                        周租：
                        <span class="car-price-lg">
                            ￥${car.priceWeek}
                        </span>
                        /周
                    </div>
                    <div class="offset-20 col-xs-12 col-md-12">
                        月租：
                        <span class="car-price-lg">
                            ￥${car.priceMonth}
                        </span>
                        /月
                    </div>
                </div>
                <div class="row offset-30">
                    <div class="col-xs-5 col-md-5" style="padding-right: 0px;">
                        <button class="btn-square btn-md-my" onclick="javascript:location='${path}/carOrder/rent_in?carId='+${car.id}">马上预约</button>
                    </div>
                    <div class="col-xs-5 col-md-5" style="padding-left: 0px;">
                        <button class="btn-square btn-md-my" onclick="sendMsg(${car.ownerId})">联系车主</button>
                    </div>
                    <div class="col-xs-2 col-md-2"></div>
                </div>

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
            <hr/>
        </div>


        <div class="offset_60">
            <div class="text_title_sm">评价</div>
            <hr/>
            <div class="offset-20">
                <div class="container" id="commentListBody">
                <c:forEach items="${comments}" var="c">
                    <div class="row">
                        <div class="col-xs-1 col-md-1">
                            <img style="width: 100%;" src="${path}/static/img/user.svg" onclick="sendMsg(${c.carOrder.customer.id})"/>
                        </div>
                        <div class="col-xs-11 col-md-11 text-left">
                            <div class="user-name" onclick="sendMsg(${c.carOrder.customer.id})">
                                    ${c.carOrder.customer.name}
                            </div>
                            <div class="msg-content">${c.content}</div>
                            <div class="time"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${c.createTime}" /></div>
                        </div>
                    </div>
                    <hr/>
                </c:forEach>
                </div>
            </div>

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
function sendMsg(toId) {
    if (toId != <%=customer.getId()%>){
        window.location.href = '${path}/message/send_message?toId='+toId;
    } else {
        window.location.href = '${path}/customer/my_info';
    }

}

</script>
</html>
