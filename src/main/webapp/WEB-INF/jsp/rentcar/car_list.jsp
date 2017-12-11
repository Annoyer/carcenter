<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我要租车</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/jcy.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/style.css">
</head>

<body>
<!-- Page Header -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!--页面内容-->
<div class="page_content">
    <div class="offset-80">
        <div class="panel panel_choose_style">
            <div class="panel-body">
                <form class="style_selector" id="styleSelector" method="post"
                      action="${path}/car/select">
                    <div class="checkbox_group">
                        <div class="checkbox_group_row">
                            <div class="checkbox_group_label text_center">品牌</div>
                            <div class="checkbox_group_options">
                                <label class="checkbox-inline">
                                    <input type="radio" name="brand" value="不限" checked>不限
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="brand" value="保时捷">保时捷
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="brand" value="宝马">宝马
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="brand" value="奔驰">奔驰
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="brand" value="雪佛兰">雪佛兰
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="brand" value="沃尔沃">沃尔沃
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="brand" value="奥迪">奥迪
                                </label>
                            </div>
                        </div>
                        <div class="checkbox_group_row">
                            <div class="checkbox_group_label text_center">颜色</div>
                            <div class="checkbox_group_options">
                                <label class="checkbox-inline">
                                    <input type="radio" name="color" value="不限" checked >不限
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="color" value="黑色">黑色
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="color" value="白色">白色
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="color" value="红色">红色
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="color" value="黄色">黄色
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="color" value="蓝色">蓝色
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="color" value="银色">银色
                                </label>
                            </div>
                        </div>
                        <div class="checkbox_group_row">
                            <div class="checkbox_group_label text_center">座位</div>
                            <div class="checkbox_group_options">
                                <label class="checkbox-inline">
                                    <input type="radio" name="passengerNum" value="不限" checked >不限
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="passengerNum" value="2">2人
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="passengerNum" value="5">5人
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="passengerNum" value="7">7人
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="passengerNum" value="-1">7人以上
                                </label>
                            </div>
                        </div>
                        <div class="checkbox_group_row">
                            <div class="checkbox_group_label text_center">生产年份</div>
                            <div class="checkbox_group_options">
                                <label class="checkbox-inline">
                                    <input type="radio" name="years" value="不限" checked >不限
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="years" value="0-1">1年内
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="years" value="2-4">2-3年
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="years" value="5-7">5-7年
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="years" value="8-10">8-10年
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="years" value="10-100">10年以上
                                </label>
                            </div>
                        </div>
                        <div class="checkbox_group_row">
                            <div class="checkbox_group_label text_center">取车点</div>
                            <div class="checkbox_group_options">
                                <label class="checkbox-inline">
                                    <input type="radio" name="city" value="不限" checked >不限
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="city" value="上海">上海
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="city" value="北京">北京
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="city" value="浙江">浙江
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="city" value="江苏">江苏
                                </label>
                            </div>
                        </div>
                        <div class="checkbox_group_row">
                            <div class="checkbox_group_label text_center">价格(单日/元)</div>
                            <div class="checkbox_group_options">
                                <label class="checkbox-inline">
                                    <input type="radio" name="price" value="不限" checked >不限
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="price" value="0-500">500以下
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="price" value="500-1000">500-1000
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="price" value="1000-1500">1000-1500
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="price" value="1500-2000">1500-2000
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="price" value="2000-1000000">2000以上
                                </label>
                            </div>
                        </div>
                        <div class="checkbox_group_row">
                            <div class="checkbox_group_label text_center">租期</div>
                            <div class="">
                                <label class="checkbox-inline">
                                    提车日期：<input type="text" name="dateStart" id="dateStart">
                                </label>
                                <label class="checkbox-inline">
                                    还车日期：<input type="text" name="dateEnd" id="dateEnd">
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="align_right">
                        <input class="btn btn_submit" type="submit">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="offset_20 display_right">
        <ul id="commentNavbar" class="pagination pagination-sm">
            <li id="pageMark" class="display_inline" style="font-size: 18px; color: #888888"> 0 / 0 </li>
            <li><a href="#" id="first" class="display_inline">&laquo;</a></li>
            <li><a href="#" id="previous" class="display_inline"><</a></li>
            <li><a href="#" id="next" class="display_inline">></a></li>
            <li><a href="#" id="last" class="display_inline">&raquo;</a></li>
        </ul>
    </div>

    <div class="offset-80">
        <ul id="listContainer" class="container list-vertical-container">
            <c:forEach items="${cars}" var="c">
                <li class="row list-vertical-item">
                    <c:choose>
                        <c:when test="${not empty c.photo}">
                            <img class="col-xs-4 col-md-4" src="${path}/${c.photo}" alt="无法显示">
                        </c:when>
                        <c:otherwise>
                            <img class="col-xs-4 col-md-4" src="${path}/static/img/car.svg" alt="无法显示">
                        </c:otherwise>
                    </c:choose>

                    <div class="col-xs-4 col-md-4">
                        <div class="car-title">
                            ${c.brand}-${c.brandType}
                        </div>
                        <div class="car-brief">
                                ${c.passengerNum}人座
                        </div>
                        <div class="car-brief">
                                ${c.city}
                        </div>
                        <div class="car-brief">
                                ${c.manufactureYear}年产
                        </div>
                    </div>
                    <div class="col-xs-4 col-md-4">
                        <div class="car-price-lg">
                            日租：${c.priceDay}/日
                        </div>
                        <div class="car-price">
                            周租：${c.priceWeek}/周
                        </div>
                        <div class="car-price">
                            月租：${c.priceMonth}/月
                        </div>
                        <button class="btn-usual">预约</button>
                    </div>
                </li>
            </c:forEach>

        </ul>
    </div>

