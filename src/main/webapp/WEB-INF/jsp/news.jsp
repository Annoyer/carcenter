<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/const.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${news.title}</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/jcy.css">
</head>


<body>
<!-- Page Header -->
<jsp:include page="common/header.jsp"></jsp:include>

<div class="offset-120 container" style="margin-top: 120px">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="ibox">
                <div class="ibox-content">
                    <div class="small text-right">
                        发布时间: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${news.createTime}"/>
                    </div>
                    <div class="text-center article-title">
                        <h1>
                            ${news.title}
                        </h1>
                    </div>
                    <hr/>
                    <c:if test="${not empty news.photo}">
                        <div class="offset-50 text-center">
                            <img style="width: 60%" src="${path}/${news.photo}"/>
                        </div>
                    </c:if>
                    <div class="offset-50" style="padding: 0 100px;">
                        <p>
                            ${news.content}
                        </p>
                    </div>

                    <hr>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Page Footer -->
<jsp:include page="common/footer.jsp"></jsp:include>
</body>

<script type="text/javascript">

    $(document).ready(function(){
        $(".newsItem").each(function(){
            animationHover(this,"pulse")
        })
    });
</script>
</html>
