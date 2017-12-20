<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我要租车位</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/jcy.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/style.css">
</head>

<body>
<!-- Page Header -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!--页面内容-->
<div class="page_content offset-80">
    <%--<div class="offset_20 display_right">--%>
        <%--<ul id="commentNavbar" class="pagination pagination-sm">--%>
            <%--<li id="pageMark" class="display_inline" style="font-size: 18px; color: #888888"> 0 / 0 </li>--%>
            <%--<li><a href="#" id="first" class="display_inline">&laquo;</a></li>--%>
            <%--<li><a href="#" id="previous" class="display_inline"><</a></li>--%>
            <%--<li><a href="#" id="next" class="display_inline">></a></li>--%>
            <%--<li><a href="#" id="last" class="display_inline">&raquo;</a></li>--%>
        <%--</ul>--%>
    <%--</div>--%>

    <div class="offset-80">
        <ul id="listContainer" class="container list-vertical-container">
            <c:forEach items="${parkingLots}" var="p">
                <li class="row list-vertical-item">
                    <div class="col-xs-4 col-md-4">
                        <div>${p.name}</div>
                        <div>地址：${p.address}</div>
                    </div>
                    <div class="col-xs-3 col-md-3">
                        <div>总容量：${p.name}</div>
                        <div>空闲容量：${p.name}</div>
                    </div>
                    <div class="col-xs-3 col-md-3">
                        <div class="car-price-label">日租：<span class="car-price"> ￥${p.priceDay}</span></div>
                        <div class="car-price-label">月租：<span class="car-price"> ￥${p.priceMonth}</span></div>
                    </div>
                    <div class="col-xs-2 col-md-2">
                        <button class="btn-order" onclick="javascript:location='${path}/parking/order?lotId=${p.id}'">预约</button>
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


</script>
</html>
