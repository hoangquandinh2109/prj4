/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet.User;

import entity.Wishlist;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.CustomerFacadeLocal;
import models.ProductFacadeLocal;
import models.WishlistFacadeLocal;

/**
 *
 * @author johnn
 */
@WebServlet(name = "WishlistSerlvet", urlPatterns = {"/wishlist"})
public class WishlistSerlvet extends HttpServlet {
    
    @EJB
    private WishlistFacadeLocal db;
    @EJB
    private ProductFacadeLocal product;
    
    @EJB
    private CustomerFacadeLocal customer;
    
    // add to wishlist
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
           String proid = req.getParameter("proID");
            HttpSession session=req.getSession();  
           int cusid = (int) session.getAttribute("sessionid");
           
           ////initialize a wishlist
           Wishlist newItem = new Wishlist();
           newItem.setQuantity(1);
                     
            entity.Customer c = customer.find(cusid);
            
            entity.Product p = product.find(proid);
                    
           newItem.setCusID(c);
           newItem.setProID(p);
           
           Collection<Wishlist> cwP = p.getWishlistCollection();
           Wishlist toR = null;
           int error = 0;
           for(Wishlist wl : cwP){
               if(wl.getCusID().getCusName().equals(c.getCusName())){
                   toR = wl;
                    error = 1;
               }else{
                   error = 0;
               }
           }
           if(toR != null){
               cwP.remove(toR);
                p.setWishlistCollection(cwP);
                product.edit(p);
                db.remove(toR);
                System.out.println("404");
                resp.setStatus(404);
           }
           System.out.println("error :"+error);
           if(error == 0){
               
                ///add wishlist to collections
                cwP.add(newItem);
                p.setWishlistCollection(cwP);
                ///add wishlist
//                db.create(newItem);
                product.edit(p);
                System.out.println("200");
                resp.setStatus(200);
           }
           
           
    }

    
}
