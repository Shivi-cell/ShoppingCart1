<%-- for protecting this page we are going to use the validation  --%>
<%@page import="com.mycompany.shoppingcart.dao.UserDao"%>
<%@page import="com.mycompany.shoppingcart.entities.Product"%>
<%@page import="com.mycompany.shoppingcart.dao.ProductDao"%>
<%@page import="com.mycompany.shoppingcart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.shoppingcart.helper.FactoryProvider"%>
<%@page import="com.mycompany.shoppingcart.dao.CategoryDao"%>
<%@page import="com.mycompany.shoppingcart.entities.Users"%>
<%
    Users user = (Users)session.getAttribute("current-user");
    if(user == null)
    {
        session.setAttribute("message", "You are not logged in...  Login First");
        response.sendRedirect("login.jsp");
        return;
    }
    else
    {
        if(user.getUserType().equals("normal"))
        {
            session.setAttribute("message", "You have not permission to view this page...");
            response.sendRedirect("login.jsp");
            return;
        }
        
    }

%>


<% 
    CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cDao.getCategories();
    
    ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
    List<Product> plist = pDao.getAllProducts();
    
    UserDao uDao = new UserDao(FactoryProvider.getFactory());
    long count = uDao.getNoOfUsers();
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShoppingCart - Admin Panel</title>
        <%@include file="components/comman_css_js.jsp" %>  <%-- including css--%>
 <!--adding internal css-->
<style>
    .admin .card{
        border: 1px solid #8c9eff;
    }
    .card:hover
    {
      background: #e2e2e2;
      cursor: pointer;
    }
</style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %> <%-- including navbar--%>
       
        <%-- designing the admin panel --%>
        <div class="container admin">
            <!--giving the message-->
            <div class="container-fluid">
                <%@include file="components/message.jsp" %>
            </div>
            <!--first row-->
            <div class="row mt-3">
                <!--first col-->
                <div class="col-md-4">
                    <!--first box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img class="img-fluid rounded-circle" src="img/seo-and-web.png" alt="user_icon" style="max-width: 100px;">
                            </div>
                            <h1><%= count %></h1> 
                            <h1 class="text-uppercase text-muted">Users</h1> 
                        </div>
                    </div>
                    
                </div>
                <!--second col-->
                <div class="col-md-4" >
                    <!--second box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img class="img-fluid rounded-circle" src="img/list.png" alt="user_icon" style="max-width: 100px;">
                            </div>
                            <h1><%= list.size() %></h1>  
                            <h1 class="text-uppercase text-muted">Categories</h1>  
                        </div>
                    </div>
                    
                </div>
                <!--third col-->
                <div class="col-md-4">
                    <!--third box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img class="img-fluid rounded-circle" src="img/product.png" alt="user_icon" style="max-width: 100px;">
                            </div>
                            <h1><%= plist.size() %></h1> 
                            <h1 class="text-uppercase text-muted">Products</h1> 
                        </div>
                    </div>
                    
                </div>
                
            </div>
            
            <!--second row-->
            <div class="row mt-3">
                <!--second row:first box-->
                <div class="col-md-6">
                   <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img class="img-fluid rounded-circle" src="img/keys.png" alt="user_icon" style="max-width: 100px;">
                            </div>
                            <p class="mt-2">Click here to add new category</p> 
                            <h1 class="text-uppercase text-muted">Add Category</h1> 
                        </div>
                    </div>
                </div>
                <!--second row:second box-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon" style="max-width: 100px;">
                            </div>
                            <p class="mt-2">Click here to add new product</p> 
                            <h1 class="text-uppercase text-muted">Add Products</h1> 
                        </div>
                    </div>
                </div>
                
            </div>
            
        </div>
        
    <!--adding category modal-->
    <!-- Button trigger modal -->
        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document" >
            <div class="modal-content">
              <div class="modal-header" style="background:#8c9eff; color:white;">
                <h5 class="modal-title" id="exampleModalLabel">Add Category Details</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <form action="ProductOperationServlet" method="post">
                      <input type="hidden" name="operation" value="addCategory" />
                      <div class="form-group">
                          <input type="text" name="catTitle" class="form-control" placeholder="Enter category title" required />
                      </div>
                      <div class="form-group">
                          <textarea name="catDescription" class="form-control" placeholder="Enter category description" style="height:100px;" required></textarea>
                      </div>
                      <div class="container text-center">
                          <button class="btn btn-outline-success">Save Category</button>
                          <button type="reset" class="btn btn-outline-warning">Reset</button>
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      </div>
                  </form>
              </div>
            </div>
          </div>
        </div>
        
        <!--end of add category modal-->
        
        
    <!--adding product modal-->
    <!-- Button trigger modal -->
        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document" >
            <div class="modal-content">
              <div class="modal-header" style="background:#8c9eff; color:white;">
                <h5 class="modal-title" id="exampleModalLabel">Add Product Details</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                       <input type="hidden" name="operation" value="addProduct" />
                      <div class="form-group">
                          <input type="text" name="prodName" class="form-control" placeholder="Enter product name" required />
                      </div>
                      <div class="form-group">
                          <textarea name="prodDescription" class="form-control" placeholder="Enter product description" style="height:100px;" required></textarea>    
                      </div>
                      <div class="form-group">
                          <input type="number" name="prodPrice" class="form-control" placeholder="Enter product price" required />
                      </div>
                      <div class="form-group">
                          <input type="number" name="prodDiscount" class="form-control" placeholder="Enter product discount" required />
                      </div>
                      <div class="form-group">
                          <input type="number" name="prodQuantity" class="form-control" placeholder="Enter product quantity" required />
                      </div>
                       
                       <!--getting categories dynamically-->
                      
                      <div class="form-group">
                         
                          <select name="prodId" class="form-control" id="" required>
                              <% 
                                for(Category c:list)
                                {
                               %>
                              <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                              <%  
                                }
                              %>
                          </select>
                      </div>
                       
                       <!--product image file-->
                       <div class="form-group">
                           <label for="prodPic" >Select Product Picture</label><br>
                           <input type="file" name="prodPic" id="prodPic" required/>
                       </div>
                      <div class="container text-center">
                          <button class="btn btn-outline-success">Save Product</button>
                          <button type="reset" class="btn btn-outline-warning">Reset</button>
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                          
                      </div>
                      
                  </form>
              </div>
            </div>
          </div>
        </div>
        
        <!--end of add product modal-->
        
        <!--including our modal so that admin can also view their order details-->
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
