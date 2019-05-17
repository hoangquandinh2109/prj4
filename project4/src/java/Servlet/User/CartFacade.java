/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet.User;

import entity.Cart;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author johnn
 */
public class CartFacade {
    private  HttpSession session;

    public CartFacade(HttpSession session) {
        this.session = session;
    }
    
    public void addToCart(entity.Product product){
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
    public List<Cart> getAllCartItems(){
        return (session.getAttribute("cart") != null)? (List<Cart>)session.getAttribute("cart") : new ArrayList<>();
    }
}
