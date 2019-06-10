/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.User;

import com.sun.xml.ws.transport.tcp.io.OutputWriter;
import entity.Category;
import entity.ProductType;
import entity.Wishlist;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Collection;
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
import javax.servlet.http.HttpSession;
import jdk.nashorn.internal.parser.JSONParser;
import models.CategoryFacadeLocal;
import models.CustomerFacadeLocal;
import models.ProductFacadeLocal;
import models.ProductTypeFacadeLocal;
import models.ReviewFacadeLocal;

/**
 *
 * @author bemap
 */
@WebServlet(name = "ProductDetail", urlPatterns = {"/product/*"})
public class Product extends HttpServlet {
    @EJB
    private CustomerFacadeLocal customerFacade;
    @EJB
    private ReviewFacadeLocal reviewFacade;
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
                String name; // page name
                try {
                    name = proType.getNameType(Integer.parseInt(id));
                } catch (Exception e) {
                    name = null;
                }
                if(name == null){
                    getServletContext().getRequestDispatcher("/404.jsp").forward(req, resp);
                }
                else{
                     List<String[]> listCat = new ArrayList<>();
        
       
                    String icon, catdescription;
                    for(Category c : proCat.FindCatStatus()){
                        try {
                            catdescription = c.getCateDescription().split(":")[0];
                            icon = c.getCateDescription().split(":")[1];
                        } catch (Exception e) {
                            catdescription = c.getCateDescription();
                            icon = "fa fa-gamepad";
                        }
                        listCat.add(new String[]{
                            c.getCatID()+"",
                            c.getCatName(),
                            catdescription,
                            icon
                        });
                    }
                    req.setAttribute("listCat", listCat);
                    
                    req.setAttribute("pagename", name);
                    req.setAttribute("collVal", id);
                    req.setAttribute("nameColl", "type");
                    req.setAttribute("maxPrice", productDB.getMaxPrice());
                    getServletContext().getRequestDispatcher("/product.jsp").forward(req, resp);
                }
            }else{
                //trang type
                req.setAttribute("pagename", "Types");
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
                            listPT.add(new String[]{String.valueOf(pt.getTypeID()),pt.getTypeName(),proType.getQuanType(pt)+""});
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
                    out.println(JSONGen.Collections.getTypeThings(listPT, pagenum, pageno));
                }
            }
                break;
            case "category":
            if(!id.isEmpty() && !id.equals("page") && !id.equals("api")){
                String name; // page name
                try {
                    name = proCat.getCategoryName(Integer.parseInt(id));
                } catch (Exception e) {
                    name = null;
                }
                if(name == null){
                    getServletContext().getRequestDispatcher("/404.jsp").forward(req, resp);
                }
                else{
                    
                     List<String[]> listCat = new ArrayList<>();
        
       
                    String icon, catdescription;
                    for(Category c : proCat.FindCatStatus()){
                        try {
                            catdescription = c.getCateDescription().split(":")[0];
                            icon = c.getCateDescription().split(":")[1];
                        } catch (Exception e) {
                            catdescription = c.getCateDescription();
                            icon = "fa fa-gamepad";
                        }
                        listCat.add(new String[]{
                            c.getCatID()+"",
                            c.getCatName(),
                            catdescription,
                            icon
                        });
                    }
                    req.setAttribute("listCat", listCat);
                    req.setAttribute("pagename", name);
                    req.setAttribute("collVal", id);
                    req.setAttribute("nameColl", "category");
                    req.setAttribute("maxPrice", productDB.getMaxPrice());
                    getServletContext().getRequestDispatcher("/product.jsp").forward(req, resp);
                }
            }else{
                //trang category
                req.setAttribute("pagename", "Categories");
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
                            listPT.add(new String[]{String.valueOf(pt.getCatID()),pt.getCatName(), proCat.getCatQuan(pt)+""});
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
                    out.println(JSONGen.Collections.getTypeThings(listPT, pagenum, pageno));
                }
            }
                break;
            case "v":
            if(!id.isEmpty()){
                entity.Product p = productDB.getSingleProduct(id);
                if(p != null){
                    List<String> list = new ArrayList<>();
                    list.add("Vipkien");
                    list.add("Tunzin 093");
                    list.add("Iphone 7");
                    list.add("Samsung 7");
                    list.add("Kzenton 0392");
                    list.add("Fovien 830");
                    list.add("Moutain Dew ");
                    list.add("Vip 700 S7");
                    list.add("Black Milktea");
                    list.add("Aleader Funky");
                    list.add("Black coil");
                    list.add("Logitech Mouse");
            //        list.add("Vippro");
            //        list.add("Nguoi dung lang im");
            //        list.add("Monster");
            //        list.add("Vip bien hoa");
            //        list.add("Guitar Solo");
            //        list.add("Bip Na Dang");
            //        list.add("Sony Z8");
                    req.setAttribute("list", list);
                    req.setAttribute("thisP", p);
                    req.setAttribute("thisImg", productDB.imageOf(p));
                    req.setAttribute("otherImgs", productDB.imagesOf(p));
                    req.setAttribute("pagename", p.getProName());
                    req.setAttribute("url", req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/product/v/"+id);
                    HttpSession session = req.getSession();
                    req.setAttribute("onWishlist", onWoC(p.getWishlistCollection(), session));
                    try {
                        int cusid = (int) session.getAttribute("sessionid");
                        if(!reviewFacade.checkIfCusRatingThis(customerFacade.find(cusid), p)){
                            req.setAttribute("allowRV", 1);
                        }else{
                            req.setAttribute("allowRV", 0);
                        }
                    } catch (Exception e) {
                        req.setAttribute("allowRV", 1);
                    }
                    
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
    
    ///Product on Wishlist of Customer
    private boolean onWoC(Collection<Wishlist> cw, HttpSession session) {
        try {
            int cusid = (int) session.getAttribute("sessionid");
            for(Wishlist wh : cw){
                if(wh.getCusID().getCusID() == cusid){
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }
    
}
