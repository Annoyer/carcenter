<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/const.jsp" %>
<html>
<body>
<h2>Hello World!</h2>
<button onclick="location='${pageContext.request.contextPath}/customer/listAll'">跳转显示所有顾客</button>
</body>
</html>
