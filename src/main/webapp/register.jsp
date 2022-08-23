
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShoppingCart -New User Registration</title>
        
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
       
        <%-- Designing the form--%>
        <div class="container-fluid main-bg">
             <div class="row " >
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-2">
                        <%@include file="components/message.jsp" %>
                        <div class="card-body bg-image">
                             <div class="container text-center" > 
                                 <h4 class="text-center" >Sign up here </h4>
                             </div>
                           

                             <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                <label for="name">User Name</label>
                                <input type="text" name="user_name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>

                                <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" name="user_email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>

                                <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="user_password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Password">
                                </div>

                                <div class="form-group">
                                <label for="phone">Enter Phone no</label>
                                <input type="number" name="user_phone" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter phone no">
                                </div>

                                <div class="form-group">
                                <label for="address">Enter Address</label>
                                <textarea class="form-control" name="user_address" placeholder="Enter address" style="height: 35px;"></textarea>
                                </div>
                                 <a href="login.jsp" class="text-center d-block mb-3">Already registered click here</a>
                                <div class="container text-center">
                                <button class="btn btn-success " >Register</button>
                                <button type= "reset" class="btn btn-warning " >Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
               </div>
            </div>   
        </div>
    </body>
</html>

  
