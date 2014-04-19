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
//	if(session.getAttribute("login")!=null && session.getAttribute("login").equals("ok")){
//		ok=1;
//	}
	
	if(request.getParameter("userID")!=null && request.getParameter("passwd")!=null){
		String userID=request.getParameter("userID");
		String passwd=request.getParameter("passwd");

//		String path = request.getContextPath();
//		String basePath = request.getScheme() + "://"
//			+ request.getServerName() + ":" + request.getServerPort()
//			+ path + "/";

		/** 链接数据库参数 **/
		String driverName = "com.mysql.jdbc.Driver"; //驱动名称
//		String DBUser = "user1"; //mysql用户名
//		String DBPasswd = "123456"; //mysql密码
//		String DBName = "teaching"; //数据库名
//		String MySQLServer = "59.108.48.17"; //MySQL地址
//		String MySQLServerPort = "3307"; //MySQL端口号（默认为3306）
//
//		//数据库完整链接地址
//		String connUrl = "jdbc:mysql://"+MySQLServer+":"+MySQLServerPort+"/" + DBName + "?user="
//			+ DBUser + "&password=" + DBPasswd ;

		//加载数据库驱动
		Class.forName(driverName).newInstance();

		//链接数据库并保存到 conn 变量中
		Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/wefriends",
					"root", "pkueecs2014");

		//申明～？
		Statement stmt = conn.createStatement();

		//设置字符集
		stmt.executeQuery("SET NAMES UTF8");

		//要执行的 sql 查询
		String sql = "SELECT passwd FROM  `account` where userID='"+userID + "'";

		//取得结果
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()){
                        out.println("correct password: " + rs.getString("passwd"));
			if (rs.getString("passwd").equals(passwd)){
				ok=1;
				session.setAttribute("login","ok");
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
	String content=5+";URL="+"login.jsp";
	response.setHeader("REFRESH",content); 
    }
    %>
    </body>
</html>
