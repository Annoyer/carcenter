<%--
  Created by IntelliJ IDEA.
  User: sts
  Date: 2017/12/13
  Time: PM4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>停车位管理</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="${path}/static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="${path}/static/css/animate.min.css" rel="stylesheet">
    <link href="${path}/static/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <c:forEach items="${parkspace}" var="ps">
            <div class="col-sm-4">
                <div class="ibox">
                    <div class="ibox-title">
                        <span class="label label-primary pull-right">是否审核通过</span>
                        <h5>停车场：${ps.parkingLotId} &nbsp; 停车位：${ps.id}</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="team-members">
                                <%--从数据库中提取照片--%>
                            <a href="#"><img alt="member" class="img-circle" src="img/a1.jpg">
                            </a>
                        </div>
                        <div class="row  m-t-sm">
                            <div class="col-sm-4">
                                <div class="font-bold">月租金</div>
                                12
                            </div>
                            <div class="col-sm-4">
                                <div class="font-bold">天租金</div>
                                4
                            </div>
                            <div class="col-sm-4 text-right">
                                <div class="font-bold">状态</div>
                                是否可租
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
</div>


<script src="${path}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${path}/static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="${path}/static/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
