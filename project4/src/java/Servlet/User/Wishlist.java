/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet.User;

import com.sun.xml.bind.util.Which;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.Whislist;
import java.io.PrintWriter;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.http.HttpSession;
import models.CustomerFacadeLocal;
import models.ProductFacadeLocal;
import models.WhislistFacade;
import models.WhislistFacadeLocal;

/**
 *
 * @author johnn
 */
@WebServlet(name = "WishList", urlPatterns = {"/wishlist"})
public class Wishlist extends HttpServlet{
    @EJB
    private WhislistFacadeLocal db;
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
           Whislist newItem = new Whislist();
           newItem.setQuantity(1);
                     
            entity.Customer c = customer.find(cusid);
            
            entity.Product p = product.find(proid);
                    
           newItem.setCusID(c);
           newItem.setProID(p);
           
           Collection<Whislist> cwP = p.getWhislistCollection();
           Whislist toR = null;
           int error = 0;
           for(Whislist wl : cwP){
               if(wl.getCusID().getCusName().equals(c.getCusName())){
                   toR = wl;
                    error = 1;
               }else{
                   error = 0;
               }
           }
           if(toR != null){
               cwP.remove(toR);
                p.setWhislistCollection(cwP);
                product.edit(p);
                db.remove(toR);
                System.out.println("404");
                resp.setStatus(404);
           }
           System.out.println("error :"+error);
           if(error == 0){
               
                ///add wishlist to collections
                cwP.add(newItem);
                p.setWhislistCollection(cwP);
                ///add wishlist
//                db.create(newItem);
                product.edit(p);
                System.out.println("200");
                resp.setStatus(200);
           }
           
           
    }

    
}
