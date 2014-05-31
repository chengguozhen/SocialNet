<%-- 
    Document   : register
    Created on : 2014-4-18, 22:47:52
    Author     : Liang Wang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="./img/favicon.ico">

    <title>Register</title>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">       
    
    <!-- Bootstrap core CSS -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./css/signin.css" rel="stylesheet">
    <script src="./js/registerCheck.js"></script>
  </head>
 
<body>
<div class="container">

      <form class="form-signin" role="form" action="registerResponse.jsp" method="post">
        <h2 class="form-signin-heading">Register New Account</h2>
        <input type="email" class="form-control" placeholder="Email Address" 
               required="" autofocus="" name="userID">
        <input type="password" class="form-control" placeholder="Password" 
               required="" name="passwd" id="passwd">
        <input type="password" class="form-control" placeholder="Repeat Password" 
               required="" name="passwd1" id ="passwd1"> 
        <input type="text" class="form-control" placeholder="Name" required="" name="name">
        <input type="text" id="datepicker" class="form-control" placeholder="DD/MM/YY" 
               required="" name="birthday">

        <br>
        <div class="btn-group" data-toggle="buttons">
        <label class="btn btn-default active">
            <input type="radio" name="sex" id="sex" value="M" checked>
            Male </label>
        <label class="btn btn-default">
            <input type="radio" name="sex" id="sex" value="F">
            Female </label>    
        </div>
            
<!--        <label class="checkbox">
          <input type="radio" value="Male"> Remember me
        </label>-->
        <!--<div class="col-xs-6 col-sm-6 col-md-6">-->
        <p></p>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
	<!--</div>-->        
      </form>

    </div>
    <br><br><br>
        <div class="footer">
            <p>built by <a href="http://weibo.com/intfloat">Liang Wang</a>, Jia Kong, Die Duan, 2014.5</p>      
            <!--<li><a href="../about/">About</a></li>-->      
        </div>
</body>
</html>