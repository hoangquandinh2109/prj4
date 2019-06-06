/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

import entity.Customer;
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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import models.CategoryFacadeLocal;
import models.CustomerFacadeLocal;
import models.ProductTypeFacadeLocal;
import models.PurchaseFacadeLocal;
import models.PurchaseItemFacadeLocal;

/**
 *
 * @author johnn
 */
@WebServlet(name = "API", urlPatterns = {"/api/*"})
public class API extends HttpServlet {
    @EJB
    private PurchaseFacadeLocal order;
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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] uris = new String[]{};
        try {
            uris = req.getPathInfo().substring(1).split("/");
            System.out.println("vippropdfdklfdjfl: "+uris[0]);
            PrintWriter out = resp.getWriter();
            String json;
            SimpleDateFormat fmDate = new SimpleDateFormat("MMM d, yyyy");  
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
                        json +="\"item\":\""+listorder.get(i).getPurchaseItemCollection().size()+"\",";
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
                
                Purchase theorder = order.find(purid);
                json ="[{";
                json +="\"receiver\":\""+theorder.getCusID().getCusName()+"\",";
                json +="\"address\":\""+theorder.getCusID().getCusAddress()+"\",";
                json +="\"phone\":\""+theorder.getCusID().getCusPhone()+"\",";
                json +="\"date\":\""+fmDate.format(theorder.getDateOrderPlaced())+"\"";
                json +="\"total\":\""+theorder.getTotalPrice()+"\",";
                json += "}";
                 json +=",[";
                int i = 0;
                for (PurchaseItem lp : orderdetail.ItemofMe(theorder)){
                    
                      json +="{";

                      json +="\"proID\":\""+lp.getProID().getProID()+"\",";
                      json +="\"proName\":\""+lp.getProID().getProName()+"\",";
                      json +="\"proImage\":\""+productFacade.imageOf(lp.getProID())+"\",";
                      json +="\"proPrice\":\""+lp.getProID().getProPrice()+"\"";

                      json +="}";
                      
                      
                      i++;
                      if(i!= orderdetail.ItemofMe(theorder).size()){
                          json += ",";
                      }
                }

                  json +="]]";
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


}
