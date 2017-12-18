<%--
  Created by IntelliJ IDEA.
  User: sts
  Date: 2017/12/14
  Time: AM9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@include file="../common/const.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>留言箱</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="${path}/static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${path}/static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${path}/static/css/animate.min.css" rel="stylesheet">
    <link href="${path}/static/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">

        <div class="col-sm-9 animated fadeInRight">
            <div class="mail-box-header">

                <form method="get" action="搜索" class="pull-right mail-search">
                    <div class="input-group">
                        <input type="text" class="form-control input-sm" name="search" placeholder="搜索留言标题，正文等">
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-sm btn-primary">
                                搜索
                            </button>
                        </div>
                    </div>
                </form>
                <h2>
                    留言箱
                </h2>
                <div class="mail-tools tooltip-demo m-t-md">
                    <div class="btn-group pull-right">
                        <button class="btn btn-white btn-sm"><i class="fa fa-arrow-left"></i>
                        </button>
                        <button class="btn btn-white btn-sm"><i class="fa fa-arrow-right"></i>
                        </button>

                    </div>
                    <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="刷新邮件列表"><i class="fa fa-refresh"></i> 刷新</button>
                    <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="标为已读"><i class="fa fa-eye"></i>
                    </button>
                    <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="标为重要"><i class="fa fa-exclamation"></i>
                    </button>
                    <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="标为垃圾邮件"><i class="fa fa-trash-o"></i>
                    </button>

                </div>
            </div>
            <div class="mail-box">

                <table class="table table-hover table-mail">
                    <tbody>
                    <c:forEach items="${message}" var="m">
                        <tr class="unread">
                            <td class="check-mail">
                                <input type="checkbox" class="i-checks">
                            </td>
                            <td class="mail-ontact"><a href="/admin/mail_detail">${m.id}</a>
                            </td>
                            <td class="mail-subject"><a href="/admin/mail_detail">${m.fromId}</a>
                            </td>
                            <td class=""><i class="fa fa-paperclip">${m.content}</i>
                            </td>
                            <td class="text-right mail-date">${m.createTime}</td>
                            <td class="client-status"><span class="label label-primary">${m.isRead}</span>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="${path}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${path}/static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="${path}/static/js/content.min.js?v=1.0.0"></script>
<script src="${path}/static/js/plugins/iCheck/icheck.min.js"></script>
<script>
    $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