</div>
</div>

<!-- Page Footer -->
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<link rel="stylesheet" href="${path}/static/jquery-ui-1.12.1.custom/jquery-ui.min.css">
<script src="${path}/static/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="${path}/static/jquery-ui-1.12.1.custom/jquery.ui.datepicker-zh-CN.js" charset="UTF-8"></script>

<script type="text/javascript" src="${path}/static/js/jquery.form.js"></script>
<script type="text/javascript">
        var itemList = null;

        var pageSize = 3;
        var maxPageIndex;
        var currentPageIndex;

        //第一次加载本页面时，获取后台从mv传来的list
        $(window).bind("load",function () {
            $("#styleSelector").submit();
        });

        function dataRefresh() {

            maxPageIndex = Math.ceil(itemList.length/pageSize);
            currentPageIndex = 0;
            if (maxPageIndex > 0){
                currentPageIndex = 1;
            }

            $("#previous").unbind("click").click(function () {
                if (maxPageIndex > 0 && currentPageIndex > 1){
                    currentPageIndex = currentPageIndex - 1;
                    showList();
                }
            });
            $("#next").unbind("click").click(function () {
                if (maxPageIndex > 0 && currentPageIndex < maxPageIndex){
                    currentPageIndex = currentPageIndex + 1;
                    showList();
                }
            });
            $("#first").unbind("click").click(function () {
                if (currentPageIndex > 1){
                    currentPageIndex = 1;
                    showList();
                }
            });
            $("#last").click(function () {
                if (maxPageIndex > 0 && currentPageIndex < maxPageIndex){
                    currentPageIndex = maxPageIndex;
                    showList();
                }
            });
        }

        function showList() {
            // alert("进入显示阶段");
            $("#pageMark").html(currentPageIndex + " / " + maxPageIndex);
            var parent = $("#listContainer");
            parent.html("");
            if (itemList==null || itemList.length==0){
                parent.append('<div class=container-center>无结果</div>');
                return;
            }
            var start = (currentPageIndex - 1) * pageSize;
            var end = (start + pageSize) <= (itemList.length) ? (start + pageSize) : (itemList.length);
            for (var i = start; i < end; i++) {
                parent.append('<li class="row list-vertical-item">' +
                    '<img class="col-xs-4 col-md-4" src="${path}/' + itemList[i].photo + '" alt="无法显示"> ' +
                    '<div class="col-xs-4 col-md-4">' +
                    '<div class="car-title">' + itemList[i].brand+'-'+itemList[i].brandType + '</div>' +
                    '<div class="car-brief">'+itemList[i].passengerNum+'人座</div>' +
                    '<div class="car-brief">'+itemList[i].city+'</div>' +
                    '<div class="car-brief">'+itemList[i].manufactureYear+'年产</div>' +
                    '</div>' +
                    '<div class="col-xs-4 col-md-4">' +
                    '<div class="car-price-lg">日租：'+itemList[i].priceDay+'/日 </div> ' +
                    '<div class="car-price">周租：'+itemList[i].priceWeek+'/周 </div> ' +
                    '<div class="car-price">月租：'+itemList[i].priceMonth+'/月</div>' +
                    '<button class="btn-usual" onclick="javascript:location=\'${path}/car/single?id='+itemList[i].id+'\'">预约</button>' +
                    '</div>' +
                    '</li>');
            }
        }

        $('#styleSelector').on("submit", function() {
            var obj = getFormJson();
            $(this).ajaxSubmit({
                target:'#listContainer',
                data:obj,
                type:"post",                    //提交方式
                dataType:"json",                //数据类型
                url:"${path}/car/select",             //请求url
                clearForm:false,
                resetForm: false,
                success:function(data){         //提交成功的回调函数
                    //var cars = ;
                    //alert("ok");
                    if (data.success==true){
                        itemList = data.data;
                        dataRefresh();
                        showList();
                    }

                }
            });
            return false;
        });

        //将form中的值转换为键值对。
        function getFormJson() {
            var o = {};
            var a = $("#styleSelector").serializeArray();
            $.each(a, function () {
                if (o[this.name] !== undefined) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });

            return o;
        }

    var dateModel="yy-mm-dd";
    $(document).ready(function() {
        $( "#dateStart" ).datepicker({
            minDate: 0,
            dateFormat:dateModel,
            altField: '#dateStart',
            onSelect:function (dateText,inst) {
                var start = new Date(dateText.replace("-", "/").replace("-", "/"));
                var now = new Date();
                var time=start.getTime()-now.getTime();
                var days=parseInt(time/(1000 * 60 * 60 * 24));
                $( "#dateEnd" ).datepicker('setDate',days+1)
                $( "#dateEnd" ).datepicker('option','minDate',dateText);
            }
        });

        $( "#dateEnd" ).datepicker({
            minDate: 0,
            dateFormat:dateModel,
            altField: '#dateEnd'
        });

    });

</script>
</html>
