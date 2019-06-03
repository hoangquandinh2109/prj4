/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package API;

import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author johnn
 */
@WebServlet(name = "Autocomplete", urlPatterns = {"/autocomplete"})
public class Autocomplete extends HttpServlet {
    @EJB
    private ProductFacadeLocal productFacade;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      PrintWriter out = response.getWriter();
        JsonArrayBuilder jab = Json.createArrayBuilder();
        for(Product p : productFacade.findAll()){
            jab.add(getJsonbyName(p.getProName()));
        }
        out.println(getArrayName(jab.build()));
    }
    
    
    public static JsonObject getJsonbyName(String name){
        return Json.createObjectBuilder()
                .add("proName", name)
                .build();
    }
    
    public static JsonObject getArrayName(JsonArray arrayname){
        return Json.createObjectBuilder()
                .add("listName", arrayname)
                .build();
    }
}
