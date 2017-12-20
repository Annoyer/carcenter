<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户中心</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/jcy.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/style.css">
</head>
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
<body>
<!-- Page Header -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!--页面内容-->
<div class="offset-80 container">
    <div class="form-title text-center">修改车辆信息</div>

    <hr class="offset-30 my_hr_long"/>
    <div class="container container-center" style="width: 100%">
        <form id="carForm" class="page_content offset_60" action="${path}/customer/carModify" method="post">
            <input hidden name="id" value="${car.id}">
            <input hidden name="ownerId" value="${car.ownerId}">
            <input hidden type="number" name="status" value="0">
            <div class="row offset-20">
                <div class="col-xs-4 col-md-4">牌照号：</div>
                <input class="col-xs-6 col-md-6" type="text" name="license" value="${car.license}">
            </div>
            <div class="row offset-20">
                <div class="col-xs-4 col-md-4">提车地（市）：</div>
                <input class="col-xs-6 col-md-6" type="text" name="city" value="${car.city}">
            </div>
            <div class="row offset-20">
                <div class="col-xs-4 col-md-4">品牌：</div>
                <input class="col-xs-6 col-md-6" type="text" name="brand" value="${car.brand}">
            </div>
            <div class="row offset-20">
                <div class="col-xs-4 col-md-4">型号：</div>
                <input class="col-xs-6 col-md-6" type="text" name="brandType" value="${car.brandType}">
            </div>
            <div class="row offset-20">
                <div class="col-xs-4 col-md-4">生产年份：</div>
                <input class="col-xs-6 col-md-6" value="${car.manufactureYear}" type="number" min="2000" step="1" max="2018" name="manufactureYear">
            </div>
            <div class="row offset-20">
                <div class="col-xs-4 col-md-4">颜色：</div>
                <input class="col-xs-6 col-md-6" value="${car.color}" type="text" name="color">
            </div>
            <div class="row offset-20">
                <div class="col-xs-4 col-md-4">座位数：</div>
                <select class="col-xs-2 col-md-2" name="passengerNum" value="${car.passengerNum}">
                    <option value="2">2</option>
                    <option value="5">5</option>
                    <option value="7">7</option>
                    <option value="-1">7人以上</option>
                </select>
            </div>
            <div class="row offset-30">
                <div class="col-xs-4 col-md-4">
                    <label>日租价（元/天）：</label>
                    <input type="number" min="0.0" step="0.1" name="priceDay" value="${car.priceDay}">
                </div>
                <div class="col-xs-4 col-md-4">
                    <label>周租价（元/周）：</label>
                    <input type="number" min="0.0" step="0.1" name="priceWeek" value="${car.priceWeek}">
                </div>
                <div class="col-xs-4 col-md-4">
                    <label>月租价（元/月）：</label>
                    <input type="number" min="0.0" step="0.1" name="priceMonth" value="${car.priceMonth}">
                </div>
            </div>
            <input hidden name="photo" value="${car.photo}">
        </form>
        <div id="picDiv" class="offset-30 page_content">
            <form id="picForm" class="row">
                <label for="picInput" class="col-xs-5">照片上传：(仅支持.jpg .png)</label>
                <input id="picInput" class="col-xs-7" type="file" name="pic" onchange="checkFileExt(this.value)"/>
            </form>
            <div id="picDisplay" class="row" style="width: 400px; height: 300px">
                <img src="${path}/static/img/car.svg">
            </div>
        </div>
        <button class="btn-usual btn-md-my offset-30" onclick="formSubmit()">提交</button>

    </div>


</div>

<!-- Page Footer -->
<jsp:include page="../common/footer.jsp"></jsp:include>

<script type="text/javascript" src="${path}/static/js/jquery.form.js"></script>
<script type="text/javascript">
    function formSubmit(){
        var flag=true;
        $("input[type!=file]").each(function(i){
            var text = $(this).val();
            if(text==null || text ==""){
                alert("请完整填写信息！");
                flag=false;
                return false;
            }
        });
        if(flag){
            $('#carForm').submit();
        }
    }
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
            $('#picInput').replaceWith('<input id="picInput" type="file" name="pic" onchange="checkFileExt()"/>');
        }
    }

    function uploadPic() {
        $("#picForm").ajaxSubmit({
            type: "POST",
            url:"${path}/car/add/pic",
            dataType: "json",
            success: function(data){
                if(data.success==true){
                    $("#picDisplay").html("");
                    $("#picDisplay").append("<img style='width:100%;height100%;' src='${path}/"+data.data+"'/>");
                    $('#picInput').replaceWith('<input id="picInput" type="file" name="pic" onchange="checkFileExt()"/>');
                    $('input[name=photo]').val(data.data);
                } else {
                    alert(data.error);
                }
            }
        });
    }


</script>
</body>
</html>
