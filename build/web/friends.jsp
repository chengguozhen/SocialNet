<%-- 
    Document   : friends
    Created on : 2014-5-15, 11:23:10
    Author     : Administrator
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>        
        <link href="css/jquery.socialfeed.css" rel="stylesheet" type="text/css">
        <script src="js/jquery-1.7.2.min.js"></script>
        <script src="js/jquery.socialfeed.utility.js"></script>
        <script src="js/jquery.socialfeed.js"></script>
        <script src="js/reply.js"></script>
        <link href="./css/bootstrap.min.css" rel="stylesheet">        
        <link href="./css/signin.css" rel="stylesheet">                   
        <link href="./css/dashboard.css" rel="stylesheet">
        
        <style>
            /*This style is needed only for the plugin demo page. Do not use it in your projects*/
            .credits{text-align:center;padding:20px;margin-top:10px;font-size:12px;}
            body{ font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                  font-size: 14px;
                  line-height: 20px;
                  color: #333333;
                  background-color: #ffffff;
                  text-align:center;
            }
            a{color: #0088cc;text-decoration: none;}
            a:hover,a:focus {color: #005580;text-decoration: underline;}
            .muted {color: #999999;}
            .container {display:inline-block;width:600px;}
        </style>
    </head>
    
    <body>
        
      <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">          
          <a class="navbar-brand" href="./main.jsp">WeFriends</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="./dashboard.jsp"><% out.print(session.getAttribute("userName")); %></a></li>
            <li><a href="./friends.jsp">Friends</a></li>
            <li><a href="./group.jsp">Group</a></li>
            <li><a href="./logout.jsp">Logout</a></li>
            <li><a href=""></a></li>
          </ul>
            <form class="navbar-form navbar-right" action="searchResponse.jsp" method="get">
              <input type="text" class="form-control" placeholder="Search Friends..." id="search" name="search">
          </form>
        </div>
      </div>
    </div>
<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	String userID=(String)session.getAttribute("userID");
        System.out.println(userID);
	String driverName = "com.mysql.jdbc.Driver"; //驱动名称	
	Class.forName(driverName).newInstance();
	//链接数据库并保存到 conn 变量中
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/wefriends",
					"root", "pkueecs2014");	
	Statement stmt = conn.createStatement();	
	stmt.executeQuery("SET NAMES UTF8");			
	String sql = "select userID,userName,sex,birthday from `account`,`request` "
                + "where `request`.toUser = '"+userID + "' and `account`.userID = fromUser;";
        System.out.println(sql);
        ResultSet rs = stmt.executeQuery(sql);        
%>        
        
        <br><br><br><br>   
        
        <div style="float:left; width: 44%;"><hr/></div>
        <div style="float:right; width: 44%;"><hr/></div>
        Received Requests
        <!--a list of friend requests-->
        <div class="social-feed-container" style="display: inline-block;">
            <% while(rs.next()) { %>
        <div class="social-feed-element"> 
            <a class="pull-left" href=""> 
                <img class="media-object" src="img/<% out.print(Math.abs(rs.getString("userID").hashCode())%300); %>.jpg"> 
            </a> 
            <div class="media-body"> 
                <p>                    
                    <span class="author-title"><% out.print(rs.getString("userName")); %></span> 
                    <span class="muted">, <% out.print(rs.getString("sex")); %>, sent you friend request.</span>             
                </p> 
                <div> <p class="social-feed-text">Birthday: <% out.print(rs.getString("birthday")); %></p> </div>            
                <div style="text-align: right" id="<% out.print(rs.getString("userID")); %>">
                      <button class="btn btn-success"
                              onclick="<% out.print("sendReq('" + userID + "','"+ rs.getString("userID") + "')"); %>">Confirm</button>
                      <button class="btn btn-danger" 
                              onclick ="<% out.print("cancelReq('" + rs.getString("userID") + "', '" + userID + "')"); %>">Cancel</button>
                </div>
                </div>
                <div class="container">                
                <div class="col-xs-12 col-sm-12 col-md-12"></div>                
                </div>           
             </div>
        <% } %>
        </div>
        
<%
        stmt = conn.createStatement();	
	stmt.executeQuery("SET NAMES UTF8");			
	sql = "select userID,userName,sex,birthday from `account`,`friend` "
                + "where `friend`.userID1 = '"+userID + "' and `account`.userID = `friend`.userID2;";
        System.out.println(sql);
        rs = stmt.executeQuery(sql);        
%>        
        
        
        <br><br>
        <!--a list of my friends-->
        <div style="float:left; width: 44%;"><hr/></div>
        <div style="float:right; width: 44%;"><hr/></div>
        My Friends
        <div class="social-feed-container" style="display: inline-block;">            
            <% while(rs.next()) { %>
        <div class="social-feed-element"> 
            <a class="pull-left" href=""> 
                <img class="media-object" src="img/<% out.print(Math.abs(rs.getString("userID").hashCode())%300); %>.jpg"> 
            </a> 
            <div class="media-body"> 
                <p>                    
                    <span class="author-title"><% out.print(rs.getString("userName")); %></span> 
                    <span class="muted">, <% out.print(rs.getString("sex")); %>, we are friends now.</span>             
                </p> 
                <div> <p class="social-feed-text">Birthday: <% out.print(rs.getString("birthday")); %></p> </div>            
            </div>
            <div class="container">                
                <div class="col-xs-12 col-sm-12 col-md-12"></div>                
            </div>           
        </div>
        <% } %>
        </div>
        
    </body>
</html>
