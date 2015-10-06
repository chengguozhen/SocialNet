<%--
    Document   : cancelRequest
    Created on : 2014-5-15, 16:47:56
    Author     : Administrator
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    String id1 = request.getParameter("id1");
    String id2 = request.getParameter("id2");
    String driverName = "com.mysql.jdbc.Driver";
    Class.forName(driverName).newInstance();

    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/wefriends",
                    "root", "secret");
    Statement stmt = conn.createStatement();
    stmt.executeQuery("SET NAMES UTF8");
    String sql = "delete from `request` " + "where `request`.toUser = '"
            +id2 + "' and `request`.fromUser = '" + id1 + "';";
    System.out.println(sql);
    stmt.execute(sql);
%>
