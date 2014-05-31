<%-- 
    Document   : checkNewMessage
    Created on : 2014-5-15, 22:10:12
    Author     : Administrator
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	String userID=(String)session.getAttribute("userID");                
	String driverName = "com.mysql.jdbc.Driver";
	Class.forName(driverName).newInstance();	
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/wefriends",
					"root", "pkueecs2014");	
	Statement stmt = conn.createStatement();	
	stmt.executeQuery("SET NAMES UTF8");		
        long cur = Long.parseLong((String)session.getAttribute("last"));
	String sql = "select distinct unix_timestamp(publishTime) as pub "
                + "from `friend`, `message`, `account`"
                + "where (userID1 ='" + userID
                + "' and userID2 = `message`.userID and `account`.userID = `message`.userID) "
                + "or (`message`.userID = '" + userID + "' and `account`.userID = `message`.userID)"
                + "order by publishTime desc;";
        System.out.println(sql);
        ResultSet rs = stmt.executeQuery(sql);       
        boolean ok = false;
        System.out.println("Time: " + cur);
        while(rs.next()) {
            long num = Long.parseLong(rs.getString("pub"))*1000;
            System.out.println("Database time: " + num);
            if (num > cur+100) {
                ok = true;
                break;
            }
        }
        if(ok) {
            out.print("ok");
        }
        else {
            out.print("no");
        }
%>
