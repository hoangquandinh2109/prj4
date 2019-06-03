/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet.User;

import models.CartFacade;
import entity.Cart;
import entity.Purchase;
import entity.PurchaseItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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

/**
 *
 * @author johnn
 */
@WebServlet(name = "PurchaseServlet", urlPatterns = {"/purchase"})
public class PurchaseServlet extends HttpServlet {
    @EJB
    private ProductFacadeLocal productFacade;
    @EJB
    private CustomerFacadeLocal customerFacade;
    @EJB
    private PurchaseItemFacadeLocal purchaseItemFacade;
    @EJB
    private PurchaseFacadeLocal purchaseFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("purchase.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int cusID= (int) session.getAttribute("sessionid");
        String payment = request.getParameter("payment");
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
            purchase.setCusID(customerFacade.find(cusID));
            purchase.setDateOrderPlaced(now);
            purchase.setPurID(purId);
            purchase.setPurchaseStatus(Short.parseShort("0"));
            purchase.setTotalPrice(cartFacade.getTotalPrice());
            purchaseFacade.create(purchase);
            PurchaseItem purchaseItem = new PurchaseItem();
            for(Cart cartItem: cartFacade.getAllCartItems()){
//                System.out.println(cartItem.getProduct().getProName());
                purchaseItem.setProID(cartItem.getProduct());
                purchaseItem.setPurID(purchase);
                purchaseItem.setQuantity(cartItem.getQuantity());
                purchaseItemFacade.create(purchaseItem);
               
            }
        }
    }

}