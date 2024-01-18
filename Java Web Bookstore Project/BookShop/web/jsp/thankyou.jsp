<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
</head>

<body>
    <div><jsp:include page="header.jsp" /></div>
<h2>Thank You For Shopping at Admit Bookstore
</h2>
<hr>
<h3 align="center">Your credit card details are being validated </h3>
<% session.invalidate(); %>
<div><jsp:include page="footer.jsp" /></div>
</body>
</html>
