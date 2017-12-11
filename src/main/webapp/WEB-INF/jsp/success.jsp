<%--
  Created by IntelliJ IDEA.
  User: joy12
  Date: 2017/12/8
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/const.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>成功</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/jcy.css">
</head>


<body>
<!-- Page Header -->
<jsp:include page="common/header.jsp"></jsp:include>
<h2 class="offset-80">
    ${msg}
</h2>
<button class="btn-usual" onclick="javascript:location='index'">回首页</button>

<!-- Page Footer -->
<jsp:include page="common/footer.jsp"></jsp:include>
</body>


<script type="text/javascript">

    $(document).ready(function(){
    });
</script>
</html>

