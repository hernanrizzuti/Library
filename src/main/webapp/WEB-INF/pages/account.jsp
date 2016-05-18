<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.css" />
 <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<title>Your Account</title>
</head>
<body>
<div class="container">
<%@ include file="menu.html" %>

<h4>Payment Methods</h4>
<ul>
<li><a href="currentorders.html">Current Placed orders</a></li>
<li><a href="ordershistory.html">Orders History</a></li>
</ul>
<h4>Account Settings</h4>
<ul>
<li><a href="changes.html">Change Name, E-mail Address, or Password</a></li>
</ul>


</div>
</body>
</html>