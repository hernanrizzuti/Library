<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.css" />
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script	src="<%=request.getContextPath()%>/resources/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js" ></script>

<title>Library Home page</title>
</head>
<body>
<div class="container">
<%@ include file="menu.html" %>

<h1>Book:${book.title}</h1>
<p>Title: ${book.title}</p>
<p>Author: ${book.author}</p>
<p>ISBN number: ${book.ISBN}</p>
<p>Price: £${book.price}</p>
<c:if test="${! empty book.imagepath}">
 	<img src="<%=request.getContextPath()%>${book.imagepath}" alt="" style="width:75px; height:120px">
</c:if><br />
<f:form action="addtobasket.html" method="post" commandName="item">
	<f:hidden path="name" value="${book.title}"/>
	<select name="quantity">
	    <c:forEach var="copies" begin="1" end="${book.copies}">
	        <option value="${copies}">${copies}</option>
	    </c:forEach>
	</select>
	<input type="submit" value="add to basket"/>
</f:form>

</div>
</body>
</html>