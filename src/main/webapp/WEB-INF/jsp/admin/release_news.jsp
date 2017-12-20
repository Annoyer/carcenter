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
    <title>发布新闻</title>

    <link href="${path}/static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${path}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${path}/static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${path}/static/css/animate.min.css" rel="stylesheet">
    <link href="${path}/static/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/plugins/simditor/simditor.css"/>
    <style>
        #picDiv{
            display: flex;
            justify-content: center;
            align-items: center;
            align-content: center;
            flex-wrap: wrap;
        }
        #picDisplay{
            width: 400px;
            height: 300px;
            padding: 10px;
        }
        #picDisplay > img{
            width: 380px;
            height: 280px;
        }
    </style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content container">
    <div class="row">

        <div class="col-md-9 animated fadeInRight" style="width: 92%">
            <div class="mail-box-header">
                <h2>发布新闻</h2>
            </div>
            <div class="mail-box">
                <form id="newsForm" action="${path}/admin/releaseNews" method="post">
                    <div class="mail-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-md-2 control-label">标题：</label>
                                <div class="col-md-8">
                                    <input type="text" name="title" class="form-control" id="title">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mail-body h-200">
                            <textarea name="content" rows="20" cols="125" id="content"></textarea>

                    </div>
                    <div class="clearfix"></div>
                    <input hidden name="photo" value="">
                </form>
                <div id="picDiv" class="offset-30 mail-body">
                    <form id="picForm" class="row">
                        <label for="picInput" class="col-xs-5">照片上传：(仅支持.jpg .png)</label>
                        <input id="picInput" class="col-xs-7" type="file" name="pic" onchange="checkFileExt(this.value)"/>
                    </form>
                    <div id="picDisplay" style="width: 400px; height: 300px">
                        <img id="picDisplayImg" src="${path}/static/img/photo-default.svg">
                    </div>
                </div>
                <div class="mail-body text-right tooltip-demo">
                    <button class="btn btn-sm btn-primary" data-toggle="tooltip" data-placement="top" title="Send" onclick="release()">发布</button>
                </div>
            </div>
        </div>


    </div>
</div>
<script src="${path}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${path}/static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="${path}/static/js/content.min.js?v=1.0.0"></script>
<script src="${path}/static/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript" src="${path}/static/js/plugins/simditor/module.js"></script>
<script type="text/javascript" src="${path}/static/js/plugins/simditor/uploader.js"></script>
<script type="text/javascript" src="${path}/static/js/plugins/simditor/hotkeys.js"></script>
<script type="text/javascript" src="${path}/static/js/plugins/simditor/simditor.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<script type="text/javascript" src="${path}/static/js/jquery.form.js"></script>
</body>
</html>
<script type="text/javascript">
    var mytoolbar = [
        'title',
        'bold',
        'italic',
        'underline',
        'strikethrough',
        'ol',
        'ul',
        'blockquote',
        'table',
        'indent',
        'outdent'
    ];

    var editIds = new Array('content');
    var editors = new Array(editIds.length);

    function release(){
        $('#newsForm').ajaxSubmit(function(message) {
            var data = eval("("+ message +")");
            if (data.success == false){
                alert(data.error);
            } else {
                window.location.href = "${path}/admin/query_news";
            }
        });
    }

    $(document).ready(function(){
        for (var i=0; i<editIds.length; i++){
            editors[i] = new Simditor({
                textarea:$("#"+editIds[i]),
                toolbar:mytoolbar
            })
        }

        $("span.fa").css("line-height","40px");

    });

    function checkFileExt() {
        var filename = $("#picInput").val();
        var flag = false; //状态
        var arr = ["jpg","png"];
        //取出上传文件的扩展名
        var index = filename.lastIndexOf(".");
        var ext = filename.substr(index+1);
        //循环比较
        for(var i=0;i<arr.length;i++) {
            if(ext == arr[i]) {
                flag = true; //一旦找到合适的，立即退出循环
                break;
            }
        }
        //条件判断
        if(flag) {
            uploadPic();
        } else {
            alert("不支持该图片文件类型，请重新上传");
            $('#picInput').replaceWith('<input id="picInput" class="col-xs-7"  type="file" name="pic" onchange="checkFileExt()"/>');
        }
    }

    function uploadPic() {
        $("#picForm").ajaxSubmit({
            type: "POST",
            url:"${path}/car/add/pic",
            dataType: "json",
            success: function(data){
                if(data.success==true){
                    $("#picDisplayImg").attr("src","${path}/"+data.data);
                    $('#picInput').replaceWith('<input id="picInput" class="col-xs-7"  type="file" name="pic" onchange="checkFileExt()"/>');
                    $('input[name=photo]').val(data.data);
                } else {
                    alert(data.error);
                }
            }
        });
    }
</script>