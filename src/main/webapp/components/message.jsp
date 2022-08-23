<%
    String message = (String)session.getAttribute("message");

    if(message != null)
    {
        // showing message
          
        // message is coming by bootstrap dismissing alerts 
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong><%= message %></strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<%
        // removing attribute
        session.removeAttribute("message");
    }
%>