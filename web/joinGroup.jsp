<%--
    Document   : joinGroup
    Created on : 2014-5-15, 19:00:11
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
    String userID = request.getParameter("userID");
    String groupID = request.getParameter("groupID");
    String driverName = "com.mysql.jdbc.Driver";
    Class.forName(driverName).newInstance();

    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/wefriends",
                    "root", "secret");
    Statement stmt = conn.createStatement();
    stmt.executeQuery("SET NAMES UTF8");
    String sql = "insert into groupInfo values ('" + groupID + "', '" + userID + "');";
    System.out.println(sql);
    stmt.execute(sql);
%>
