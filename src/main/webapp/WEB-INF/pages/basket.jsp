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
 
<title>Items in Basket</title>
</head>
<body>
<div class="container">
<%@ include file="menu.html" %>

<c:forEach var="item" items="${itemsInBasket}">
	<form action="updateItem.html" method="post">
	   <c:out value="${item.key}"></c:out> 
	   <input type="hidden" name="item" value="${item.key}"/>
	   <input type="text" name="quantity" value="${item.value}"/>
	   <input type="submit" name="submit" value="Update"/>
	   <input type="submit" name="submit" value="Remove"/>
	</form>
</c:forEach>
<c:choose> 
	<c:when test="${empty itemsInBasket}">
		<p><c:out value="There are currently no items in your Basket"/></p><br />
	</c:when>
	<c:otherwise>
			<a href="clearItems.html">Clear basket</a>
	</c:otherwise>
</c:choose>

<h4>Subtotal
	<c:choose>
		<c:when test="${empty baskettotal}">
			<c:out value="(0"/>
		</c:when>
		<c:otherwise>
			<c:out value="(${baskettotal}"/> 
		</c:otherwise>
	</c:choose> items): 
		<c:if test="${!empty baskettotalprice}">
			<c:out value="£${baskettotalprice}"/> 
		</c:if>
</h4>
<c:if test="${!empty itemsInBasket}">
	<a href="checkout.html">CheckOut</a>
</c:if>
</div>
</body>
</html>