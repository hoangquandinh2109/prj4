/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

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
    
    String form = "<form action=\"purchase\" method=\"post\">" +
"                <input type=\"text\" name=\"purID\" placeholder=\"purID\">" +
"                <input type=\"hidden\" name=\"payment\" value=\"payment\">" +
"                <button type=\"submit\">Purchase</button>" +
"            </form>";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        session=request.getSession();
        String email = (String) session.getAttribute("sessionname");
        if(email != null){
//     if == null       response.sendRedirect(request.getContextPath()+"/login");
            response.setContentType("text/html;charset=UTF-8");
            out = response.getWriter();
            List<Cart> cart = getAllCartItems();
            int price = 0;
            for(Cart c : cart){
                out.print(c.getProduct().getProName()+" "+c.getQuantity()+"<br>");
                price += c.getQuantity() * c.getProduct().getProPrice();
            }
            out.print("Total: "+price+"<br>");
            session.setAttribute("totalPrice", price);
            System.out.println(price);
    //        out.println(form);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session=request.getSession(); 
        String email = (String) session.getAttribute("sessionname");
        if(email == null){
            response.sendRedirect(request.getContextPath()+"/login");
        }
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String proID = request.getParameter("proID");
        Product p = productFacade.find(proID);
        addToCart(p);
        int price = 0;
        for(Cart c : getAllCartItems()){
            out.println(c.getProduct().getProName()+" "+c.getQuantity());
            price += c.getQuantity() * c.getProduct().getProPrice();
        }
        session.setAttribute("totalPrice", price);
        System.out.println(price);
        out.println(form);
    }
    private void addToCart(Product product){
        List<Cart> cart;
        if (session.getAttribute("cart") != null) {
            cart = (List<Cart>) session.getAttribute("cart");
        }else{
            session.setAttribute("cart", new ArrayList<>());
            cart = (List<Cart>) session.getAttribute("cart");
        }
        int index = -1;
        for(Cart c : cart){
            if(product.getProID() == c.getProduct().getProID()){
                index = cart.indexOf(c);
            }
        }
        if (index != -1 ) {
            cart.get(index).setQuantity(cart.get(index).getQuantity() + 1);
            session.setAttribute("cart", cart);
        } else{
            cart.add(new Cart(product, 1));
            session.setAttribute("cart", cart);
        }
    }
    private List<Cart> getAllCartItems(){
        return (session.getAttribute("cart") != null)? (List<Cart>)session.getAttribute("cart") : new ArrayList<>();
    }

}
