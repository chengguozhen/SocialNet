<%-- 
    Document   : index
    Created on : 2014-4-14, 14:23:12
    Author     : Administrator
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
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
        <h1>Hello World!</h1>
        <% 
            // TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver");
		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/wefriends",
					"root", "pkueecs2014");
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery("select * from account");
			
//			it prints out desired result correctly, cheers!
//                        runs successfullly, haha
                        out.print("Here is the output from MySQL database<br>");
			while (rs.next()) {
				out.println(rs.getString("userID") + " " + rs.getString("passwd")
                                + " " + rs.getString("sex") + rs.getString("birthday") + "<br>");
			} // end while loop
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        %>
    </body>
</html>
