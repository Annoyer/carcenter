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

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row animated fadeInRight">
        <div class="col-sm-4">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>汽车ID</h5>
                </div>
                <div>
                    <div class="ibox-content no-padding border-left-right">
                        <img alt="image" class="img-responsive" src="img/profile_big.jpg">
                    </div>
                    <div class="ibox-content profile-content">
                        <h4><strong>owner ID：</strong></h4>
                        <p><i class="fa fa-map-marker"></i> license：</p>
                        <h5>
                            汽车详情
                        </h5>
                        <p>
                            品牌：
                            型号：
                            出厂日期：
                            颜色：
                            核载人数：
                            状态：
                            日租／周租：
                            城市：
                            创建时间：
                        </p>


                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>租户评价</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">

                    <div>
                        <div class="feed-activity-list">

                            <div class="feed-element">
                                <a href="" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/a1.jpg">
                                </a>
                                <div class="media-body ">
                                    <small class="pull-right text-navy">1天前</small>
                                    <strong>租户ID</strong>
                                    <br>
                                    <small class="text-muted">时间</small>
                                    <div class="well">
                                        评论内容
                                    </div>

                                </div>
                            </div>
                        </div>

                        <button class="btn btn-primary btn-block m"><i class="fa fa-arrow-down"></i> 显示更多</button>

                    </div>

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
