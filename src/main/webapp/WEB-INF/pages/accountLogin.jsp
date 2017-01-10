<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.css" />
 <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<title>Account Login</title>
</head>
<body>
<div class="container">
<%@ include file="menu.html" %>
			<div class="span8">
				<h3>Login</h3>
				<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION.message}">
					<script type="text/javascript">
						$(document).ready(function() {
							$('.errorblock').fadeIn(2000);
						});
					</script>
					<div class="errorblock" style="display: none;">
						<p style="color: red">${SPRING_SECURITY_LAST_EXCEPTION.message}</p>
					</div>
					<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
				</c:if>
				<form name="form" action="<c:url value='j_spring_security_check'/>" method="post">
					<label for="j_username">Username:</label>
					<input  name='j_username' type="text" /><br />
					<label for="j_password">Password:</label>
					<input name='j_password' type="password" /><br />
					<input type="submit" value="Sign in" />
				</form>
				<a href="forgottenpassword.html" >Forgot Your Password?</a>
			</div>
		</div>
		</body>
</html>