<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
 <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<title>My Account Changes</title>
</head>
<body>
<div class="container">
<%@ include file="menu.html" %>

<h4 align="center">Change Account Details</h4>	
<table align="center" class="table table-striped table-bordered">
<tr>
	<td>
		<p><strong>Title:</strong> <br /><c:out value='${user.title}'/></p>
	</td>
	<td>
	<a href="edit-title.html">Edit</a>
	</td>
</tr>
<tr>
	<td>
		<p><strong>Name: </strong><br /><c:out value='${user.firstName} ${user.lastName}'/></p>
	</td>
	<td>
	<a href="edit-name.html">Edit</a>
	</td>
</tr>
<tr>
	<td>
		<p><strong>Email: </strong><br /><c:out value='${user.email}'/></p>
	</td>
	<td>
		<a href="edit-email.html">Edit</a>
	</td>
</tr>
<tr>
	<td>
		<p><strong>Password:</strong><br /><c:out value='*******'/></p>
	</td>
	<td>
	<a href="edit-password.html">Edit</a>
	</td>
</tr>
</table>
</div>
</body>
</html>