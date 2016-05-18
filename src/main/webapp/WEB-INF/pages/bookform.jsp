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
<f:form class="form-horizontal" name="bookForm" method="POST" action="bookformsubmission.html" commandName="extBook" enctype="multipart/form-data">
<div class="form-group">
	<label for="title" class="col-sm-2 control-label">Title: </label>
	<div class="col-sm-10">
		<f:input id="title" path="title" size="50"/>
		<f:errors id="title" path="title" cssClass="error"/>
	</div>
</div>
<br />
<div class="form-group">
	<label for="author" class="col-sm-2 control-label" >Author: </label>
	<div class="col-sm-10">
		<select class="form-control" name="author" id="author">
			<c:forEach items="${author}" var="a">
				<option value="${a}">${a}</option>
			</c:forEach>
		</select>
	</div>
</div>
<br />
<div class="form-group">
	<label for="isbn" class="col-sm-2 control-label">ISBN: </label>
	<div class="col-sm-10">
		<f:input id="isbn" path="ISBN" size="30" />
		<f:errors id="isbn" path="ISBN" cssClass="error" />
	</div>
</div>
<br />
<div class="form-group">
	<label for="about" class="col-sm-2 control-label">Summary: </label>
	<div class="col-sm-10">
		<f:textarea id="about" class="form-control" rows="3" path="about" />
		<f:errors id="about" path="about" cssClass="error" />
	</div>
</div>
<br />
<div class="form-group">
	<label for="publisher" class="col-sm-2 control-label">Publisher: </label>
	<div class="col-sm-10">
		<select class="form-control" id="publisher" name="publisher">
			<c:forEach items="${publisher}" var="p">
				<option value="${p}">${p}</option>
			</c:forEach>
		</select>
	</div>
</div>		
<br />
<div class="form-group">
	<label for="price" class="col-sm-2 control-label">Price: </label>
	<div class="col-sm-10">
		<f:input id="price" path="price" size="30" />
		<f:errors id="price" path="price" cssClass="error" />
	</div>
</div>		
<br />
<div class="form-group">
	<label for="pages" class="col-sm-2 control-label">Total Pages: </label>
		<div class="col-sm-10">
		<f:input id="pages" path="pages" size="30" />
		<f:errors id="pages" path="pages" cssClass="error" />
	</div>
</div>		
<br />
<div class="form-group">
	<label for="category" class="col-sm-2 control-label">Category: </label>
		<div class="col-sm-10">
		<select id="category" class="form-control" name="category">
			<c:forEach items="${category}" var="c">
				<option value="${c}">${c}</option>
			</c:forEach>
		</select>
	</div>
</div>		
<br />
<div class="form-group">
	<label for="datepicker" class="col-sm-2 control-label">Published On: </label>
		<div class="col-sm-10">
		<f:input id="datepicker" path="date" size="30" value="dd/mm/yyyy" />
		<f:errors id="datepicker" path="date" cssClass="error" />
	</div>
</div>		
<br />
<div class="form-group">
	<label for="copies" class="col-sm-2 control-label">Total copies: </label>
		<div class="col-sm-10">
		<f:input id="copies" path="copies" size="30" />
		<f:errors id="copies" path="copies" cssClass="error" />
	</div>
</div>		
<br />
<div class="form-group">
	<label for="file" class="col-sm-2 control-label">Image: </label>
		<div class="col-sm-10">
		<input type="file" id="file" name="file">
		<f:errors id="file" path="imagepath" cssClass="error" /><br />
		</div>
</div>		
<br />
	<input type="submit" class="btn btn-primary" value="Submit" />
</f:form>
</div>
</body>
</html>