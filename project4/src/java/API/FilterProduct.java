/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

import static API.Collections.getTypeJson;
import static API.Collections.getTypesJson;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
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

    @EJB
    private ProductFacadeLocal db;
    @EJB
    private ProductTypeFacadeLocal dbType;
    @EJB
    private CategoryFacadeLocal dbCat;

    public FilterProduct(String[] uri, HttpServletRequest req, HttpServletResponse resp) {
        if (uri[1].equals("type")) {
            List<Product> lp = db.getProductByType(dbType.find(Integer.parseInt(uri[2])));
            if (lp != null) {
                try {
                    PrintWriter out = resp.getWriter();
                    out.println(getResultThingsJson(lp));
                } catch (IOException ex) {
                    Logger.getLogger(FilterProduct.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else if (uri[1].equals("category")) {

        }
    }

    private JsonArray getResultJson(List<Product> lp) {
        JsonArrayBuilder jab = Json.createArrayBuilder();
        for(Product p : lp){
                jab.add(getSingleReulst(p));
        }
        return jab.build();
        
    }

    private JsonObject getResultThingsJson(List<Product> lp) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private JsonObject getSingleReulst(Product p) {
        return Json.createObjectBuilder()
                .add("proID", p.getProID())
                .add("proName", p.getProName())
                .add("proPrice", p.getProPrice())
                .add("starAVG", p.getStarAVG())
                .add("proDetails", p.getProDetails())
                .build();
    }

}
