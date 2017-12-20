<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/const.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/jcy.css">
    <style type="text/css">
        .indeximg{
            width: 100%;
            height: 672px;
        }

        .newsItem{
            border: 1px solid #e7eaec;
            text-align: center;
            padding: 10px;
            cursor: pointer;
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
    <div id="newsImgs" class="container">
        <c:choose>
            <c:when test="${fn:length(news)>9}">
                <c:forEach items="${news}" var="n" end="9" varStatus="i">
                <c:if test="${(i.index+1)%3 == 1}">
                <div class="row">
                </c:if>
                    <div class="col-md-4" style="padding: 15px;">
                        <div class="newsItem" onclick="javascript:window.location.href='${path}/news?newsId=${n.id}'">
                            <img class="item_img_4" src="${path}/${n.photo}"/>
                            <h4>${n.title}</h4>
                        </div>
                    </div>
                    <c:if test="${(i.index+1)%3 == 0}">
                        </div>
                    </c:if>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <c:forEach items="${news}" var="n" varStatus="i">
                    <c:if test="${(i.index+1)%3 == 1}">
                        <div class="row">
                    </c:if>
                    <div class="col-md-4" style="padding: 15px;">
                        <div class="newsItem" onclick="javascript:window.location.href='${path}/news?newsId=${n.id}'">
                            <img class="item_img_4" src="${path}/${n.photo}"/>
                            <h4>${n.title}</h4>
                        </div>
                    </div>
                    <c:if test="${(i.index+1)%3 == 0 || i.last}">
                        </div>
                    </c:if>
                </c:forEach>
            </c:otherwise>
        </c:choose>

        </div>
    </div>
</div>

<!-- Page Footer -->
<jsp:include page="common/footer.jsp"></jsp:include>
</body>

<script src="${path}/static/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript">

    $(document).ready(function(){
        $(".newsItem").each(function(){
            animationHover(this,"pulse")
        })
    });
</script>
</html>
