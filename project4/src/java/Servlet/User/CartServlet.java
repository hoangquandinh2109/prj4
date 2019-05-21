/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet.User;

import models.CartFacade;
import entity.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ProductFacadeLocal;
import entity.Product;

/**
 *
 * @author johnn
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {
    @EJB
    private ProductFacadeLocal productFacade;
    private  HttpSession session;
    private HttpServletRequest req;
    private HttpServletResponse res;
    private PrintWriter out;
    private CartFacade c;
    
    String form = "<form action=\"purchase\" method=\"post\">" +
"                <input type=\"hidden\" name=\"payment\" value=\"payment\">" +
"                <button type=\"submit\">Purchase</button>" +
"            </form>";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        session=request.getSession();
        c = new CartFacade(session);
        String name = (String) session.getAttribute("sessionname");
        if(name != null){
//     if == null       response.sendRedirect(request.getContextPath()+"/login");
            response.setContentType("text/html;charset=UTF-8");
            out = response.getWriter();
            List<Cart> cart = c.getAllCartItems();
            int price = 0;
            for(Cart c : cart){
                out.print(c.getId()+" "+c.getProduct().getProName()+" "+c.getQuantity()+"<br>");
                price += c.getQuantity() * c.getProduct().getProPrice();
            }
            out.print("Total: "+price+"<br>");
            session.setAttribute("totalPrice", price);
            out.println(form);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session=request.getSession(); 
        c = new CartFacade(session);
        String name = (String) session.getAttribute("sessionname");
        if(name != null){
            response.setContentType("text/html;charset=UTF-8");
            out = response.getWriter();
            String proID = request.getParameter("proID");
            Product p = productFacade.find(proID);
            c.addToCart(p);
            int price = 0;
            for(Cart c : c.getAllCartItems()){
                out.println(c.getProduct().getProName()+" "+c.getQuantity());
                price += c.getQuantity() * c.getProduct().getProPrice();
            }
            session.setAttribute("totalPrice", price);
            out.println(form);
        }
    }
    

}
