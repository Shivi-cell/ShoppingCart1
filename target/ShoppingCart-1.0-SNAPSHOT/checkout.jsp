<!--validation so that without login no one can access this page-->
<%
    Users user2 = (Users)session.getAttribute("current-user");
    
    if(user2 == null)
    {
        session.setAttribute("message", "You are not logged in...  Login First");
        response.sendRedirect("login.jsp");
        return;
    }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShoppingCart - Checkout</title>
        <%@include file="components/comman_css_js.jsp" %>  <%-- including css--%>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %> <%-- including navbar--%>
         <div class="container">
             <div class="row mt-3">
                 <!--first section for the cart details-->
                 <div class="col-md-6">
                     <div class="card">
                         <div class="card-body">
                             <h3 class="text-center mb-3" >Items present in your cart</h3>
                            <div class="cart-body"></div>
                         </div>
                     </div>
                 </div>
                 <!--second section for the user data i.e. form-->
                 <div class="col-md-6">
                     <div class="card">
                         <div class="card-body">
                            <h3 class="text-center mb-3" >Your shipping details</h3>
                            <form action="#">
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input type="email" value="<%= user2.getUserEmail() %>" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                                    
                                </div>    
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" value="<%= user2.getUserName() %>" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter your name here">
                                </div>  
                                <div class="form-group">
                                    <label for="phone">Contact number</label>
                                    <input type="text" value="<%= user2.getUserPhone() %>" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter your name here">
                                </div>  
                                <div class="form-group">
                                    <label for="address">Shipping Address</label>
                                    <textarea value="<%= user2.getUserAddress() %>" class="form-control" id="address" rows="3" placeholder="Enter your complete address"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Order Now</button>
                                    <button class="btn btn-outline-primary">Continue Shopping</button>
                                </div>
                            </form>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
        
        
        
        
        <!--importing modal for adding items in the cart-->
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
