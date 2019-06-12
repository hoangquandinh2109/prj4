/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet.User;

import models.CartFacade;
import entity.Cart;
import entity.Customer;
import entity.Purchase;
import entity.PurchaseItem;
import entity.Wishlist;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.CustomerFacadeLocal;
import models.ProductFacadeLocal;
import models.PurchaseFacadeLocal;
import models.PurchaseItemFacadeLocal;
import models.WishlistFacadeLocal;

/**
 *
 * @author johnn
 */
@WebServlet(name = "PurchaseServlet", urlPatterns = {"/checkout/*"})
public class PurchaseServlet extends HttpServlet {
    @EJB
    private ProductFacadeLocal productFacade;
    @EJB
    private WishlistFacadeLocal wishlistFacade;
    @EJB
    private CustomerFacadeLocal customer;
    @EJB
    private PurchaseItemFacadeLocal purchaseItemFacade;
    @EJB
    private PurchaseFacadeLocal purchaseFacade;
    
    String form = "<form action=\"purchase\" method=\"post\">" +
"                <input type=\"hidden\" name=\"payment\" value=\"payment\">" +
"                <button type=\"submit\">Purchase</button>" +
"            </form>";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session  = request.getSession();
        String page;
        try {
            page = request.getPathInfo().substring(1);
            if(page.contains("/") || !page.equals("information") || !page.equals("payment")){
                getServletContext().getRequestDispatcher("/404.jsp").forward(request, response);
                return;
            }
            
        } catch (Exception e) {
            page = "information";
        }
        
        CartFacade cart = new CartFacade(session);
        
        if(cart.size() == 0  || session.getAttribute("sessionid")==null ){
            response.sendRedirect(request.getContextPath());
        }else{
            int cusid = (int) session.getAttribute("sessionid");
            Customer c = customer.find(cusid);
            
            request.setAttribute("thisIsMe", c);
            request.setAttribute("pagename", "Check Out");
            request.setAttribute("thispage", page);
            getServletContext().getRequestDispatcher("/purchase.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int cusID= (int) session.getAttribute("sessionid");
        String payment = request.getParameter("payment");
        
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String method = request.getParameter("method");
        String note = request.getParameter("note");
        
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	Date now = new Date();
	String purId= dateFormat.format(now);
        String lastId = purchaseFacade.getLastPurchaseID();
        int baso;
        if(lastId != null){
            System.out.println("so sanh: "+ purId +" va" +lastId.substring(0,8));
            if(purId.equals(lastId.substring(0,8))){
                System.out.println("cong binh thuong");
                baso = Integer.parseInt(lastId.substring(8))+1;
            }else{
                System.out.println("reset");
                lastId = "000";
                baso = Integer.parseInt(lastId)+1;
            }
            System.out.println("baso: "+baso);
            if(baso>=10 && baso <=99){
                System.out.println("0");
                purId= dateFormat.format(now)+"0"+baso;
            } else if(baso<10){
                System.out.println("00");
                purId= dateFormat.format(now)+"00"+baso;
            } else{
                purId= dateFormat.format(now)+baso;
            }
        } else purId= dateFormat.format(now)+"001";
        System.out.println(purId);
        
        if(payment != null && "payment".equals(payment)){
            System.out.println("payment");
            CartFacade cartFacade = new CartFacade(request.getSession());
            Purchase purchase = new Purchase();
            purchase.setCusID(customer.find(cusID));
            purchase.setDateOrderPlaced(now);
            purchase.setPurID(purId);
            
            purchase.setToName(name);
            purchase.setToPhone(phone);
            purchase.setToAddress(address);
            purchase.setPaymentMethod(method);
            purchase.setNote(note);
            
            purchase.setPurchaseStatus(Short.parseShort("0"));
            purchase.setTotalPrice(cartFacade.getTotalPrice());
            purchaseFacade.create(purchase);
            
            PurchaseItem purchaseItem = new PurchaseItem();
            Collection<PurchaseItem> cPI = purchase.getPurchaseItemCollection();
            for(Cart cartItem: cartFacade.getAllCartItems()){
//                System.out.println(cartItem.getProduct().getProName());
                entity.Product p = cartItem.getProduct();
                Customer c = customer.find((int) request.getSession().getAttribute("sessionid"));
                Collection<Wishlist> cwP = p.getWishlistCollection();
                Wishlist toR = null;
                for(Wishlist wl : cwP){
                    if(wl.getCusID().getCusName().equals(c.getCusName())){
                        System.out.println("so sanh "+wl.getCusID().getCusName()+" va "+c.getCusName());
                        toR = wl;
                    }
                }
                if(toR != null){
                    System.out.println("toR ko null");
                    cwP.remove(toR);
                     p.setWishlistCollection(cwP);
                     productFacade.edit(p);
                     wishlistFacade.remove(toR);
                }
                
                purchaseItem.setProID(cartItem.getProduct());
                purchaseItem.setPurID(purchase);
                purchaseItem.setQuantity(cartItem.getQuantity());
                cPI.add(purchaseItem);
                purchase.setPurchaseItemCollection(cPI);
                purchaseFacade.edit(purchase);
            }
            cartFacade.removeAll();
            response.setStatus(200);
            return;
        }
        response.setStatus(404);
    }


}