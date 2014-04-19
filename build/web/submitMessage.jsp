<%-- 
    Document   : submitMessage
    Created on : 2014-4-19, 21:03:26
    Author     : Liang Wang
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
//	int ok=0;
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("UTF-8");
	if(request.getParameter("words")!=null){
		String content= java.net.URLDecoder.decode(request.getParameter("words"),"UTF-8");//获取请求参数  
		String userID=(String)session.getAttribute("userID");
		String publishTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); 

		String driverName = "com.mysql.jdbc.Driver"; //驱动名称		
		Class.forName(driverName).newInstance();
		Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/wefriends",
					"root", "pkueecs2014");		
		Statement stmt = conn.createStatement();
		stmt.executeQuery("SET NAMES UTF8");
		String sql = "INSERT INTO  `message` (userID,publishTime,content) VALUES ('"
                         + userID + "','" + publishTime + "','"+content+"')";
		System.out.println(sql);
		stmt.execute(sql);		
		conn.close();
		stmt.close();
	}	
%>
    </body>
</html>
