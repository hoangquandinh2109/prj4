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
    private ProductFacadeLocal product;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
      String detaillink = "http://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/product/v/";
      String imglink = "http://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/productImage/";
      PrintWriter out = resp.getWriter();
      String json ="[";
      int i = 0;
        for(Product p : product.findAll()){
            json +="{";
            
            json +="\"proURL\":\""+detaillink+p.getProID()+"\",";
            json +="\"proName\":\""+p.getProName()+"\",";
            json +="\"proImage\":\""+imglink+product.imageOf(p)+"\"";
            
            json +="}";
            i++;
            if(i!= product.count()){
                json += ",";
            }
            
        }
        json +="]";
        out.println(json);
      
    }
    
}
