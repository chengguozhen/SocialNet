<%-- 
    Document   : registerResponse
    Created on : 2014-4-18, 23:21:52
    Author     : Administrator
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
        <title>Register Response Page</title>
    </head>
    
    <%
	int ok=0;
	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
	String userID=request.getParameter("userID");
	String passwd=request.getParameter("passwd");
        String passwd1=request.getParameter("passwd1");
        if (passwd.equals(passwd1) == false) {
            out.println("Password is inconsistent!");
            String content=3+";URL="+"register.jsp";
            response.setHeader("REFRESH",content); 
            return;
        }
	String userName= request.getParameter("name");//获取请求参数  
	String sex=request.getParameter("sex");
	String birthday=request.getParameter("birthday");
//	String birthMonth=request.getParameter("birthMonth");

//		String path = request.getContextPath();
//		String basePath = request.getScheme() + "://"
//			+ request.getServerName() + ":" + request.getServerPort()
//			+ path + "/";

	/** 链接数据库参数 **/
	String driverName = "com.mysql.jdbc.Driver"; //驱动名称
//	String DBUser = "user1"; //mysql用户名
//	String DBPasswd = "123456"; //mysql密码
//	String DBName = "teaching"; //数据库名
//	String MySQLServer = "59.108.48.17"; //MySQL地址
//	String MySQLServerPort = "3307"; //MySQL端口号（默认为3306）
        
	Class.forName(driverName).newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/wefriends",
					"root", "pkueecs2014");
	Statement stmt = conn.createStatement();
	stmt.executeQuery("SET NAMES UTF8");
	
	String sql = "SELECT * FROM `account` where userID='"+userID+"'";
	//取得结果
	ResultSet rs = stmt.executeQuery(sql);
        String[] dates = birthday.split("/");
        birthday = dates[2]+"-"+dates[0]+"-"+dates[1];
	if (!rs.next()){
		sql = "INSERT INTO `account` VALUES('"+userID
                        +"','"+passwd+"','"+userName+"','"+sex+"','"+birthday+"')";                
		stmt.execute(sql);
		ok=1;
	}
	/** 关闭连接 **/
	conn.close();
	stmt.close();
	rs.close();	
    %>
    
    <body bgcolor="papayawhip">
    <%
    if (ok==1){
	out.println("<p>注册成功！！</p>");
	out.println("<p>3秒后返回<a href=\"login.jsp\">登陆</a>页面！</p>");
	String content=3+";URL="+"index.jsp";
	response.setHeader("REFRESH",content); 
    }else{
	out.println("<p>该用户名已占用！</p>");
	out.println("<p>3秒后返回注册页面！！</p>");
	String content=3+";URL="+"register.jsp";
	response.setHeader("REFRESH",content); 
    }
    %>
    </body>
</html>
