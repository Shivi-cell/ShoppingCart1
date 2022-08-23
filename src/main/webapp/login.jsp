
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShoppingCart - User Login</title>
        
         <%@include file="components/comman_css_js.jsp" %>  <%-- including css--%>
        <style>
            .card{
                border: 1px solid #8c9eff;
            }
            .bg-image
            {
                background-image: url(img/background.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                position: relative;
            }
            .main-bg
            {
                background-image: url(img/main_bg.jpeg);
                background-repeat: no-repeat;
                background-size: cover;
                min-height: 601px;
                min-width: 1366px;
            }
        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %> <%-- including navbar--%>
        <div class="container main-bg">
            <div class="row">
                
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-5">
                        <div class="card-header text-center text-white" style="background-color: #8c9eff;">
                            <h3>Login here</h3>
                        </div>
                        <div class="card-body bg-image">
                            <%@include file="components/message.jsp" %>
                            <form action="LoginServlet" method="post" class="container-image">
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                  
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <a href="register.jsp" class="text-center d-block mb-3">If not registered click here</a>
                               <div class="container text-center">
                                   
                                    <button class="btn btn-success">Submit</button>
                                    <button type="reset" class="btn btn-warning">Reset</button>
                               </div>
                               
                            </form> 
                        </div>
                  
                    </div>
                </div>
            </div>
            
        </div>
        
        
    </body>
</html>
