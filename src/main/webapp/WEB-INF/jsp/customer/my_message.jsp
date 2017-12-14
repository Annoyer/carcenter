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
            <div class="infotab col-md-3">
                <ul class="nav2 nav-pills nav-stacked">
                    <li><a href="${path}/customer/my_info">我的基本信息</a></li>
                    <li><a href="${path}/customer/my_cars_unrent">我的空闲车辆</a></li>
                    <li><a href="${path}/customer/my_rentout">我的求租订单</a></li>
                    <li><a href="${path}/customer/my_rentin">我的租车订单</a></li>
                    <li><a href="${path}/customer/my_parking">我的车位订单</a></li>
                    <li class="active"><a href="${path}/customer/my_message">查看留言</a></li>
                </ul>
            </div>
            <div class="container-center col-md-9">
                <div class="row">
                    <div class="col-md-3">
                        <button class="btn-usual" onclick="setAllMsgStatus(1)">全部已读</button>
                    </div>
                    <div class="col-md-3">
                        <button class="btn-usual" onclick="setAllMsgStatus(0)">全部未读</button>
                    </div>
                </div>
                <ul id="listContainer" class="container list-vertical-container offset-20">
                    <c:forEach items="${msgs}" var="m">
                        <li class="row list-vertical-item">
                            <div class="col-xs-3 col-md-3">
                                ${m.from.name}
                            </div>
                            <div class="col-xs-6 col-md-6">
                                ${m.content}
                            </div>
                            <div class="col-xs-3 col-md-3">
                                <c:choose>
                                    <c:when test="${m.isRead==0}">
                                        <button class="btn-usual" onclick="setMsgStatus(${m.id},1)">设为已读</button>
                                    </c:when>
                                    <c:when test="${m.isRead==1}">
                                        <button class="btn-usual" onclick="setMsgStatus(${m.id},0)">设为未读</button>
                                    </c:when>
                                </c:choose>

                            </div>
                            <div class="col-xs-3 col-md-3">
                                <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${m.createTime}" />
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
    function setMsgStatus(id,status) {
        var idList = "#";
        idList += id + "#";
        $.ajax({
            method: 'POST',
            url: '${path}/message/read',
            data: {
                idList: idList,
                status: status
            },
            success: function (data) {
                location.reload();
            }
        });
    }

    function setAllMsgStatus(status) {
        var idList = "#";
        if (${not empty msgs}){
            <c:forEach items="${msgs}" var="m">
                idList += ${m.id}+"#";
            </c:forEach>

            $.ajax({
                method: 'POST',
                url: '${path}/message/read',
                data: {
                    idList: idList,
                    status: status
                },
                success: function (data) {
                    location.reload();
                }
            });
        }
    }

</script>

