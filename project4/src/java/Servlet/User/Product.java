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
        String model = "", id = "";
        String[] uris = new String[]{};
        try {
            uris = req.getPathInfo().substring(1).split("/");
            model = uris[0];
            try {
                id = uris[1];
            } catch (Exception e) {
                id = "";
            }
        } catch (Exception e) {
            model = "";
        }
        PrintWriter out = resp.getWriter();
        switch (model) {
            case "type":
            req.setAttribute("pagename", "Type");
            if(!id.isEmpty()){
            }else{
                //trang type
                getServletContext().getRequestDispatcher("/collections.jsp").forward(req, resp);
            }
                break;
            case "category":
            req.setAttribute("pagename", "Category");
            if(!id.isEmpty()){
            }else{
                //trang category
                getServletContext().getRequestDispatcher("/collections.jsp").forward(req, resp);
            }
                break;
            case "v":
                
            if(!id.isEmpty()){
                getServletContext().getRequestDispatcher("/proDetails.jsp").forward(req, resp);
            } else{
                resp.setStatus(404);/// tam thoi, sau nay se tao trang 404
            }
                break;
            case "":
                req.setAttribute("listP", productDB.findAll());
                req.setAttribute("pagename", "Product");
                getServletContext().getRequestDispatcher("/product.jsp").forward(req, resp);
            default:
                resp.setStatus(404);
        }
//                PrintWriter out = resp.getWriter();
//                out.println(johnnys(productDB.findAll()));
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
