<%--
  Created by IntelliJ IDEA.
  User: sts
  Date: 2017/12/13
  Time: PM4:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>发布停车位</title>
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
        <div class="col-sm-12">
            <div class="ibox float-e-margins">


            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
        </div>

    </div>
    <div class="col-sm-6">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>发布停车位</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>


                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content" style="padding: 15px 20px 250px;">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">名称：</label>
                        <div class="col-sm-8">
                            <input id="name" name="firstname" class="form-control" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">地址：</label>
                        <div class="col-sm-8">
                            <input id="address" class="form-control" type="text" aria-required="true" aria-invalid="false" class="valid">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">可租用车位：</label>
                        <div class="col-sm-8">
                            <input id="volumn" class="form-control" min="1" step="1" type="number" aria-required="true" aria-invalid="true" class="error">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">月租金：</label>
                        <div class="col-sm-8">
                            <input id="monthPrice" min="0" step="0.1" class="form-control" type="number">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">日租金：</label>
                        <div class="col-sm-8">
                            <input id="dayPrice" min="0" step="0.1" class="form-control" type="number">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-8 col-sm-offset-3">
                            <button class="btn btn-primary" onclick="releaseParking()">发布</button>
                        </div>
                    </div>
            </div>
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
    function releaseParking() {
        var name = $("#name").val();
        var address = $("#address").val();
        var volumn = $("#volumn").val();
        var monthPrice = $("#monthPrice").val();
        var dayPrice = $("#dayPrice").val();

        if (name!=null && address!=null && volumn!=null && monthPrice!=null && dayPrice!=null){
            $.ajax({
                method: 'POST',
                url: '${path}/admin/releaseParking',
                data: {
                    name: name,
                    address:address,
                    volumn:volumn,
                    priceMonth:monthPrice,
                    priceDay:dayPrice
                },
                dataType: "json",
                success: function (data) {
                    if (data.success==true){
                        alert("发布成功！");
                        window.location.href="${path}/admin/parking_lot"
                    } else {
                        alert(data.error);
                    }
                }
            });
        } else{
            alert("请完整填写信息");
        }
    }
</script>