/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

import static JSONGen.Collections.getTypeJson;
import static JSONGen.Collections.getTypesJson;
import entity.Category;
import entity.Product;
import entity.ProductType;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonValue;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.CategoryFacadeLocal;
import models.ProductFacadeLocal;
import models.ProductTypeFacadeLocal;

/**
 *
 * @author johnn
 */
public class FilterProduct {


    public FilterProduct(String[] uri, HttpServletRequest req, HttpServletResponse resp,ProductFacadeLocal db, CategoryFacadeLocal dbCat,ProductTypeFacadeLocal dbType) {
            System.out.println(uri[1]+ " "+uri[2]);
        if (uri[1].equals("type")) {//type/2/
            List<Product> lp;
            ProductType thisType = dbType.find(Integer.parseInt(uri[2]));
            /// neu co from to
            try {
                int from = Integer.parseInt(req.getParameter("from"));
                int to = Integer.parseInt(req.getParameter("to"));
                lp = db.filtTypeProductByPrice(thisType, from, to);
            } catch (Exception e) {
                lp = db.getProductByType(thisType);
            }
            ///////////////////////
            System.out.println("ok");
            if (lp != null) {
                int currPage;
                try {
                    currPage = Integer.parseInt(uri[3]);
                } catch (Exception e) {
                    currPage = 1;
                }
                int numPage = 0, countlist = 0, count12 = 0, skip = 12 * (currPage-1);
                List<String[]> listPT = new ArrayList<>();
                JsonArrayBuilder listPTJAB = Json.createArrayBuilder();
                for(Product p : lp){
                    if(countlist>=skip){
                        if(count12<12){
                            listPTJAB.add(getSingleResult(p));
                            count12++;
                        }
                    }
                    countlist++;
                    if(countlist % 12 == 0) numPage++;
                }
                if (countlist % 12  > 0 && countlist % 12 < 12 ) numPage++;
                try {
                    PrintWriter out = resp.getWriter();
                    out.println(getResultThingsJson(listPTJAB.build(), numPage, currPage));
                } catch (IOException ex) {
                    Logger.getLogger(FilterProduct.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else if (uri[1].equals("category")) {
            System.out.println("ok");
            
            List<Product> lp;
            Category thisCat = dbCat.find(Integer.parseInt(uri[2]));
            /// neu co from to
            try {
                int from = Integer.parseInt(req.getParameter("from"));
                int to = Integer.parseInt(req.getParameter("to"));
                lp = db.filtCategoryProductByPrice(thisCat, from, to);
            } catch (Exception e) {
                lp = db.getProductByCategory(thisCat);
            }
            ///////////////////////
            if (lp != null) {
                int currPage;
                try {
                    currPage = Integer.parseInt(uri[3]);
                } catch (Exception e) {
                    currPage = 1;
                }
                int numPage = 0, countlist = 0, count12 = 0, skip = 12 * (currPage-1);
                List<String[]> listPT = new ArrayList<>();
                JsonArrayBuilder listPTJAB = Json.createArrayBuilder();
                for(Product p : lp){
                    if(countlist>=skip){
                        if(count12<12){
                            listPTJAB.add(getSingleResult(p));
                            count12++;
                        }
                    }
                    countlist++;
                    if(countlist % 12 == 0) numPage++;
                }
                if (countlist % 12  > 0 && countlist % 12 < 12 ) numPage++;
                try {
                    PrintWriter out = resp.getWriter();
                    out.println(getResultThingsJson(listPTJAB.build(), numPage, currPage));
                } catch (IOException ex) {
                    Logger.getLogger(FilterProduct.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

 

    private JsonObject getResultThingsJson(JsonArray lp, int numofpage, int currPage) {
        return Json.createObjectBuilder()
                .add("listPro", lp)
                .add("numofpage", numofpage)
                .add("currPage", currPage)
                .build();
    }

    private JsonObject getSingleResult(Product p) {
        return Json.createObjectBuilder()
                .add("proID", ifNull(p.getProID()))
                .add("proName", ifNull(p.getProName()))
                .add("proPrice", ifNull(p.getProPrice()))
                .add("starAVG", ifNull(p.getStarAVG()))
                .add("proDetails", ifNull(p.getProDetails()))
                .build();
    }
    private String ifNull(Object i){
        if(i != null){
            return i+"";
        }else{
            return "null";
        }
    }

}
