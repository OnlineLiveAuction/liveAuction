<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Auction</title>
</head>
<body>

	<%
		String productId = (String)request.getParameter("productID");
	%>
	<p>Auction for <%out.println(productId); %></p>
	
</body>
</html>