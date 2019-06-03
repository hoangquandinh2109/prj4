/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package API;

import entity.ImgStog;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.CategoryFacadeLocal;
import models.ProductFacadeLocal;
import models.ProductTypeFacadeLocal;

/**
 *
 * @author johnn
 */
@WebServlet(name = "abc", urlPatterns = {"/abc"})
public class testanything extends HttpServlet {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;
    @EJB
    private ProductTypeFacadeLocal typefacade;
    @EJB
    private CategoryFacadeLocal catfacade;
    @EJB
    private ProductFacadeLocal productFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
            ////////////////////ngôi sao
//        double star = Double.parseDouble(req.getParameter("pro"));
//        String id = req.getParameter("id");
//        Product p = productFacade.find(id);
//        p.setStarAVG(star);
//        productFacade.edit(p);
//        resp.sendRedirect("http://localhost:8080/project4/product/type/2");
////////////////////ngôi sao
            
            
            
           
            
//////////////du lieu product
//        try {
//            List<Product> lp = new ArrayList<>();
//            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//            
//            productFacade.create(new Product(format.parse("2019-05-21"), 2.0, typefacade.find(2), "0392", "Vipkien", "Kientri", 232, 261, true, "hdslkfk", catfacade.find(2)));
//        } catch (Exception ex) {
//            System.out.println("Quan vip");
//            System.out.println(ex.getMessage());
//        }
            ////////////////du lieu product
        
//        //goi y name
//        out.println(productFacade.getMaxPrice());
    }

}
