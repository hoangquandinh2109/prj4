/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author johnn
 */
@WebServlet(name = "API", urlPatterns = {"/api/*"})
public class API extends HttpServlet {

    @EJB
    private ProductFacadeLocal productFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] uris = new String[]{};
        try {
            if(!uris[2].isEmpty()){
                if(uris[0].equals("product")){
                    FilterProduct fp = new FilterProduct(uris, req, resp);
                }
            }
        } catch (Exception e) {
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }


}
