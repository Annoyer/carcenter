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


    <title>审核车辆</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="${path}/static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="${path}/static/css/animate.min.css" rel="stylesheet">
    <link href="${path}/static/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
</head>
<body class="gray-bg">
<div class="ibox-content">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <c:forEach items="${carcheck}" var="cc">
                <div class="col-sm-4">
                    <div class="contact-box">
                        <a href="profile.html">
                            <div class="col-sm-4">
                                <div class="text-center">

                                    <img alt="image" class="img-circle m-t-xs img-responsive" src="${path}/${cc.photo}">
                                    <div class="m-t-xs font-bold">ID:${cc.id}</div>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <h3><strong>品牌:${cc.brand}</strong></h3>
                                <p><i class="fa fa-map-marker"></i> 车牌号:${cc.license}</p>
                                <address>
                                    <strong>出厂日期：${cc.manufactureYear}</strong><br>
                                    颜色：${cc.color}<br>
                                    核载人数:${cc.passengerNum}<a href=""></a><br>
                                    车主ID：${cc.ownerId}<br>
                                    发布时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${cc.createTime}"/><br>
                                    <abbr title="Phone">状态:待审核</abbr>
                                </address>
                                <div class="col-sm-4 text-right">
                                    <button class="btn btn-primary" onclick="check(${cc.id})">通过审核</button>
                                </div>
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
<script type="text/javascript">
    $(document).ready(function(){$(".contact-box").each(function(){animationHover(this,"pulse")})});

    function check(id) {
        $.ajax({
            method: 'POST',
            url: '${path}/admin/checkCar',
            data: {
                carId: id
            },
            dataType: "json",
            success: function (data) {
                if (data.success == true){
                    location.reload();
                } else {
                    alert(data.error);
                }
            }
        });
    }
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>


</html>
