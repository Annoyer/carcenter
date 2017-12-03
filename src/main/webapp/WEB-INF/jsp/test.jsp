
<%--
  Created by IntelliJ IDEA.
  User: joy12
  Date: 2017/12/3
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/const.jsp" %>
<html>
<head>
    <title>test</title>
</head>
<body>
<div>
    <table class="table">
        <tbody>
        <tr>
            <td>id</td>
            <td>name</td>
            <td>password</td>
            <td>phone</td>
            <td>headimg</td>
        </tr>
        <c:if test="${not empty customersList}">
            <c:forEach var="cus" items="${customersList}">
                <tr>
                    <td>${cus.id}</td>
                    <td>${cus.name}</td>
                    <td>${cus.password}</td>
                    <td>${cus.phone}</td>
                    <td>${cus.headimg}</td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>

<div>
    <input type="text" id="customerId" name="customerId" placeholder="请输入id,点击按钮查询">
    <button onclick="findCustomer()">查询</button>
    <table class="table">
        <tbody id="findTable">
        <tr>
            <td>id</td>
            <td>name</td>
            <td>password</td>
            <td>phone</td>
            <td>headimg</td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>

<script type="text/javascript">
    function findCustomer() {
        var id = $("#customerId").val();
        if (id!=null){
            $.ajax({
                method: 'POST',
                url: '${path}/customer/findCustomerById',
                data: {
                    customerId: id
                },
                dataType: "json",
                success: function (data) {
                    if (data.success==true){
                        var customer = data.data;
                        var str = "<tr><td>" + customer.id + "</td>" +
                            "<td>" + customer.name + "</td>" +
                            "<td>" + customer.password + "</td>" +
                            "<td>" + customer.phone + "</td>" +
                            "<td>" + customer.headimg + "</td></tr>";
                        alert(str);
                        $("#findTable").append(str);
                    } else {
                        alert(data.error);
                    }
                }
            });
        }
    }
</script>
