<%--suppress ALL --%>
<%--
  Created by IntelliJ IDEA.
  User: sts
  Date: 2017/12/13
  Time: PM3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>用户管理</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="${path}/static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="${path}/static/css/animate.min.css" rel="stylesheet">
    <link href="${path}/static/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
</head>



<body class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-content">
                    <h2>用户管理</h2>
                    <div class="input-group">
                        <input type="text" id="searchValue" placeholder="查找用户" class="input form-control">
                            <span class="input-group-btn">
                                <button id="searchBtn" class="btn btn btn-primary" > <i class="fa fa-search"></i>搜索</button>
                            </span>
                     </div>
                    <div class="clients-list">
                        <ul class="nav nav-tabs">

                            <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-user"></i> 联系人</a>
                            </li>



                        </ul>
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane active">
                                <div class="full-height-scroll">
                                    <div class="table-responsive">
                                            <table class="table table-striped table-hover" id="#listContainer">
                                                <tbody id="tableContent">
                                                <c:forEach items="${clients}" var="c">
                                                <tr>

                                                    <td><a data-toggle="tab"  class="client-link">姓名：${c.name}</a>
                                                    </td>
                                                    <td> 密码：${c.password}</td>
                                                    <td class="contact-type"><i class="fa fa-phone"> </i>
                                                    </td>
                                                    <td> ${c.phone}</td>
                                                    <td class="client-status">
                                                        <button class="label label-primary" onclick="deleteclients(${c.id})" >删除用户</button>
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
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
<script src="${path}/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${path}/static/js/content.min.js?v=1.0.0"></script>
<script>
    $(function(){$(".full-height-scroll").slimScroll({height:"100%"})});
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>

</html>
<script type="text/javascript">
    $("#searchBtn").click(function () {
        var value = $("#searchValue").val();
        if (value == null || value == ""){
            location.reload();
        } else {
            $.ajax({
                method: 'POST',
                url: '${path}/admin/selectCustomer',
                data: {
                    search: value
                },
                dataType: "json",
                success: function (data) {
                    if (data.success == true) {
                        $("#tableContent").html("");
                        var clients = data.data;
                        var str = "";
                        for (var i = 0; i < clients.length; i++) {
                            str += '<tr><td><a data-toggle="tab" class="client-link">姓名：' + clients[i].name + '</a></td>' +
                                '<td> 密码：' + clients[i].password + '</td>' +
                                '<td class="contact-type"><i class="fa fa-phone"> </i></td>' +
                                '<td>' + clients[i].phone + '</td>' +
                                '<td class="client-status">' +
                                '<button class="label label-primary" onclick="deleteclients(' + clients[i].id + ')" >删除用户</button></td></tr>';
                        }
                        $("#tableContent").html(str);
                    }else {
                        alert(data.error);
                    }


                }
            });
        }

    });
    function deleteclients(id){
        var con;
        con=confirm("确认删除吗？");
        if (con=true){
            $.ajax({
                method: 'POST',
                url: '${path}/admin/delete_user',
                data: {
                    id: id
                },
                dataType: "json",
                success: function (data) {
                    if (data.success==true){
                        alert("删除成功！");
                        window.location.href="${path}/admin/clients";
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
