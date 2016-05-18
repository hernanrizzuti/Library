<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
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
<title>Payment Method</title>
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

<h2>Credit or Debit Card details</h2>

<f:form class="form-horizontal" name="paymentForm" method="POST" action="paymentsubmission.html" commandName="payment">
<div class="form-group">
	<label for="cardType" class="col-sm-2 control-label" >Cart Type: </label>
	<div class="col-sm-10">
		<select class="form-control" name="cardType" id="cardType">
			<%-- <c:forEach items="${author}" var="a">
				<option value="${a}">${a}</option>
			</c:forEach> --%>
			<option value="">Select Card Type</option>
			<option value="amex">American Express</option>
			<option value="maestro">Maestro</option>  
  			<option value="mastercard">MasterCard</option>	  
  			<option value="solomaestro">Solo</option>
			<option value="visadeltaelectron">Visa</option>
		</select>
	</div>
</div>
<br />
<div class="form-group">
	<label for="cardNum" class="col-sm-2 control-label">Card Number: </label>
	<div class="col-sm-10">
		<f:input id="cardNum" path="cardNumber" size="30" />
		<f:errors id="cardNum" path="cardNumber" cssClass="error" />
	</div>
</div>
<br />
<div class="form-group">
	<label for="cardName" class="col-sm-2 control-label">Cardholder's Name: </label>
		<div class="col-sm-10">
		<f:input id="cardName" path="cardholdersName" size="30" />
		<f:errors id="cardName" path="cardholdersName" cssClass="error" />
	</div>
</div>	
<br />
<div class="form-group">
	<label for="verCode" class="col-sm-2 control-label">Verification Code: </label>
	<div class="col-sm-10">
		<f:textarea id="verCode" path="verifCode" class="form-control" rows="3"  />
		<f:errors id="verCode" path="verifCode" cssClass="error" />
	</div>
</div>		
<br />
<div class="form-group">
	<label for="datepicker" class="col-sm-2 control-label">Expiration Date: </label>
		<div class="col-sm-10">
		<f:input id="datepicker" path="expiryDate" size="30" value="dd/mm/yyyy" />
		<f:errors id="datepicker" path="expiryDate" cssClass="error" />
	</div>
</div>		
<br />

<h2>Billing Address</h2>
<div class="form-group">
	<label for="cardNum" class="col-sm-2 control-label">Card Number: </label>
	<div class="col-sm-10">
		<f:input id="cardNum" path="cardNumber" size="30" />
		<f:errors id="cardNum" path="cardNumber" cssClass="error" />
	</div>
</div>
<br />
<div class="form-group">
	<label for="cardName" class="col-sm-2 control-label">Cardholder's Name: </label>
		<div class="col-sm-10">
		<f:input id="cardName" path="cardholdersName" size="30" />
		<f:errors id="cardName" path="cardholdersName" cssClass="error" />
	</div>
</div>	
<br />
<div class="form-group">
	<label for="verCode" class="col-sm-2 control-label">Verification Code: </label>
	<div class="col-sm-10">
		<f:textarea id="verCode" path="verifCode" class="form-control" rows="3"  />
		<f:errors id="verCode" path="verifCode" cssClass="error" />
	</div>
</div>		
<br />
<div class="form-group">
	<label for="datepicker" class="col-sm-2 control-label">Expiration Date: </label>
		<div class="col-sm-10">
		<f:input id="datepicker" path="expiryDate" size="30" value="dd/mm/yyyy" />
		<f:errors id="datepicker" path="expiryDate" cssClass="error" />
	</div>
</div>		
<br />		
<br />
	<input type="submit" class="btn btn-primary" value="Submit" />
</f:form>
</body>
</html>