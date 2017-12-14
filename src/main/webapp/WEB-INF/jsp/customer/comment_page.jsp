<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>留言</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/jcy.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/style.css">
</head>
<body>
<!-- Page Header -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!--页面内容-->
<div class="offset-80 container">
    <div class="row">
        <div class="text_title col-xs-10 col-md-10 col-md-push-1">评价</div>
    </div>


    <hr class="offset-20 my_hr_long"/>
    <div class="container container-center" style="width: 100%">
        <form id="msgForm" class="offset-30" action="${path}/carOrder/comment" method="post">
            <input hidden name="carOrderId" value="${carOrderId}">
            <div class="row container-center">
                <textarea style="width: 85%; height: 200px;" name="content" ></textarea>
            </div>
            <div class="offset-20 row container-center">
                <input type="submit" class="btn-usual"/>
            </div>

        </form>
    </div>


</div>

<!-- Page Footer -->
<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>
