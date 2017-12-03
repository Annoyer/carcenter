<%@ page import="com.carcenter.model.Admin" %>
<%@ page import="com.carcenter.model.Customer" %><%--
  Created by IntelliJ IDEA.
  User: joy12
  Date: 2017/12/3
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<% Admin admin = (Admin) session.getAttribute("admin"); %>
<% Customer customer = (Customer) session.getAttribute("customer"); %>

<link href="${path}/static/css/bootstrap.min.css" rel="stylesheet">

<script src="${path}/static/js/jquery.min.js"  charset="UTF-8"></script>
<script src="${path}/static/js/bootstrap.min.js"  charset="UTF-8"></script>
