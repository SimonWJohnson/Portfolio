<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">

<h2 align="center"><font color="#003333">ADMIT ONLINE BOOKSTORE</font></h2>
<hr>
<h3><font face="Georgia, Times New Roman, Times, serif">Thank you for shopping 
  with us.</font> </h3>
<p>&nbsp;</p>
<%
	String message = (String)request.getAttribute("result");
	session.invalidate();
%>
<table width="100%" border="0" cellspacing="1" cellpadding="0">
  <tr>
    <td bgcolor="#FFFFD7"><%= message %></td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
