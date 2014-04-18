<%-- 
    Document   : login
    Created on : 2014-4-18, 22:30:00
    Author     : Liang Wang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0040)http://getbootstrap.com/examples/signin/ -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="./img/favicon.ico">

    <title>Signin</title>

    <!-- Bootstrap core CSS -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./css/signin.css" rel="stylesheet">
    
  </head>

  <body>

    <div class="container">

      <form class="form-signin" role="form" action="loginResponse.jsp" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="email" class="form-control" placeholder="Email Address" required="" autofocus="">
        <input type="password" class="form-control" placeholder="Password" required="">
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <div class="col-xs-6 col-sm-6 col-md-6">
        <input type="submit" class="btn btn-lg btn-success btn-block" value="Sign In">
	</div>
        <div class="col-xs-6 col-sm-6 col-md-6">
	<button type="button" class="btn btn-lg btn-primary btn-block" onclick="location.href='register.jsp'">Register</button>
	</div>
        <!--<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>-->
        <!--<button class="btn btn-lg btn-primary btn-block">Register</button>-->
      </form>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->  

</body></html>

