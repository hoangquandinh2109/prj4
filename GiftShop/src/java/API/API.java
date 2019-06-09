/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

import entity.Customer;
import entity.Feature;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.ProductFacadeLocal;
import models.TbTagFacadeLocal;
import entity.Product;
import entity.Purchase;
import entity.PurchaseItem;
import entity.Wishlist;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.http.HttpSession;
import models.CategoryFacadeLocal;
import models.CustomerFacadeLocal;
import models.ProductTypeFacadeLocal;
import models.PurchaseFacadeLocal;
import models.PurchaseItemFacadeLocal;
import models.WishlistFacadeLocal;

/**
 *
 * @author johnn
 */
@WebServlet(name = "API", urlPatterns = {"/api/*"})
public class API extends HttpServlet {
    @EJB
    private PurchaseFacadeLocal order;
    @EJB
    private WishlistFacadeLocal wishlist;
    @EJB
    private PurchaseItemFacadeLocal orderdetail;
    @EJB
    private ProductTypeFacadeLocal productTypeFacade;
    @EJB
    private CategoryFacadeLocal categoryFacade;
    @EJB
    private CustomerFacadeLocal customer;

    @EJB
    private ProductFacadeLocal productFacade;
    private HttpSession session;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] uris = new String[]{};
        session = req.getSession();
        try {
            uris = req.getPathInfo().substring(1).split("/");
            System.out.println("vippropdfdklfdjfl: "+uris[0]);
            PrintWriter out = resp.getWriter();
            String json;
            SimpleDateFormat fmDate = new SimpleDateFormat("MMM d, yyyy");  
            String detaillink = "http://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/product/v/";
            String imglink = "http://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/productImage/";
            
            if(uris[0].equals("featureproduct")){
                json = "[";
                int id=0;
                for(Object[] p : productFacade.getFeautureProduct()){
                    id++;
                    json += "{";
                    
                    json += "\"url\":\""+detaillink+((Product) p[0]).getProID()+"\",";
                    json += "\"name\":\""+((Product) p[0]).getProName()+"\",";
                    json += "\"img\":\""+imglink+productFacade.imageOf(((Product) p[0]))+"\",";
                    json += "\"feature\":\""+((Feature) p[1]).getFname()+"\",";
                    json += "\"price\":\""+((Product) p[0]).getProPrice()+"\",";
                    json += "\"discount\":\""+((Product) p[0]).getDiscout()+"\",";
                    json += "\"onW\":\""+onWoC(((Product) p[0]).getWishlistCollection())+"\"";
                    
                    json += "}";
                    if(id != productFacade.getFeautureProduct().size()){
                        json += ",";
                    }
                }
                json += "]";
                out.println(json);
            }
            
            
            if(uris[0].equals("top4purchase")){                    
                try {
                    json = "[";
                    Customer me = customer.find(((int) req.getSession().getAttribute("sessionid")));
                    List<Product> lo = orderdetail.getAllPurchaseItemOfMe(me);
                    int i = 0;
                    List<Product> topProduct = new ArrayList<>();
                    for(Product pn : lo){
                        if(topProduct.indexOf(pn) == -1){
                            topProduct.add(pn);
                        }
                    }
                    int j = 0;
                    for (Product p : topProduct) {
                        j++;
                        json += "{";
                        json +="\"url\":\""+detaillink+p.getProID()+"\",";
                        json +="\"name\":\""+p.getProName()+"\",";
                        json +="\"price\":\"$"+p.getProPrice()+"\",";
                        json +="\"img\":\""+imglink+productFacade.imageOf(p)+"\"";
                        json+= "}";
                       
                        if(j != 4 && j != topProduct.size()){
                            json+=",";
                        }
                    }
                   
                    
                    json += "]";
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                    json = "[]";
                }
                out.println(json);

            }
            
            
            if(uris[0].equals("getMyWishlist")){
                try {
                    json = "[";
                    Customer me = customer.find(((int) req.getSession().getAttribute("sessionid")));
                    List<Wishlist> mywishlist = wishlist.getWishlistOfMe(me);
                    int i;
                    for ( i = 0; i < mywishlist.size(); i++) {
                        json += "{";
                        json +="\"id\":\""+mywishlist.get(i).getProID().getProID()+"\",";
                        json +="\"url\":\""+detaillink+mywishlist.get(i).getProID().getProID()+"\",";
                        json +="\"name\":\""+mywishlist.get(i).getProID().getProName()+"\",";
                        json +="\"price\":\"&"+mywishlist.get(i).getProID().getProPrice()+"\",";
                        json +="\"img\":\""+imglink+productFacade.imageOf(mywishlist.get(i).getProID())+"\"";
                        json+= "}";
                       if( (i+1) < mywishlist.size()){
                           json+=",";
                       }
                    }
                    json += "]";
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                    json = "[]";
                }
                out.println(json);
            }
            if(uris[0].equals("getAllOrder")){
                try {
                    json = "[";
                    Customer me = customer.find(((int) req.getSession().getAttribute("sessionid")));
                    List<Purchase> listorder = order.orderofme(me);
                    int i;
                    for ( i = 0; i < listorder.size(); i++) {
                        json += "{";
                        json +="\"id\":\""+listorder.get(i).getPurID()+"\",";
                        json +="\"date\":\""+fmDate.format(listorder.get(i).getDateOrderPlaced())+"\",";
                        json +="\"item\":\""+orderdetail.ItemofMe(listorder.get(i)).size()+"\",";
                        json +="\"total\":\"$"+listorder.get(i).getTotalPrice()+"\",";
                        json +="\"status\":\""+namestatus(listorder.get(i).getPurchaseStatus())+"\"";
                        json+= "}";
                       if( (i+1) < listorder.size()){
                           json+=",";
                       }
                    }
                    json += "]";
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                    json = "[]";
                }
                out.println(json);
            }
            if(uris[0].equals("orderdetail")){
                System.out.println("vip");
                String purid = uris[1];
                
                Purchase theorder = null;
                theorder = order.find(purid);
                if(theorder != null){
                    
                    json ="[{";
                    json +="\"receiver\":\""+theorder.getToName()+"\",";
                    json +="\"address\":\""+theorder.getToAddress()+"\",";
                    json +="\"phone\":\""+theorder.getToPhone()+"\",";
                    json +="\"note\":\""+theorder.getNote()+"\",";
                    json +="\"payment\":\""+theorder.getPaymentMethod()+"\",";
                    json +="\"date\":\""+fmDate.format(theorder.getDateOrderPlaced())+"\",";
                    json +="\"total\":\"$"+theorder.getTotalPrice()+"\"";
                    json += "}";
                     json +=",[";
                    int i = 0;
                    for (PurchaseItem lp : orderdetail.ItemofMe(theorder)){

                          json +="{";

                          json +="\"proURL\":\""+detaillink+lp.getProID().getProID()+"\",";
                          json +="\"proName\":\""+lp.getProID().getProName()+"\",";
                          json +="\"proImage\":\""+imglink+productFacade.imageOf(lp.getProID())+"\",";
                          json +="\"proPrice\":\"$"+lp.getProID().getProPrice()+"\",";
                          json +="\"proItem\":\""+lp.getQuantity()+"\"";

                          json +="}";


                          i++;
                          if(i!= orderdetail.ItemofMe(theorder).size()){
                              json += ",";
                          }
                    }

                    json +="]]";
                }else{
                    json = "";
                }
                out.println(json);
            }
            if(!uris[2].isEmpty()){
                System.out.println(uris[2]);
                if(uris[0].equals("product")){
                    System.out.println(uris[0]);
                    FilterProduct fp = new FilterProduct(uris, req, resp, productFacade, categoryFacade, productTypeFacade);
                }
            }
        } catch (Exception e) {
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    private String namestatus(Short var) {
        String stringreturn;
        switch (var) {
            case 0:
                stringreturn = "processing";
                break;
            case 1:
                stringreturn = "on shipping";
                break;
            case 2:
                stringreturn = "received";
                break;
            case 3:
                stringreturn = "canceled";
                break;
            default:
                stringreturn = "null";
        }
        return stringreturn;
    }
    private boolean onWoC(Collection<Wishlist> cw) {
        try {
            int cusid = (int) session.getAttribute("sessionid");
            for(Wishlist wh : cw){
                if(wh.getCusID().getCusID() == cusid){
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

}
