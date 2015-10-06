<%--
    Document   : sendRequest
    Created on : 2014-5-15, 16:18:26
    Author     : Administrator
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    String id1 = request.getParameter("id1");
    String id2 = request.getParameter("id2");
    System.out.println("In sendRequest: " + id1);
    System.out.println("In sendRequest: " + id2);
    String driverName = "com.mysql.jdbc.Driver";
    Class.forName(driverName).newInstance();

    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/wefriends",
                    "root", "secret");
    Statement stmt = conn.createStatement();
    stmt.executeQuery("SET NAMES UTF8");
    String sql = "select * from `request` "+ "where `request`.toUser = '"
            +id1 + "' and `request`.fromUser = '" + id2 + "';";
    System.out.println(sql);
    ResultSet rs = stmt.executeQuery(sql);
    if (rs.next()) {
        sql = "delete from `request` " + "where `request`.toUser = '"
            +id1 + "' and `request`.fromUser = '" + id2 + "';";
        System.out.println(sql);
        stmt.execute(sql);
        sql = "insert into `friend` values ('" + id1 + "', '" + id2 + "');";
        System.out.println(sql);
        stmt.execute(sql);
        sql = "insert into `friend` values ('" + id2 + "', '" + id1 + "');";
        System.out.println(sql);
        stmt.execute(sql);
    }
    else {
        sql = "insert into `request` values ('" + id1 + "', '" + id2 + "');";
        stmt.execute(sql);
    }
%>
