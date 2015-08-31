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

<title>Library Home page</title>
</head>
<body>
<script>
    var data = ${json};	
$(function() {
	$("#search").autocomplete(
	{
		 source:data
	})
});
</script>
<div class="container">
<%@ include file="menu.html" %>
		<div class="row">
			<div class="span4">
				<p>
					Total books in the Library are:
					<c:if test="${empty number}">
						<c:out value="0" />
					</c:if>
					<c:out value='${number}' />
				</p>
				<p><c:out value='${paymentConfirmation}' /></p>
			</div>
			<div class="span8">
				<p>Search by title or author:</p>
				<form method="post" action="searchBook.html">
					<input id="search" name="criteria" type="text"/> 
					<input type="submit" value="Search for Books" />
				</form>

				<c:if test="${!empty result}">

					<c:forEach items="${result}" var="element">
						<a href= <c:out value="${fn:replace(element.title,' ', '%20')}-details.html"/>>
							<c:out value="${element.title}" />
						</a><br />
					</c:forEach>
				</c:if>
			</div>
		</div>
		<br />
</div>
</body>
</html>