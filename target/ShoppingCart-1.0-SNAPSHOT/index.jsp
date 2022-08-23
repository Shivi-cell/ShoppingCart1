
<%@page import="com.mycompany.shoppingcart.helper.Helper"%>
<%@page import="com.mycompany.shoppingcart.entities.Category"%>
<%@page import="com.mycompany.shoppingcart.dao.CategoryDao"%>
<%@page import="com.mycompany.shoppingcart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.shoppingcart.dao.ProductDao"%>
<%@page import="com.mycompany.shoppingcart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShoppingCart - Home</title>
        
        <%@include file="components/comman_css_js.jsp" %>  <%-- including css--%>
        <style>
            .list-group-item.active
            {
                z-index: 2;
                color: #fff;
                background-color: #8c9eff;
                border-color: #8c9eff;
            }
            .btn-primary 
            {
                
                color: #fff;
                background: #8c9eff;
                border-color: #8c9eff; 
                border: 1px solid transparent;
            }
            .discount-label
            {
                font-size: 14px;
                color: #4afc03;
            }
            .original-price
            {
                font-size: 16px;
                color: slategray;
                text-decoration: line-through;
            }
            .price-after-discount
            {
                font-size: 18px;
                font-weight: bold;
            }
            .product-card:hover
            {
                background: #e2e2e2;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        
        <%@include file="components/navbar.jsp" %> <%-- including navbar--%>
        <!--making a row to fetch products in that-->
        <div class="container-fluid" style="background-color: rgb(240 253 244);">
            <div class="row mx-2">

                <!--getting all products here-->
                <% 
                    // getting category id by url
                    String cat = request.getParameter("category");
                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    if((cat == null ) || (cat.trim().equals("all")))
                    {
                        list = dao.getAllProducts();
                    }
                    else
                    {
                        int Id = Integer.parseInt(cat.trim());
                        list = dao.getProductById(Id);
                    } 

                    // getting products categories
                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();
                %>

                <!--show category-->
                <div class="col-md-2 mt-3">
                   <div class="list-group">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">All Categories</a>

                    <% 
                        for(Category c:clist)
                        { %>
                            <a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action ">
                                <%= c.getCategoryTitle() %>
                            </a>
                               
                    <% } %> 
                    </div>
                </div>

                <!--show products-->
                <div class="col-md-10 mt-3">
                    <!--making rows-->
                    <div class="row">
                        <!--making columns-->
                        <div class="col-md-12">
                            <div class="card-columns">
                               <!--traversing our products--> 
                               <% 
                                    for(Product p:list)
                                    {   %>
                                    <div class="card product-card" style="width: 18rem;">
                                        <div class="container text-center">
                                            <img class="card-img-top " src="img/products/<%= p.getpPhoto() %>" alt="Card image cap"
                                                 style="max-height: 200px; max-width: 100%; width: auto" >
                                        </div>
                                        <div class="card-body">
                                          <h5 class="card-title"><%= p.getpName() %></h5>
                                          <p class="card-text"><%= Helper.get10Words(p.getpDesc()) %></p>
                                          <p class="card-text"><span class="price-after-discount">&#8377;<%= p.getPriceAfterApplyingDiscount() %></span> <span class="original-price">&#8377;<%=p.getpPrice()%></span> <span class="discount-label"> <%= p.getpDiscount() %>% off</span></p>
                                        </div>
                                        <div class="card-footer text-center">
                                            <a href="#" class="btn btn-primary" onclick="add_to_cart(<%= p.getpId() %>,'<%= p.getpName() %>',<%= p.getPriceAfterApplyingDiscount() %>)">Add to Cart</a>
                                            <a href="#" class="btn btn-success">Buy Now</a>
                                        </div>
                                    </div>

                                <% } 
                                // if there is no product in the category
                                if(list.size()==0)
                                    out.print("<h3>There is no items in this category</h3>");
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                            
        <!--importing modal for adding items in the cart-->
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
