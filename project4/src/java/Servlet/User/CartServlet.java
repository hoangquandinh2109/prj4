/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet.User;

import static JSONGen.Cart.getTypeJson;
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
import javax.json.Json;
import javax.json.JsonArrayBuilder;

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
        out = response.getWriter();
        c = new CartFacade(session);
        String name = (String) session.getAttribute("sessionname");
        if(name != null){
            List<Cart> cart = c.getAllCartItems();
            int price = 0;
            JsonArrayBuilder jab = Json.createArrayBuilder();
            for(Cart c : cart){
                price += c.getQuantity() * c.getProduct().getProPrice();
                jab.add(JSONGen.Cart.getTypeJson(c));
            }
            out.println(JSONGen.Cart.getTypeThings(jab.build(), price));
            response.setStatus(HttpServletResponse.SC_OK);
        } else{
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("hello");
        session=request.getSession(); 
        String name = (String) session.getAttribute("sessionname");
        System.out.println(name);
        if(name != null){
            try {
                c = new CartFacade(session);
                String proID = request.getParameter("proID");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                System.out.println(proID+quantity);
                Product p = productFacade.find(proID);
                c.addToCart(p, quantity);
                response.setStatus(200);
            } catch (Exception e) {
                response.setStatus(404);
            }
        } else{
            response.setStatus(404);
        }
    }
    

}
