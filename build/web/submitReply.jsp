<%-- 
    Document   : submitReply
    Created on : 2014-4-19, 21:03:08
    Author     : Liang Wang
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
                System.out.println("Content: " + content);
		String messageID=request.getParameter("messageID");//获取请求参数  
		String userID=(String)session.getAttribute("userID");
		String publishTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); 

		String driverName = "com.mysql.jdbc.Driver"; 
		Class.forName(driverName).newInstance();		
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/wefriends",
					"root", "pkueecs2014");
		Statement stmt = conn.createStatement();
		stmt.executeQuery("SET NAMES UTF8");		
		String sql = "INSERT INTO  `comment` (userID,messageID,publishTime,content) VALUES ('"
                        + userID + "','" + messageID + "','" + publishTime + "','" + content + "')";
//		System.out.println("submitReply.jsp");		
                System.out.println("中文测试");
//		out.println(sql);
		//取得结果
		stmt.execute(sql);
		/** 关闭连接 **/
		conn.close();
		stmt.close();
	}	
%>
    </body>
</html>
