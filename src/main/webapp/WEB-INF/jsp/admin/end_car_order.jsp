<%--
  Created by IntelliJ IDEA.
  User: sts
  Date: 2017/12/13
  Time: PM4:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>租车订单</title>

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

        <div class="col-md-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>所有租车订单 </h5>

                </div>
                <div class="ibox-content icons-box">
                    <section id="new">


                        <div class="row fontawesome-icon-list">

                            <div class="project-list">

                                <table class="table table-hover">
                                    <tbody>
                                    <c:forEach items="${endorder}" var="eo">
                                        <tr>
                                            <td class="project-status">
                                            <span class="label label-primary">${eo.id}
                                            </td>
                                            <td class="project-title">
                                                <h4>汽车ID:${eo.carId}</h4>
                                                <br/>
                                                <h4>车户ID:${eo.hirerId}</h4>
                                            </td>
                                            <td class="project-completion">
                                                <h4>价格:${eo.price}</h4>

                                            </td>

                                            <td class="order-start">
                                                <h4>截止日期:<fmt:formatDate pattern="yyyy-MM-dd" value="${eo.endDay}"/></h4>

                                            </td>

                                            <td class="order-starts">
                                                <h4>订单创建时间:<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${eo.createTime}"/></h4>

                                            </td>
                                            <td class="orders-status">
                                                <button class="label label-primary" onclick="end(${eo.id})">结束订单</button>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </section>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${path}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${path}/static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="${path}/static/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<script type="text/javascript">
    function end(id) {
        $.ajax({
            method: 'POST',
            url: '${path}/admin/endCarOrder',
            data: {
                orderId: id
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
</html>
