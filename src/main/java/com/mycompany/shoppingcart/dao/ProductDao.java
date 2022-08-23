
package com.mycompany.shoppingcart.dao;

import com.mycompany.shoppingcart.entities.Product;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class ProductDao 
{
    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    // method to save the product
    public int save(Product p)
    {
        int pId = 0;
        try 
        {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            pId = (int)session.save(p);
            tx.commit();
            session.close();
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return pId;
    }
    
    // getting all products
    public List<Product> getAllProducts()
    {
        Session s = this.factory.openSession();
        Query query =  s.createQuery("from Product");
        List<Product> list = query.list();
        return list;
    }
    
    // getting products by category id
    public List<Product> getProductById(int cid)
    {
        List<Product> plist = null;
        try {
            Session s = this.factory.openSession();
            Query query = s.createQuery("from Product as p where p.category.categoryId =: id");
            query.setParameter("id", cid);
            plist = query.list();
            
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return plist;
    }
}
