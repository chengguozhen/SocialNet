<%-- 
    Document   : group
    Created on : 2014-5-15, 11:23:20
    Author     : Administrator
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
        Statement stmt2 = conn.createStatement();	
	stmt.executeQuery("SET NAMES UTF8");			
	String sql = "select groupID, groupName from `group`";
        System.out.println(sql);
        ResultSet rs = stmt.executeQuery(sql); 
        ResultSet rs2 = null; 
 %>
        
        <br><br><br>
        <div style="float:left; width: 44%;"><hr/></div>
        <div style="float:right; width: 44%;"><hr/></div>
        Groups
        <!--a list of groups-->
        <div class="social-feed-container" style="display: inline-block;">
            <% while(rs.next()){ %>
            <div class="social-feed-element"> 
            <a class="pull-left" href=""> 
                <img class="media-object" src="img/<% out.print(Math.abs(rs.getString("groupID").hashCode())%300); %>.jpg"> 
            </a> 
            <div class="media-body"> 
                <p>                    
                    <span class="author-title"><% out.print(rs.getString("groupName")); %> Group</span>     
                </p> 
                <div> <p class="social-feed-text">Members: 
                        <%        
                            			
                            sql = "select userName from `account`, `groupInfo` where groupID='" 
                                    + rs.getString("groupID") + "' and `account`.userID = `groupInfo`.userID;";
                            System.out.println(sql);
                            rs2 = stmt2.executeQuery(sql); 
                            String result = "";
                            while(rs2.next()) {
                                result += rs2.getString("userName") + ",";
                            }
                            if(result.endsWith(",")) {
                                result = result.substring(0, result.length()-1);
                            }
                            else { result = "No Member Yet."; }
                            out.print(result);
                        %>
                        </p> 
                </div>            
                <div style="text-align: right" id="">
                       <%
                            sql = "select * from `groupInfo` where groupID = '"
                                    + rs.getString("groupID")
                                    + "' and userID = '" + userID + "';";
                            rs2 = stmt2.executeQuery(sql);
                            if(!rs2.next()){
                        %>
                            <button class="btn btn-success"
                              onclick="<% out.print("joinGroup('" + userID + "','"+ rs.getString("groupID") + "')"); %>">
                                Join Now!
                            </button>
                        <% } 
                            else {
                        %>
                        <button class="btn btn-group"
                              onclick="">I am a member</button>
                        <% } %>
                        
                </div>
            </div>
            <div class="container">                
                <div class="col-xs-12 col-sm-12 col-md-12"></div>                
            </div>           
            </div>
            <% } %>
            <br><br>
            <div class="container">                
                <div class="col-xs-10 col-sm-10 col-md-10">
                    <textarea class="form-control" rows="1" id="createGroup" placeholder="Enter Group Name Here"></textarea>                    
                </div>
                <div class="col-xs-1 col-sm-1 col-md-1">
                    <button type="button" class="btn btn-danger" 
                            onclick="createGroup()">
                    New Group</button>
                </div>
             </div>
            
        </div>
        
    </body>
</html>
