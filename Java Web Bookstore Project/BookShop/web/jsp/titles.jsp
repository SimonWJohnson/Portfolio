<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <title>Untitled Document</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    </head>
    <%@ page import="model.*" %>
    <%@ page import="java.util.*"%>
    <%@ page import="java.text.*"%>
    
    <body bgcolor="#FFFFFF" text="#000000">
        <p>
        </p>
        <table width="38%" border="0" cellspacing="1" cellpadding="0" height="53" align="left">
            <tr> 
                <td bgcolor="#E2E2E2"> 
                    <div align="left"><font face="Arial, Helvetica, sans-serif"><font face="Times New Roman, Times, serif" size="3"><b><font face="Arial, Helvetica, sans-serif" size="2">Items 
                            in your Shopping Cart</font></b></font></font></div>
                </td>
            </tr>

            <c:set var="s_cart" value="${sessionScope.cart}"/>
            <c:choose>
                <c:when test='${not empty s_cart}'>
                    <c:forEach var="item" items="${s_cart}">
                        <c:set var="cartItem" value='${item.value}'/>
                        <c:set var="cost" value='${cartItem.getOrderCost()}'/>
                        <c:set var="totalCostOfOrder" value='${totalCostOfOrder + cost}'/>
                        <tr> 
                            <td height="13" bgcolor="#E8FFE8"><c:out value='${cartItem}'/></td>
                        </tr>
                    </c:forEach>
                        <tr> 
                            <td height="13" bgcolor="#CCCCCC"> 
                                <div align="right"><font face="Times New Roman, Times, serif"><b>
                                        <font size="2" face="Arial, Helvetica, sans-serif">
                                            <fmt:setLocale value="en_US"/>
                                            Order Total: <fmt:formatNumber value="${totalCostOfOrder}" type="currency"/>
                                        </font></b></font></div>
                            </td>
                        </tr>
                </c:when>
                <c:otherwise>
                        <tr> 
                            <td height="13">No Items in Cart</td>
                        </tr>
                </c:otherwise>
            </c:choose>
    </table>
    <p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><hr>
    <div>
       <jsp:include page="header.jsp" />
      
    </div>
    <form name="form1" method="post" action="./books">
        <input type="hidden" name="action" value="add_to_cart">
        <table width="93%" border="2" cellspacing="0" cellpadding="1" bordercolor="#FFFFFF">
            <tr bgcolor="#CCCCCC"> 
                <td widt><b>ISBN</b></td>
                <td width="37%"><b>Title</b></td>
                <td width="24%"><b>Author</b></td>
                <td width="13%"><b>Price</b></td>
                <td width="10%"><b>Quantity</b></td>
                <td width="6%"> 
                    <div align="left"><b>Add</b></div>
                </td>
            </tr>
            
            <c:set var="books" value="${sessionScope.books}"/>
            <c:choose>
               <c:when test='${not empty books}'>
                    <c:forEach var="book" items="${books}">
                        <c:set var="isbn" value='${book.getIsbn()}'/>
                        <c:set var="title" value='${book.getTitle()}'/>
                        <c:set var="author" value='${book.getAuthor()}'/>
                        <c:set var="price" value='${book.getDollarPrice()}'/>
                        <tr bgcolor="#F4F4F4"> 
                            <td width="10%"><c:out value="${isbn}"/></td>
                            <td width="37%"><c:out value="${title}"/></td>
                            <td width="24%"><c:out value="${author}"/></td>
                            <td width="13%"><c:out value="${price}"/></td>
                            <td width="10%"> 
                                <select name="${isbn}">size="1">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </td>
                            <td width="6%"> 
                                <div align="center"> 
                                    <input type="checkbox" name="add" value=<c:out value="${isbn}"/>>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
               </c:when>
                <c:otherwise>
                    <c:out value="No Books"/>
                </c:otherwise>     
            </c:choose>
          
            <tr> 
                <td width="10%"> 
                    <input type="submit" name="Details" value="Add to Cart">
                </td>
                <td width="37%">&nbsp;</td>
                <td width="24%">&nbsp;</td>
                <td width="13%">&nbsp;</td>
                <td width="10%">&nbsp;</td>
                <td width="6%">&nbsp;</td>
            </tr>
        </table>
    </form>
    <p><a href="./books?action=view_cart">View Shopping Cart</a></p>
    
     <div>
       <jsp:include page="footer.jsp" />
    </div>
</body>
</html>
