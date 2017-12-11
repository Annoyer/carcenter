<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>车位预约</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/jcy.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/style.css">
</head>
<body>
<!-- Page Header -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!--页面内容-->
<div class="offset-80">
    <form class="page_content offset_60" action="${path}/parking/makeParkingOrder" method="post">
        <input hidden name="hirerId" value="<%=customer.getId()%>">
        <div class="text_title">订单</div>

        <div class="offset_80">
            <hr class="my_hr_long"/>
            <div class="offset_60">
                <div class="item_img_wrapper_sm background_100 display_inlineblock display_verticalalign_top" id="itemImgsm" style="background: url(${path}/${car.photo}) no-repeat; background-size:100% 100%;">
                </div>
                <div class="display_inlineblock display_verticalalign_top margin_left_right_40">
                    <div class="text_title margin_left_right_40">${parkingLot.name}</div>
                    <div class="text_title margin_left_right_40">${parkingLot.address}</div>
                    <div class="offset_80">
                        <h5 class="margin_left_right_40">价格</h5>
                        <div class="offset_40">
                            <div class="car-price-lg">
                                日租：${parkingLot.priceDay}/日
                            </div>
                            <div class="car-price-lg">
                                月租：${parkingLot.priceMonth}/月
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="offset_80">
            <div class="offset_bottom_-10">
                <div class="text_title_xs_normal display_inlineblock">租期</div>
            </div>
            <hr class="my_hr_long"/>
            <div class="offset_40">
                <label class="checkbox-inline">
                    <input type="radio" name="rentway" value="day" checked="checked">日租
                </label>
                <label class="checkbox-inline">
                    <input type="radio" name="rentway" value="month">月租
                </label>
            </div>
            <div class="offset_40" id="dayChoose">
                起始日期：<input type="text" name="dayStart" id="dayStart">
                结束日期：<input type="text" name="dayEnd" id="dayEnd" readonly>
                天数：<input type="number" name="dayLen" id="dayLen" min="1" value="1">
            </div>
            <div class="offset_40" id="monthChoose"style="display: none">
                起始日期：<input type="text" name="monthStart" id="monthStart">
                结束日期：<input type="text" name="monthEnd" id="monthEnd" readonly>
                月数：<input type="number" name="monthLen" id="monthLen" min="1" value="1">
            </div>
        </div>

        <div class="offset_80">
            <div class="offset_bottom_-10">
                <div class="text_title_xs_normal display_inlineblock">车位选择</div>
            </div>
            <hr class="my_hr_long"/>
            <div class="offset_40">
                <select id="placeSelector" name="parkingPlaceId" disabled></select>
            </div>
        </div>

        <div class="offset_80">
            <hr class="my_hr_long"/>
            <div class="offset_40">
                <div class="width_90 display_center">
                    <h3>总价：￥ <span id="totalPrice">${parkingLot.priceDay}</span></h3>
                    <input hidden name="price" value="${parkingLot.priceDay}">
                    <input type="submit" class="offset_40 btn btn-lg btn_primary btn_padding_lg">
                </div>
            </div>
        </div>
    </form>
</div>

<!-- Page Footer -->
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<link rel="stylesheet" href="${path}/static/jquery-ui-1.12.1.custom/jquery-ui.min.css">
<script src="${path}/static/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="${path}/static/jquery-ui-1.12.1.custom/jquery.ui.datepicker-zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">
    var dateModel="yy-mm-dd";
    var perPrice = ${parkingLot.priceDay};
    $(document).ready(function() {
        $( "#dayStart" ).datepicker({
            minDate: 0,
            defaultDate:0,
            altField: '#dayStart'
        });

        $( "#monthStart" ).datepicker({
            minDate: 0,
            defaultDate:0,
            altField: '#monthStart'
        });


        $('input[type=radio][name=rentway]').change(function() {
            if (this.value == 'day') {
                $(this).attr("checked","checked");
                $('input[type=radio][name=rentway][value=month]').removeAttr("checked");
                $("#dayChoose").show();
                $("#monthChoose").hide();
                perPrice = ${parkingLot.priceDay};
                $("#totalPrice").html(perPrice * $("#dayLen").val());
                $("input[name=price]").val(perPrice * $("#dayLen").val());
                getAvailablePlaces($("#dayStart").val(),$("#dayLen").val(),"day");
            } else if(this.value == 'month'){
                $(this).attr("checked","checked");
                $('input[type=radio][name=rentway][value=day]').removeAttr("checked");
                $("#dayChoose").hide();
                $("#monthChoose").show();
                perPrice = ${parkingLot.priceMonth};
                $("#totalPrice").html(perPrice * $("#monthLen").val());
                $("input[name=price]").val(perPrice * $("#monthLen").val());
                getAvailablePlaces($("#monthStart").val(),$("#monthLen").val(),"month");
            }
        });


        $('input[type=number]').change(function() {
            $("#totalPrice").html(perPrice*this.value);
            $("input[name=price]").val(perPrice*this.value);

            if ($('input[type=radio][checked=checked]').val() == 'day') {
                getAvailablePlaces($("#dayStart").val(),$("#dayLen").val(),"day");
            } else if($('input[type=radio][checked=checked]').val() == 'month'){
                getAvailablePlaces($("#monthStart").val(),$("#monthLen").val(),"month");
            }
        });

        $('input[name=dayStart],input[name=monthStart]').change(function() {
            if ($('input[type=radio][checked]').val() == 'day') {
                getAvailablePlaces($("#dayStart").val(),$("#dayLen").val(),"day");
            } else if($('input[type=radio][checked]').val() == 'month'){
                getAvailablePlaces($("#monthStart").val(),$("#monthLen").val(),"month");
            }
        });
    });

    function getAvailablePlaces(start,length,way) {
        if(start==""||length==null||length<=0||way==null) return;
        $.ajax({
            method: 'POST',
            url: '${path}/parking/availablePlace',
            data: {
                lotId: ${parkingLot.id},
                startDay:start,
                length:length,
                way:way
            },
            dataType: "json",
            success: function (data) {
                $("#placeSelector").html("");
                if (data.success==true){
                    var placeList = data.data;
                    for (var i=0; i<placeList.length; i++){
                        $("#placeSelector").append("<option value='"+placeList[i].identifier+"'>"+placeList[i].identifier+"</option>");
                    }
                    $("#placeSelector").removeAttr("disabled");
                } else {
                    alert(data.error);
                }
            }
        });
    }

</script>
</html>
