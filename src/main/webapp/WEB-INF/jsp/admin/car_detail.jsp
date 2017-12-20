<%--
  Created by IntelliJ IDEA.
  User: sts
  Date: 2017/12/14
  Time: AM9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>汽车详情</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="${path}/static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${path}/static/css/animate.min.css" rel="stylesheet">
    <link href="${path}/static/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

    <link href="${path}/static/css/jcy.css" rel="stylesheet">
    <link href="${path}/static/css/style.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="container offset-20">
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
                                <img style="width: 100%;" src="${path}/static/img/user.svg"/>
                            </div>
                            <div class="col-xs-11 col-md-11 text-left">
                                <div class="user-name">
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
<script src="${path}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${path}/static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="${path}/static/js/content.min.js?v=1.0.0"></script>
<script src="${path}/static/js/plugins/peity/jquery.peity.min.js"></script>
<script src="${path}/static/js/demo/peity-demo.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>
<body>

</body>
</html>
