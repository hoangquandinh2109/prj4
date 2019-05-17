/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.User;

import com.sun.xml.ws.transport.tcp.io.OutputWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
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
import jdk.nashorn.internal.parser.JSONParser;
import models.ProductFacadeLocal;

/**
 *
 * @author bemap
 */
@WebServlet(name = "ProductDetail", urlPatterns = {"/product/*"})
public class Product extends HttpServlet {

    @EJB
    private ProductFacadeLocal productDB;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> list = new ArrayList<>();
        list.add("hello");
        list.add("sdfdsf");
        list.add("hsdfdellddo");
        list.add("hesssllo");
        list.add("heddfdllo");
        list.add("hesddddfdfllo");
        list.add("hedfsdfllo");
        list.add("helxcjgjghdlo");
        req.setAttribute("list", list);
        String id;
        try {
            id = req.getPathInfo().substring(1);
            System.out.println("quan vip: "+id);
        } catch (Exception e) {
            id = "";
        }
        if (!id.isEmpty()) {
            getServletContext().getRequestDispatcher("/proDetails.jsp").forward(req, resp);
        } else {
//                PrintWriter out = resp.getWriter();
//                out.println(johnnys(productDB.findAll()));
            req.setAttribute("listP", productDB.findAll());
            getServletContext().getRequestDispatcher("/testpurchase.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
//    public JsonArray johnnys(List<entity.Product> lp){
//        JsonArrayBuilder jab = Json.createArrayBuilder();
//        for(entity.Product p : lp){
//                jab.add(johnny(p));
//        }
//        return jab.build();
//                
//    }
//    public JsonObject johnny(entity.Product p){
//        return Json.createObjectBuilder()
//                .add("proID", p.getProID())
//                .add("proName", p.getProName())
//                .add("proPrice", p.getProPrice())
//                .build();
//    }

}
