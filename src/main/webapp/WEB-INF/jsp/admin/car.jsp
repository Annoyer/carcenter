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
    <meta name="keywords" content="">
    <meta name="description" content="">

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
                <input type="text" placeholder="请输入车辆ID" class="input-sm form-control"> <span class="input-group-btn">
                <button type="button" class="btn btn-sm btn-primary"> 搜索</button> </span>
            </div>
        </div>
    </div>

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <c:forEach items="${car}" var="car">
                <div class="col-sm-4">
                    <div class="contact-box">
                        <a href="car_detail.jsp">
                            <div class="col-sm-4">
                                <div class="text-center">
                                    <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a2.jpg">
                                    <div class="m-t-xs font-bold">车ID</div>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <h3><strong>品牌</strong></h3>
                                <p><i class="fa fa-map-marker"></i> 车牌号</p>
                                <address>
                                    <strong>出厂日期：</strong><br>
                                    颜色：<br>
                                    核载人数:<a href=""></a><br>
                                    车主ID：<br>
                                    发布时间：<br>
                                    <abbr title="Phone">状态:</abbr>
                                </address>
                            </div>
                            <div class="clearfix"></div>
                        </a>
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
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
