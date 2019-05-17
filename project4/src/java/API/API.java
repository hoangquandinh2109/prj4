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
    @EJB
    private TbTagFacadeLocal tbTagFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String model, id;
//        try {
//            String[] uris = req.getPathInfo().substring(1).split("/");
//            model = uris[0];
//            System.out.println("quan vip model: " + model);
//            try {
//                id = uris[1];
//                System.out.println("quan vip id: " + id);
//            } catch (Exception e) {
//            }
//        } catch (Exception e) {
//            model = "";
//            id = "";
//        }
        resp.setContentType("application/json");
        resp.setHeader("Access-Control-Allow-Origin","*");
        resp.setHeader("Access-Control-Allow-Methods", "*");
        resp.setHeader("Access-Control-Allow-Headers", "*");
        resp.setStatus(HttpServletResponse.SC_OK);
        PrintWriter o = resp.getWriter();
        o.print(johnnys(productFacade.findAll()));

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    public JsonArray johnnys(List<Product> lp) {
        JsonArrayBuilder jab = Json.createArrayBuilder();
        for (entity.Product p : lp) {
            jab.add(johnny(p));
        }
        return jab.build();

    }

    public JsonObject johnny(Product p) {

        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        String strDate = dateFormat.format(p.getDateRelease());
        return Json.createObjectBuilder()
                .add("proID", p.getProID())
                .add("proName", p.getProName())
                .add("proPrice", p.getProPrice())
                .add("date", strDate)
                .add("type", p.getTypeID().getTypeName())
                .build();
    }

}
