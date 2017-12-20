<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>租车预约</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/jcy.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/style.css">
</head>
<body>
<!-- Page Header -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!--页面内容-->
<div class="offset-80">
    <form class="page_content offset_60" action="${path}/carOrder/makeRentInOrder" method="post">
        <input hidden name="carId" value="${car.id}">
        <input hidden name="hirerId" value="<%=customer.getId()%>">
        <div class="form-title">订单</div>

        <div class="offset-30">
            <hr/>
            <div class="offset-30 container">
                <div class="row">
                    <div class="item_img_wrapper_sm background_100 col-xs-4 col-md-4" id="itemImgsm" style="background: url(${path}/${car.photo}) no-repeat; background-size:100% 100%;">
                    </div>
                    <div class="col-xs-8 col-md-8">
                        <div class="text_title margin_left_right_40 col-xs-12 col-md-12" id="itemName">${car.brand}-${car.brandType}</div>
                        <div class="offset_80">
                            <div class="margin_left_right_40" style="font-size: 18px;">
                                <div class="offset-20 col-xs-12 col-md-12">
                                    日租：
                                    <span class="car-price-lg">
                            ￥${car.priceDay}
                        </span>
                                    /日
                                </div>
                                <div class="offset-20 col-xs-12 col-md-12">
                                    周租：
                                    <span class="car-price-lg">
                            ￥${car.priceWeek}
                        </span>
                                    /周
                                </div>
                                <div class="offset-20 col-xs-12 col-md-12">
                                    月租：
                                    <span class="car-price-lg">
                            ￥${car.priceMonth}
                        </span>
                                    /月
                                </div>
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
                    <input type="radio" name="rentway" value="day" checked>日租
                </label>
                <label class="checkbox-inline">
                    <input type="radio" name="rentway" value="week">周租
                </label>
                <label class="checkbox-inline">
                    <input type="radio" name="rentway" value="month">月租
                </label>
            </div>
            <div class="offset_40" id="dayChoose" style="margin-left: 30px;">
                提车日期：<input type="text" name="dayStart" id="dayStart">
                天数：<input type="number" name="dayLen" id="dayLen" min="1">
            </div>
            <div class="offset_40" id="weekChoose" style="display: none;margin-left: 30px;">
                提车日期：<input type="text" name="weekStart" id="weekStart">
                周数：<input type="number" name="weekLen" id="weekLen" min="1">
            </div>
            <div class="offset_40" id="monthChoose"style="display: none;margin-left: 30px;">
                提车日期：<input type="text" name="monthStart" id="monthStart">
                月数：<input type="number" name="monthLen" id="monthLen" min="1">
            </div>
        </div>

        <div class="offset_80">
            <hr class="my_hr_long"/>
            <div class="offset_40">
                <div class="width_90 display_center">
                    <h3>总价：￥ <span id="totalPrice">${car.priceDay}</span></h3>
                    <input hidden name="price" value="${car.priceDay}">
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
    var perPrice = ${car.priceDay};
    $(document).ready(function() {
        $( "#dayStart" ).datepicker({
            minDate: 0,
            altField: '#dayStart'
        });

        $( "#weekStart" ).datepicker({
            minDate: 0,
            altField: '#weekStart'
        });
        $( "#monthStart" ).datepicker({
            minDate: 0,
            altField: '#monthStart'
        });


        $('input[type=radio][name=rentway]').change(function() {
            if (this.value == 'day') {
                $("#dayChoose").show();
                $("#weekChoose").hide();
                $("#monthChoose").hide();
                perPrice = ${car.priceDay};
                $("#totalPrice").html(perPrice * $("#dayLen").value);
                $("input[name=price]").val(perPrice * $("#dayLen").value);
            } else if (this.value == 'week') {
                $("#dayChoose").hide();
                $("#weekChoose").show();
                $("#monthChoose").hide();
                perPrice = ${car.priceWeek};
                $("#totalPrice").html(perPrice * $("#weekLen").value);
                $("input[name=price]").val(perPrice * $("#weekLen").value);
            } else if(this.value == 'month'){
                $("#dayChoose").hide();
                $("#weekChoose").hide();
                $("#monthChoose").show();
                perPrice = ${car.priceMonth};
                $("#totalPrice").html(perPrice * $("#monthLen").value);
                $("input[name=price]").val(perPrice * $("#monthLen").value);
            }
        });


        $('input[type=number]').change(function() {
            $("#totalPrice").html(perPrice*this.value);
            $("input[name=price]").val(perPrice*this.value);
        });
    });

</script>
</html>
