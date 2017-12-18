<%--
  Created by IntelliJ IDEA.
  User: sts
  Date: 2017/12/13
  Time: PM5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>News</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="${path}/static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${path}/static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${path}/static/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="${path}/static/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="${path}/static/css/animate.min.css" rel="stylesheet">
    <link href="${path}/static/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">

        <div class="col-sm-9 animated fadeInRight">
            <div class="mail-box-header">
                <div class="pull-right tooltip-demo">

                    <a href="mailbox.html" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="放弃"><i class="fa fa-times"></i> 放弃</a>
                </div>
                <h2>
                    发布新闻
                </h2>
            </div>
            <div class="mail-box">


                <div class="mail-body">

                    <form class="form-horizontal" method="get">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">主题：</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="total">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">标题：</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="title">
                            </div>
                        </div>
                    </form>

                </div>

                <div class="mail-text h-200">

                    <div class="summernote">
                        <textarea name="brief" rows="20" cols="125" id="content"></textarea>



                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="mail-body text-right tooltip-demo">
                    <button class="btn btn-sm btn-primary" data-toggle="tooltip" data-placement="top" title="Send" onclick="release()">发布</button>
                    <%--<a href="mailbox.html" class="btn btn-sm btn-primary" data-toggle="tooltip" data-placement="top" title="Send"><i class="fa fa-reply"></i> 发布</a>--%>
                    <a href="" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Discard email"><i class="fa fa-times"></i> 放弃</a>

                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<script src="${path}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${path}/static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="${path}/static/js/content.min.js?v=1.0.0"></script>
<script src="${path}/static/js/plugins/iCheck/icheck.min.js"></script>
<script src="${path}/static/js/plugins/summernote/summernote.min.js"></script>
<script src="${path}/static/js/plugins/summernote/summernote-zh-CN.js"></script>
<script>
    $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",});$(".summernote").summernote({lang:"zh-CN"})});var edit=function(){$(".click2edit").summernote({focus:true})};var save=function(){var aHTML=$(".click2edit").code();$(".click2edit").destroy()};
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
<script type="text/javascript">
    function release() {
        var title = $("#title").val();
        var content = $("#content").val();
        if (title!=null && content!=null ){
            $.ajax({
                method: 'POST',
                url: '${path}/admin/release_news',
                data: {
                    titel: title,
                    content:content
                },
                dataType: "json",
                success: function (data) {
                    if (data.success==true){
                        alert("发布成功！");
                        window.location.href="${path}/release_news"
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