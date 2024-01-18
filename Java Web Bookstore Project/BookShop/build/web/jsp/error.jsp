<html>


<body bgcolor="white">
    <div><jsp:include page="header.jsp" /></div>
	<%@ page isErrorPage="true" %>
        <%  String msg = (String)request.getAttribute("result");
	    out.print("<h3>" + msg ); 
            //session.invalidate(); 
        %>
	<div><jsp:include page="footer.jsp" /></div>
</body>
</html>
