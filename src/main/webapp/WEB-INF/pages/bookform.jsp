<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Form</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script	src="<%=request.getContextPath()%>/resources/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js" ></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

  <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>

<style>
.error {
	color: #ff0000;
}
 
.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
</head>
<body>
<div class="container">
<%@ include file="menu.html" %>
<f:form name="bookForm" method="POST" action="bookformsubmission.html" commandName="extBook" enctype="multipart/form-data">
	<p>Title: </p>
		<f:input path="title" size="50" />
		<f:errors path="title" cssClass="error" />
	<br />
	<p>Author: </p>
		<select name="author">
			<c:forEach items="${author}" var="a">
				<option value="${a}">${a}</option>
			</c:forEach>
		</select>
	<br />
	<p>ISBN: </p>
		<f:input path="ISBN" size="30" />
		<f:errors path="ISBN" cssClass="error" />
	<br />
	<p>About: </p>
		<f:textarea path="about" />
		<f:errors path="about" cssClass="error" />
	<br />
		<p>Publisher: </p>
		<select name="publisher">
			<c:forEach items="${publisher}" var="p">
				<option value="${p}">${p}</option>
			</c:forEach>
		</select>
	<br />
	<p>Price: </p>
		<f:input path="price" size="30" />
		<f:errors path="price" cssClass="error" />
	<br />
	<p>Number of Pages: </p>
		<f:input path="pages" size="30" />
		<f:errors path="pages" cssClass="error" />
	<br />
		<p>Category: </p>
		<select name="category">
			<c:forEach items="${category}" var="c">
				<option value="${c}">${c}</option>
			</c:forEach>
		</select>
	<br />
		<p>Published On: </p>
		<f:input path="date" size="30" value="dd/mm/yyyy" id="datepicker"/>
		<f:errors path="date" cssClass="error" />
	<br />
	<p>Number of copies: </p>
		<f:input path="copies" size="30" />
		<f:errors path="copies" cssClass="error" />
	<br />
	<p>Book image: </p>
	<input type="file" name="file">
	<f:errors path="pages" cssClass="error" /><br />
	
	<input type="submit" value="Submit" />
</f:form>
</div>
</body>
</html>