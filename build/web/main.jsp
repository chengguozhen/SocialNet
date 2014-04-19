<%-- 
    Document   : main
    Created on : 2014-4-19, 11:19:01
    Author     : Administrator
--%>

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
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="./css/signin.css" rel="stylesheet">
        
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
        <h1>Welcome to WeFriend!</h1>        
        
        <div class="container">
        <div class="col-xs-11 col-sm-11 col-md-11">
            <textarea class="form-control" rows="4" >Test</textarea>                        
        </div>        
        <div class="col-xs-8 col-sm-8 col-md-8"></div>
        <div class="col-xs-4 col-sm-4 col-md-4">
        <button type="button" class="btn btn-lg btn-primary" onclick="">Publish</button>
        </div>
            </div>
        
        <hr width="700" align="center"/>
        
        <div class="container">
            <!--<h3 class="muted">social - feed</h3>-->
        <div class="social-feed-container" style="display: inline-block;">
            <div class="social-feed-element"> 
            <a class="pull-left" href=""> 
                <img class="media-object" src="img/profile_3_75sq_1325536697.jpg"> 
            </a> 
            <div class="media-body"> 
                <p>                    
                    <span class="author-title">Kevin Systrom</span> 
                    <span class="muted"> - 19 days ago</span>             
                </p> 
                <div> <p class="social-feed-text">@tylermitchell9 went diving in some fresh pow.
                        Try some longer text,Try some longer text,Try some longer text,Try some longer text,
                        Try some longer text,Try some longer text,Try some longer text,Try some longer text,
                      </p> 
                </div> 
            </div>
                <div  style="text-align: right"><a href="">Reply</a></div>
                <div class="container">                
                <div class="col-xs-11 col-sm-11 col-md-11"><textarea class="form-control" rows="1" >Reply to Kevin:</textarea></div>
                <div class="col-xs-1 col-sm-1 col-md-1">
                    <button type="button" class="btn" onclick="">send</button>
                </div>
                </div>
                
                <div name="comemnts">
                <p>
                    <span class="author-title">
                        Liang Wang</span>
                <span class="muted">: wow! that must be very interesting! (2014-4-16 09:7:56)</span>
                <span  style="text-align: right"><a href="">Reply</a></span>
                </p>
                
                <p>
                    <span class="author-title">
                        Taylor</span>
                <span class="muted">: wow! that must be very interesting! wow! that must be very interesting!
                    wow! that must be very interesting!wow! that must be very interesting!
                    wow! that must be very interesting!wow! that must be very interesting!(2014-4-16 09:7:56)</span>
                <span  style="text-align: right"><a href="">Reply</a></span>
                </p>
                </div>
                
            </div>
        </div>
        </div>
        
    </body>
</html>
