<%--
  Created by IntelliJ IDEA.
  User: sts
  Date: 2017/12/13
  Time: PM3:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>demo
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
    <link rel="stylesheet" type="text/css" href="${path}/static/css/plugins/webuploader/webuploader.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/demo/webuploader-demo.min.css">
    <link href="${path}/static/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">


            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>用户添加</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>


                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal m-t" id="commentForm">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">姓名：</label>
                            <div class="col-sm-8">
                                <input id="name" name="name" minlength="2" type="text" class="form-control" required="" aria-required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">电话：</label>
                            <div class="col-sm-8">
                                <input id="phone" type="tel" class="form-control" name="phone" required="" aria-required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">密码：</label>
                            <div class="col-sm-8">
                                <input id="password" type="password" class="form-control" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">头像：</label>
                            <div class="col-sm-8">
                                <div id="filePicker" class="webuploader-container"><div class="webuploader-pick">点击选择图片</div>
                                    <div id="rt_rt_1c1028s3pgn71r1i14ao2ob14eg1" style="position: absolute; top: 0px; left: 289px; width: 168px; height: 44px; overflow: hidden; bottom: auto; right: auto;">
                                        <input type="file" name="file" class="webuploader-element-invisible" multiple="multiple" accept="image/*">
                                        <label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-3">
                                <button class="btn btn-primary"  onclick="register1()">提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="ibox float-e-margins">

            </div>
        </div>
        <div class="col-sm-6">
            <div class="ibox float-e-margins">


            </div>
        </div>
    </div>
</div>
<script src="${path}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${path}/static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="${path}/static/js/content.min.js?v=1.0.0"></script>
<script src="${path}/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${path}/static/js/plugins/validate/messages_zh.min.js"></script>
<script src="${path}/static/js/demo/form-validate-demo.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
<script type="text/javascript">
    function register1() {
        var phone = $("#phone").val();
        var name = $("#name").val();
        var password = $("#password").val();
        if (phone!=null && name!=null && password!=null){
            $.ajax({
                method: 'POST',
                url: '${path}/admin/add_user',
                data: {
                    phone: phone,
                    name:name,
                    password:password
                },
                dataType: "json",
                success: function (data) {
                    if (data.success==true){
                        alert("注册成功！");
                        window.location.href="${path}/add_user"
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
