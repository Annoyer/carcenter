<%--
  Created by IntelliJ IDEA.
  User: sts
  Date: 2017/12/14
  Time: AM9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/const.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>留言详情</title>
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
                <div class="pull-right tooltip-demo">
                    <a href="mail_compose1.html" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="回复"><i class="fa fa-reply"></i> 回复</a>
                    <a href="" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="打印邮件"><i class="fa fa-print"></i> </a>
                    <a href="mailbox.html" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="标为垃圾邮件"><i class="fa fa-trash-o"></i> </a>
                </div>
                <h2>
                    查看留言
                </h2>
                <div class="mail-tools tooltip-demo m-t-md">


                    <h3>
                        <span class="font-noraml">主题： </span>幼儿园亲子班（园中园）项目方案
                    </h3>
                    <h5>
                        <span class="pull-right font-noraml">2014年10月28日(星期二) 晚上8:20</span>
                        <span class="font-noraml">发件人： </span>i@zi-han.net
                    </h5>
                </div>
            </div>
            <div class="mail-box">


                <div class="mail-body">
                    <p>
                        贝贝聪教育，因您而精彩！由于婴幼教育一体化更符合婴幼儿成长需求，是全球早教专家、心理学家普遍推崇的一种办园模式。在美国、日本、英国、意大利、新加坡等国家及我国香港、台湾等地区，幼儿园普遍开设了亲子班，美国幼儿园开亲子班的比率为87%，意大利比率为83%。香港、台湾地区分别为74%、76%。2003年3月4日，国务院办公厅转发了教育部等10部门（单位）《关于幼儿教育改革与发展的指导意见》，强调发展0－6岁婴幼儿教育。在《幼儿园教育指导纲要（试行）》中已明确指出幼儿园教育要与0-3岁教育做好衔接。北京、上海等地要求在2013年，65%的公立一级幼儿园开设亲子班或园中园。
                    </p>


                </div>

                <div class="mail-body text-right tooltip-demo">

                    <a class="btn btn-sm btn-white" href="mail_next.html"><i class="fa fa-arrow-right"></i> 下一封</a>
                    <button title="" data-placement="top" data-toggle="tooltip" type="button" data-original-title="打印这封邮件" class="btn btn-sm btn-white"><i class="fa fa-print"></i> 打印</button>
                    <button title="" data-placement="top" data-toggle="tooltip" data-original-title="删除邮件" class="btn btn-sm btn-white"><i class="fa fa-trash-o"></i> 删除</button>
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
<script>
    $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
