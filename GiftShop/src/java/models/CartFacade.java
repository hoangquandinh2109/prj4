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
    public int size(){
        return (session.getAttribute("cart") != null)? ((List<Cart>)session.getAttribute("cart")).size() : 0;
    }

    public CartFacade(HttpSession session) {
        this.session = session;
    }
    public int getTotalPrice(){
        int totalprice = 0;
        for (Cart c : getAllCartItems()){
            totalprice += c.getQuantity()*c.getProduct().getProPrice();
        }
        return totalprice;
    }
    public void deletefromCart(int id){
        List<Cart> cart = getAllCartItems();
        int i = 0, j=0;
        for(Cart c: cart){
            if(c.getId() == id){
                j=i;
            }
            i++;
        }
        cart.remove(cart.get(j));
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
    public boolean addToCart(entity.Product product, int quantity){
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
            //update quantity if exist
            int newquan =cart.get(index).getQuantity() + quantity;
            cart.get(index).setQuantity((newquan >50)?50:newquan);
            session.setAttribute("cart", cart);
            return !(newquan>50);
        } else{
            int lastid = cart.size();
            cart.add(new Cart(lastid+1, product, quantity));
            session.setAttribute("cart", cart);
        }
        return true;
    }
    public List<Cart> getAllCartItems(){
        return (session.getAttribute("cart") != null)? (List<Cart>)session.getAttribute("cart") : new ArrayList<>();
    }
}
