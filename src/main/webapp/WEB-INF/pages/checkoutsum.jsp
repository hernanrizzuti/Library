<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/employee_data.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.css" />
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script> -->
 <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<style>
div.a, div.b, div.c
{
   float: left;
}
</style>
<title>Check Out Summary</title>
</head>
<body>
<div class="container">
<%@ include file="menu.html" %>

<div class="a">
<b>&nbsp;<c:out value="Title"></c:out> </b>
<c:forEach var="book" items="${bookQuantity}">
  <div>
  	<p>&nbsp;<c:out value=" ${book.key} "/></p>
  </div>
</c:forEach>
</div>
<div class="b">
<b>&nbsp;<c:out value="Price"></c:out> </b>
<c:forEach var="price" items="${price}">
<div>
<p>&nbsp;<c:out value=" £${price.value} "/></p>
</div>
</c:forEach>
</div>
<div class="c">
<b>&nbsp;&nbsp;<c:out value="Items"></c:out> </b>
<c:forEach var="book" items="${bookQuantity}">
  <div>
 <p>&nbsp;&nbsp;<c:out value=" x${book.value} "/></p>
  </div>
</c:forEach>
</div>
</div>
<br/>
<h4><b>Summary:</b></h4>
<p><b>Total number of items:</b><c:out value=" ${ItemTotal}"/></p>
<p><b>Total Price:</b><c:out value=" £${priceTotal}"/> </p>

<a href="payment.html">Continue to Payment</a>

</body>
</html>