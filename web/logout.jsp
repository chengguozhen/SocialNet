<%-- 
    Document   : about
    Created on : 2014-5-15, 11:22:59
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("login", "no");
    session.setAttribute("userID", null);
    session.setAttribute("userName", null);
    response.setHeader("REFRESH","0;index.jsp");
%>