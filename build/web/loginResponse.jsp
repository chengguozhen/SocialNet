<%-- 
    Document   : loginResponse
    Created on : 2014-4-18, 22:47:36
    Author     : Liang Wang
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Response</title>
    </head>
    <body>
    <%
	int ok=0;
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	if(request.getParameter("userID")!=null && request.getParameter("passwd")!=null){
		String userID=request.getParameter("userID");
		String passwd=request.getParameter("passwd");
		String driverName = "com.mysql.jdbc.Driver"; 
		Class.forName(driverName).newInstance();
		Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/wefriends",
					"root", "pkueecs2014");
		Statement stmt = conn.createStatement();
		stmt.executeQuery("SET NAMES UTF8");
		String sql = "SELECT passwd,userName FROM  `account` where userID='"+userID + "'";
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()){
			if (rs.getString("passwd").equals(passwd)){
				ok=1;
				session.setAttribute("login","ok");
                                session.setAttribute("userName", rs.getString("userName"));
				session.setAttribute("userID",userID);
				session.setMaxInactiveInterval(-1);
			}
		}
		
		/** 关闭连接 **/
		conn.close();
		stmt.close();
		rs.close();
	}
    if (ok==1){
	String content=0+";URL="+"main.jsp";
	response.setHeader("REFRESH",content); 
    }else{
	out.println("用户名或密码错误！");
//      the integer indicates the time delay for refreshing page
	String content=2+";URL="+"index.jsp";
	response.setHeader("REFRESH",content); 
    }
    %>
    </body>
</html>
