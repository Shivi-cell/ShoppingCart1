
package com.mycompany.shoppingcart.servlets;

import com.mycompany.shoppingcart.dao.CategoryDao;
import com.mycompany.shoppingcart.dao.ProductDao;
import com.mycompany.shoppingcart.entities.Category;
import com.mycompany.shoppingcart.entities.Product;
import com.mycompany.shoppingcart.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            // fetching operation value to decide the addCategory and addProduct
            String op = request.getParameter("operation");
            // add Category
            if(op.trim().equals("addCategory"))
            {
                // fetching data
                String Title = request.getParameter("catTitle");
                String Description = request.getParameter("catDescription");
                
                Category cat = new Category();
                cat.setCategoryTitle(Title);
                cat.setCategoryDescription(Description);
                
                // calling CategoryDao to save in database
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.save(cat);
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", ""+cat.getCategoryTitle()+"Category Added Successfully");
                response.sendRedirect("admin.jsp");
            }
            // add product
            else if(op.trim().equals("addProduct"))
            {
                String prodName = request.getParameter("prodName");
                String prodDescription = request.getParameter("prodDescription");
                int prodPrice = Integer.parseInt(request.getParameter("prodPrice"));
                int prodDiscount = Integer.parseInt(request.getParameter("prodDiscount"));
                int prodQuantity = Integer.parseInt(request.getParameter("prodQuantity"));
                int prodId = Integer.parseInt(request.getParameter("prodId"));
                Part part = request.getPart("prodPic");
                
                Product p = new Product();
                p.setpName(prodName);
                p.setpDesc(prodDescription);
                p.setpPrice(prodPrice);
                p.setpDiscount(prodDiscount);
                p.setpQuantity(prodQuantity);
                p.setpPhoto(part.getSubmittedFileName());
                
                // call the method that returns the category by getting the categoty id
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                Category cat = cdao.getCategoryById(prodId);
                p.setCategory(cat);
                
                // calling the ProductDao to save in database
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                int Id = pdao.save(p);
                
                
                //pic upload
//                find out the path to upload photo
                String path = request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();
                System.out.println(path);

                //uploading code..
                try {

                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream is = part.getInputStream();

//                reading data
                    byte[] data = new byte[is.available()];
                    is.read(data);
                    
//                writing the data
                    fos.write(data);
                    fos.close();
                } 
                catch (Exception e)
                {
                    e.printStackTrace();
                }
                
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", ""+p.getpName()+" Product Added Successfully");
                response.sendRedirect("admin.jsp");
            }
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
