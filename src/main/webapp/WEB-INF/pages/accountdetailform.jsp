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
<c:set var='attribute' value='${fn:toUpperCase(fn:substring(acccountAttr, 0, 1))}${fn:toLowerCase(fn:substring(acccountAttr, 1,fn:length(acccountAttr)))}' />
<title>Change your ${attribute}</title>
</head>
<body>
<div class="container">
<%@ include file="menu.html" %>
<c:set var='attribute' value='${fn:toUpperCase(fn:substring(acccountAttr, 0, 1))}${fn:toLowerCase(fn:substring(acccountAttr, 1,fn:length(acccountAttr)))}' />
<h4 align="center">Change your ${attribute}</h4>	
<table align="center" class="table table-striped table-bordered">
<tr>
	<td>
		<form method="post" action="new-${acccountAttr}.html">
		<c:if test="${acccountAttr == 'title'}">
			<p><strong><c:out value='Old ${attribute}'/>:</strong><br /><c:out value='${title}'/></p>
			<label for="title"><strong><c:out value='New ${attribute}'/>:</strong> </label>
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
						</select><br />
		</c:if>
		<c:if test="${acccountAttr == 'name'}">
			<p><strong><c:out value='Name'/>:</strong><br />
			<c:out value='${firstName} ${lastName}'/></p>
			<label for="firstName"><strong><c:out value='New First name'/>:</strong> </label>
			<input name="firstName" type="text"/><br />
			<label for="lastName"><strong><c:out value='New Last name'/>:</strong> </label>
			<input name="lastName" type="text"/>
		</c:if>
		<c:if test="${acccountAttr == 'email'}">
			<p><strong><c:out value='Old ${attribute}'/>:</strong><br />
			<c:out value='${email}'/></p>
			<label for="email"><strong><c:out value='New ${attribute}'/>:</strong> </label>
			<input name="email" type="text"/><br />
			<label for="reEnteremail"><strong><c:out value='Re-enter ${attribute}'/>:</strong> </label>
			<input name="reEnteremail" type="text"/>
		</c:if>
		
		<c:if test="${acccountAttr == 'password'}">
			<label for="currentPassword"><strong><c:out value='Current ${attribute}'/>:</strong> </label>
			<input name="currentPassword" type="password"/><br />
			<label for="password"><strong><c:out value='New ${attribute}'/>:</strong> <br />
			6 to 20 char at least 1 digit, 1 upper case letter, 1 lower case letter and 1 special symbol @#$%!
			 </label>
			<input name="password" type="password"/><br />
			<label for="confirmPassword"><strong><c:out value='Re-enter ${attribute}'/>:</strong> </label>
			<input name="confirmPassword" type="password"/>
		</c:if>
		<br />
			<input type="submit" value="Save Changes" />
		</form>
	</td> 

</tr>

</table>
</div>
</body>
</html>