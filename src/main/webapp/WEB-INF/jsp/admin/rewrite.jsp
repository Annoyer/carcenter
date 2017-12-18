<%--
  Created by IntelliJ IDEA.
  User: sts
  Date: 2017/12/13
  Time: PM6:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>新闻</title>
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
                <input type="text" placeholder="请输入您要查找的新闻" class="input-sm form-control"> <span class="input-group-btn">
                <button type="button" class="btn btn-sm btn-primary"> 搜索</button> </span>
            </div>
        </div>
    </div>
    <div class="wrapper wrapper-content  animated fadeInRight blog">
        <div class="row">
            <div class="col-lg-4">
                <div class="ibox">
                    <div class="ibox-content">
                        <a href="article.jsp" class="btn-link">
                            <h2>
                                标题
                            </h2>
                        </a>
                        <div class="small m-b-xs">
                            <strong>管理员姓名</strong> <span class="text-muted"><i class="fa fa-clock-o"></i> 发布时间</span>
                        </div>
                        <p>
                            内容
                        </p>
                        <div class="row">
                            <div class="col-md-6">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a2.jpg">
                            </div>
                            <div class="col-md-6">
                                <div class=" text-right">
                                    <button class="btn btn-primary"  onclick="javascript:window.location.href='mail_compose.html';">编辑</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
</div>
</div>
<script src="${path}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${path}/static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="${path}/static/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
