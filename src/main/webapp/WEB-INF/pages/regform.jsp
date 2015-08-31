<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.css" />
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<style>
.err {
    color: #FF0000;
    font-size: 12px;
}
</style>
<title>Library Home page</title>
</head>
<body>
<div class="container">
<%@ include file="menu.html" %>

<div class="hero-unit">
		<div class="row">
			<div class="span4">
			<div class="span8">
				<h2>Subscribe</h2>
				<form method="post" action="regsubmission.html" >
					<label for="title">title:</label>
					<select name="title">
						<option value="1">Mr</option>
						<option value="2">Mrs</option>
						<option value="3">Ms</option>
						<option value="4">Miss</option>
						<option value="5">Dr</option>
						<option value="6">Professor</option>
						<option value="7">Lord</option>
						<option value="8">Sir</option>
						<option value="9">Master</option>
						<option value="10">Other</option>
					</select>
					<label for="username">Username:</label>
					
					<input name="username" type="text" value='${username}' />*
					<div class="err"><c:out value='${usernameerr}' /></div>
					
					<label for="password">Password:<br /> 6 to 20 char at least 1 digit, 1 upper case letter, 1 lower case letter and 1 special symbol @#$%!</label>
					<input name="password" type="password"/>*
					<div class="err"><c:out value='${passworderr}' /></div>
					
					<label for="confirmPassword">Confirm Password:</label>
					<input name="confirmPassword" type="password" />*
					
					<label for="firstName">First Name:</label>
					
					<input name="firstName" type="text" value='${firtName}'/>*
					
					<label for="lastName">Last Name:</label>
					<input name="lastName" type="text"  value='${lastName}'/>*
					<div class="err"><c:out value='${firtNameOrLastNameerr}' /></div>
					<label for="email">Email:</label>
					
					<input name="email" type="text" value='${email}'/>*
					<div class="err"><c:out value='${emailerr}' /></div>
					
					<input type="submit" value="Subscribe" />
				</form>
			</div>
		</div>
		</div>
 </div>

</div>
</body>
</html>