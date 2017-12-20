<%--
  Created by IntelliJ IDEA.
  User: sts
  Date: 2017/12/13
  Time: PM4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>停车位管理</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="${path}/static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="${path}/static/css/animate.min.css" rel="stylesheet">
    <link href="${path}/static/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <link href="${path}/static/css/jcy.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="offset-30 container animated fadeInRight">
    <c:forEach items="${parkspace}" var="ps" varStatus="i">
        <c:if test="${(i.index+1)%3 == 1}">
            <div class="row">
        </c:if>

            <div class="col-md-4">
                <div class="ibox">
                    <div class="ibox-title">
                        <h5>ID：${ps.id} &nbsp; 名称：${ps.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
                        <button class="btn btn-primary" type="submit" onclick="deleteLot(${ps.id})">删除</button>
                    </div>

                    <div class="ibox-content">
                        <div class="team-members" >
                           地址：${ps.address}<hr>
                        </div>
                        <div class="row  m-t-sm">
                            <div class="col-sm-4">
                                <div class="font-bold">月租金</div>
                                ${ps.priceMonth}
                            </div>
                            <div class="col-sm-4">
                                <div class="font-bold">日租金</div>
                                ${ps.priceDay}
                            </div>
                            <div class="col-sm-4 text-right">
                                <div class="font-bold">容量</div>
                                ${ps.volumn}
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <c:if test="${(i.index+1)%3 == 0}">
            </div>
        </c:if>
    </c:forEach>
</div>


<script src="${path}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${path}/static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="${path}/static/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
<script type="text/javascript">
    function deleteLot(id){
        var con;
        con = confirm("确认删除吗？");
        if ( con = true){
            $.ajax({
                method: 'POST',
                url: '${path}/admin/delete_lot',
                data: {
                    id: id
                },
                dataType: "json",
                success: function (data) {
                    if (data.success==true){
                        alert("删除成功！");
                        window.location.href="${path}/admin/parking_lot";
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
