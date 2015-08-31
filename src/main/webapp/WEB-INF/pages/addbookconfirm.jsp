<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script	src="<%=request.getContextPath()%>/resources/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js" ></script>
</head>
<body>
<div class="container">
<%@ include file="menu.html" %>
<%-- ${book.title} was added to the Library. --%>
${number}
</div>
</body>
</html>