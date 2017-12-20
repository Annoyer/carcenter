<%--
  Created by IntelliJ IDEA.
  User: sts
  Date: 2017/12/13
  Time: PM4:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>租车位订单</title>

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
                    <h5>所有车位订单 </h5>

                </div>
                <div class="ibox-content icons-box">
                    <section id="new">

                            <div class="project-list">

                                <table class="table table-hover">
                                    <c:forEach items="${parkingorder}" var="po">
                                        <tbody>
                                        <tr>
                                            <td class="project-status">
                                            <span class="label label-primary">${po.id}
                                            </td>
                                            <td class="project-title">
                                                <h4>停车位：${po.parkingPlace.parkingLot.name}-${po.parkingPlace.identifier}</h4>
                                                <br/>
                                                <h4>租户ID： ${po.hirerId}</h4>
                                            </td>
                                            <td class="project-completion">
                                                <h4>价格：${po.price}元</h4>
                                            </td>
                                            <td class="project-order">
                                                <h4>开始日期：<fmt:formatDate pattern="yyyy-MM-dd" value="${po.startDay}"/></h4>
                                                <h4>结束日期：<fmt:formatDate pattern="yyyy-MM-dd" value="${po.endDay}"/></h4>
                                            </td>
                                            <td class="project-time">
                                                <h4>订单创建时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${po.createTime}"/></h4>

                                            </td>
                                            <td class="project-status">
                                                <h4>订单状态：
                                                    <c:choose>
                                                        <c:when test="${po.status==-1}">
                                                            已取消
                                                        </c:when>
                                                        <c:when test="${po.status==0}">
                                                            待开始
                                                        </c:when>
                                                        <c:when test="${po.status==1}">
                                                            进行中
                                                        </c:when>
                                                        <c:when test="${po.status==2}">
                                                            待开始
                                                        </c:when>
                                                        <c:when test="${po.status==3}">
                                                            历史订单
                                                        </c:when>
                                                        <c:otherwise>
                                                            待开始
                                                        </c:otherwise>
                                                    </c:choose></h4>

                                            </td>


                                        </tr>
                                        </tbody>
                                    </c:forEach>

                                </table>
                            </div>

                    </section>
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
