package com.mycompany.shoppingcart.dao;

import com.mycompany.shoppingcart.entities.Users;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao 
{
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    // get user by email and password
    public Users getUserByEmailAndPassword(String email, String password)
    {
        Users user = null;
        
        try 
        {
            String query = "from Users where userEmail =: e and userPassword =: p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            user  = (Users) q.uniqueResult();
            
            session.close();
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        return user;
    }
    
    // getting number of users
    public long getNoOfUsers()
    {
        long c;
        Session session = this.factory.openSession();
        String q1 = "select count(*) from Users";
        Query q = session.createQuery(q1);
        c = (long)q.list().get(0);
       return c;
    }
}
