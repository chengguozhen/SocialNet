<!--
    Document   : main
    Created on : 2014-4-19, 11:19:01
    Author     : Liang Wang
-->

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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

            
        
        <h2>Welcome to WeFriends!</h2>        
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
	Statement stmt2 = conn.createStatement();	
	stmt2.executeQuery("SET NAMES UTF8");	
	String sql = "select userName from `account` where userID = '"+userID + "';";
        System.out.println(sql);
        ResultSet rs = stmt.executeQuery(sql);
        String userName = "";
        if (rs.next()) {
           userName = rs.getString(1);
        }
        System.out.println("Current user: " + userName);
        if (userName.length() == 0) { 
//          should not happen if the code has no bug   
            out.println("alert(\"something wrong... cannot find current user\")");
        }
%>

        <div class="container">
        <div class="col-xs-11 col-sm-11 col-md-11">
            <textarea class="form-control" rows="4" placeholder="Wanna say something?"
                      name="message" id="message"></textarea>                        
        </div>        
        <div class="col-xs-8 col-sm-8 col-md-8"></div>
        <div class="col-xs-4 col-sm-4 col-md-4">
        <button type="button" class="btn btn-lg btn-danger" onclick="submitMessage()">Publish</button>
        </div>
            </div>
        
        <hr width="700" align="center"/>
        
        <div class="container">
            <!--<h3 class="muted">social - feed</h3>-->
                 
<%
//      used to retrieve corresponding messages
        sql = "select distinct messageID, `message`.userID as userID, publishTime, content, userName "
                + "from `friend`, `message`, `account`"
                + "where (userID1 ='" + userID
                + "' and userID2 = `message`.userID and `account`.userID = `message`.userID) "
                + "or (`message`.userID = '" + userID + "' and `account`.userID = `message`.userID)"
                + "order by publishTime desc;";
        stmt.executeQuery("SET NAMES UTF8");
        rs = stmt.executeQuery(sql);               
        while (rs.next()) {
%>              
        <div class="social-feed-container" style="display: inline-block;">            
        <div class="social-feed-element"> 
            <a class="pull-left" href=""> 
                <img class="media-object" src="img/<% out.print(Math.abs(rs.getString("userID").hashCode())%300); %>.jpg"> 
            </a> 
            <div class="media-body"> 
                <p>                    
                    <span class="author-title">
                        <% out.println(rs.getString("userName")); %>
                    </span> 
                        <span class="muted">
                            <% out.println(rs.getString("publishTime")); %>
                        </span>             
                </p> 
                <div> <p class="social-feed-text">
                        <% out.println(rs.getString("content"));  %>                        
                      </p> 
                </div> 
            </div>
                        <div  style="text-align: right">
                            <a onclick="setTextArea('<% out.print(rs.getString("userName")); %>',
                                <%out.print(rs.getString("messageID")); %>)"
                              href="javascript:void(0)">Reply</a></div>
                <div class="container">                
                <div class="col-xs-11 col-sm-11 col-md-11">
                    <textarea class="form-control" rows="1" id="<% out.print(rs.getString("messageID")); %>"
                              ></textarea>                    
                </div>
                <div class="col-xs-1 col-sm-1 col-md-1">
                    <button type="button" class="btn" 
                            onclick="submitReply('<% out.print(rs.getString("messageID")); %>')">
                    send</button>
                </div>
                </div>
<%
//               query for comments
                 String query2 = "select `account`.userName as replyUserName, publishTime, content"
                         + " from `account`, `comment` "
                         + "where `comment`.messageID = '"+rs.getString("messageID")
                         + "' and `account`.userID = `comment`.userID "
                         + "order by publishTime desc";
                 System.out.println("query2: "+ query2);
                 stmt2.executeQuery("SET NAMES UTF8");
                 ResultSet rs2 = stmt2.executeQuery(query2);
                 while (rs2.next()) {
%>                
                <div name="<% out.print(rs.getString("messageID")+"_comments"); %>" >
                <p>
                    <span class="author-title">
                        <% out.println(rs2.getString("replyUserName")); %>
                    </span>
                <span class="muted">
                    <% out.println(rs2.getString("content") 
                       + " (" + rs2.getString("publishTime") + ")" ); %>                    
                </span>
                       <span  style="text-align: right">
                           <a onclick="setTextArea('<% out.print(rs2.getString("replyUserName")); %>',
                              <% out.print(rs.getString("messageID")); %>)" href="javascript:void(0)">Reply</a></span>
                </p>                     
                </div>                
                <% } %>           
                </div>
        <br>&nbsp;<br>
                <% } %>
        </div>        
        </div>
        
    </body>
</html>
