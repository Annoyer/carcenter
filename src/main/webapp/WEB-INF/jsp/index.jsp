<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/const.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/jcy.css">
    <style type="text/css">
        .indeximg{
            width: 100%;
            height: 672px;
        }

    </style>
</head>


<body>
<!-- Page Header -->
<jsp:include page="common/header.jsp"></jsp:include>
<!--广告轮转-->
<div id="myCarousel" class="carousel slide" style="margin-top: 72px;height: 672px;">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="${path}/static/img/car1.jpg" alt="First slide" style="width: 100%;height: 672px">
        </div>
        <div class="item">
            <img src="${path}/static/img/car1.jpg" alt="Second slide" style="width: 100%;height: 672px">
        </div>
        <div class="item">
            <img src="${path}/static/img/car1.jpg" alt="Third slide" style="width: 100%;height: 672px">
        </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="carousel-control left" href="#myCarousel"
       data-slide="prev" style="line-height: 672px; font-size: 40px;">&lsaquo;
    </a>
    <a class="carousel-control right" href="#myCarousel"
       data-slide="next" style="line-height: 672px; font-size: 40px;">&rsaquo;
    </a>
</div>
<div>
    <div class="container-center offset-80">
        <h2>新闻动态</h2>
    </div>
    <div class="container-center">
        <hr class="my-hr">
    </div>
    <div id="newsImgs" class="imgs_wrap_4">
        <a href="#"><img class="item_img_4" src="${path}/static/img/car1.jpg"/></a>
        <a href="#"><img class="item_img_4" src="${path}/static/img/car1.jpg"/></a>
        <a href="#"><img class="item_img_4" src="${path}/static/img/car1.jpg"/></a>
        <a href="#"><img class="item_img_4" src="${path}/static/img/car1.jpg"/></a>
        <a href="#"><img class="item_img_4" src="${path}/static/img/car1.jpg"/></a>
        <a href="#"><img class="item_img_4" src="${path}/static/img/car1.jpg"/></a>
        <a href="#"><img class="item_img_4" src="${path}/static/img/car1.jpg"/></a>
        <a href="#"><img class="item_img_4" src="${path}/static/img/car1.jpg"/></a>
    </div>
</div>

<!-- Page Footer -->
<jsp:include page="common/footer.jsp"></jsp:include>
</body>


<script type="text/javascript">

    $(document).ready(function(){
    });
</script>
</html>
