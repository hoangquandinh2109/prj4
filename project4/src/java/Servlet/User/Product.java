/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.User;

import com.sun.xml.ws.transport.tcp.io.OutputWriter;
import entity.Category;
import entity.ProductType;
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
import models.CategoryFacadeLocal;
import models.ProductFacadeLocal;
import models.ProductTypeFacadeLocal;

/**
 *
 * @author bemap
 */
@WebServlet(name = "ProductDetail", urlPatterns = {"/product/*"})
public class Product extends HttpServlet {
    @EJB
    private CategoryFacadeLocal proCat;
    @EJB
    private ProductTypeFacadeLocal proType;

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
        int pageno = 1;
        
        
        switch (model) {
            case "api":
                break;
            case "type":
            if(!id.isEmpty() && (!id.equals("page") && !id.equals("api"))){
                
                req.setAttribute("pagename", proType.getNameType(Integer.parseInt(id)));
                req.setAttribute("collVal", id);
                req.setAttribute("nameColl", "type");
                getServletContext().getRequestDispatcher("/product.jsp").forward(req, resp);
            }else{
                //trang type
                req.setAttribute("pagename", "Type");
                try {
                    pageno = Integer.parseInt(uris[2]);
                } catch (Exception e) {
                    pageno = 1;
                }
                List<String[]> listPT = new ArrayList<>();
                int pagenum = 0, count = 0, countlist = 0, skip = (pageno-1) * 3;
                
                for(ProductType pt: proType.findAll()){
                    if(countlist>=skip){
                        if(count < 3){
                            listPT.add(new String[]{String.valueOf(pt.getTypeID()),pt.getTypeName()});
                            count++;
                        }
                        
                    }
                    countlist++;
                    if(countlist % 3 == 0) pagenum++;
                }
                if (countlist % 3  > 0 && countlist % 3 < 3 ) pagenum++;
                if(!id.equals("api")){
                    req.setAttribute("listCollections", listPT);
                    req.setAttribute("h3name", "Types");
                    req.setAttribute("link", "type");
                    req.setAttribute("pagenum", pagenum);
                    req.setAttribute("currPage", pageno);
                    getServletContext().getRequestDispatcher("/collections.jsp").forward(req, resp);
                } else{
                    out.println(API.Collections.getTypeThings(listPT, pagenum, pageno));
                }
            }
                break;
            case "category":
            if(!id.isEmpty() && !id.equals("page") && !id.equals("api")){
                req.setAttribute("pagename", proCat.getCategoryName(Integer.parseInt(id)));
                req.setAttribute("collVal", id);
                req.setAttribute("nameColl", "category");
                getServletContext().getRequestDispatcher("/product.jsp").forward(req, resp);
            }else{
                //trang category
                req.setAttribute("pagename", "Category");
                try {
                    pageno = Integer.parseInt(uris[2]);
                } catch (Exception e) {
                    pageno = 1;
                }
                List<String[]> listPT = new ArrayList<>();
                int pagenum = 0, count = 0, countlist = 0, skip = (pageno-1) * 3;
                
                for(Category pt: proCat.findAll()){
                    if(countlist>=skip){
                        if(count < 3){
                            listPT.add(new String[]{String.valueOf(pt.getCatID()),pt.getCatName()});
                            count++;
                        }
                    }
                    countlist++;
                    if(countlist % 3 == 0) {pagenum++;}
                }
                if (countlist % 3  > 0 && countlist % 3 < 3 ) pagenum++;
                if(!id.equals("api")){
                    req.setAttribute("listCollections", listPT);
                req.setAttribute("h3name", "Categories");
                req.setAttribute("link", "category");
                req.setAttribute("pagenum", pagenum);
                req.setAttribute("currPage", pageno);
                    getServletContext().getRequestDispatcher("/collections.jsp").forward(req, resp);
                } else{
                    out.println(API.Collections.getTypeThings(listPT, pagenum, pageno));
                }
            }
                break;
            case "v":
            if(!id.isEmpty()){
                entity.Product p = productDB.getSingleProduct(id);
                if(p != null){
                    
                    getServletContext().getRequestDispatcher("/proDetails.jsp").forward(req, resp);
                }else{
                    getServletContext().getRequestDispatcher("/404.jsp").forward(req, resp);
                }
            } else{
                getServletContext().getRequestDispatcher("/404.jsp").forward(req, resp);
            }
                break;
            default:
                getServletContext().getRequestDispatcher("/404.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
    
}
