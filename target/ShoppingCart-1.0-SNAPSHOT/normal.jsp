<%
    Users user2 = (Users)session.getAttribute("current-user");
    
    if(user2 == null)
    {
        session.setAttribute("message", "You are not logged in...  Login First");
        response.sendRedirect("login.jsp");
        return;
    }
    else
    {
        if(user2.getUserType().equals("admin"))
        {
            session.setAttribute("message", "You have not permission to view this page...");
            response.sendRedirect("login.jsp");
            return;
        }
    
    }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShoppingCart - User Panel</title>
        <%@include file="components/comman_css_js.jsp" %>  <%-- including css--%>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %> <%-- including navbar--%>
        <h1>This page is for normal user</h1>
        <!--importing modal for adding items in the cart-->
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
