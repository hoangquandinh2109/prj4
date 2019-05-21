/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

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
    public void deletefromCart(int id){
        List<Cart> cart = getAllCartItems();
        for(Cart c: cart){
            if(c.getId() == id){
                cart.remove(c);
            }
        }
        session.setAttribute("cart", cart);
    }
    public void updateQuantityCart(int id, int quantity){
        List<Cart> cart = getAllCartItems();
        for(Cart c: cart){
            if(c.getId() == id){
                c.setQuantity(quantity);
            }
        }
        session.setAttribute("cart", cart);
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
            int lastid = cart.size();
            cart.add(new Cart(lastid+1, product, 1));
            session.setAttribute("cart", cart);
        }
    }
    public List<Cart> getAllCartItems(){
        return (session.getAttribute("cart") != null)? (List<Cart>)session.getAttribute("cart") : new ArrayList<>();
    }
}
