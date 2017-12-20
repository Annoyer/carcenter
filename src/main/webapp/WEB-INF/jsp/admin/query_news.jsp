<%--
  Created by IntelliJ IDEA.
  User: sts
  Date: 2017/12/13
  Time: PM5:43
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
    <div class="wrapper wrapper-content animated fadeInRight blog">
        <div class="row">
            <c:forEach items="${news}" var="n">
                <div class="col-md-4">
                    <div class="ibox">
                        <div class="ibox-content">
                            <a href="${path}/admin/article?id=${n.id}" class="btn-link">
                                <h2>
                                    ${n.title}
                                </h2>
                            </a>
                            <div class="small m-b-xs">
                                 <span class="text-muted"><i class="fa fa-clock-o"></i>
                                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${n.createTime}"/>
                                </span>
                            </div>
                            <p>
                                <c:choose>
                                    <c:when test="${fn:length(n.content)>50}">
                                        ${fn:substring(n.content, 0, 50)}……
                                    </c:when>
                                    <c:otherwise>
                                        ${n.content}
                                    </c:otherwise>
                                </c:choose>
                            </p>
                            <img alt="image" class="img-circle m-t-xs" style="width: 150px; height:100px;" src="${path}/${n.photo}">
                            <div class="row">
                                <div class="col-md-push-6">
                                    <div class=" text-right">
                                        <button class="btn btn-primary" type="submit" onclick="deleteNews(${n.id})">删除</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script src="${path}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${path}/static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="${path}/static/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
<script type="text/javascript">
    function deleteNews(id){
        var con;
        con=confirm("确认删除吗？");
        if (con=true){
            $.ajax({
                method: 'POST',
                url: '${path}/admin/deleteNews',
                data: {
                    id: id
                },
                dataType: "json",
                success: function (data) {
                    if (data.success==true){
                        alert("删除成功！");
                        window.location.href="${path}/admin/query_news";
                    } else {
                        alert(data.error);
                    }
                }
            });
        } else{
            $(".font-warning").show();
        }
    }
</script>