/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet.User;

import entity.Category;
import entity.ProductType;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.CategoryFacadeLocal;
import models.ProductFacadeLocal;
import models.ProductTypeFacadeLocal;

/**
 *
 * @author johnn
 */
@WebServlet(name = "Home", urlPatterns = {"/home"})
public class Home extends HttpServlet {
    
    @EJB
    private ProductFacadeLocal proDB;
    @EJB
    private ProductTypeFacadeLocal typeDB;
    @EJB
    private CategoryFacadeLocal catDB;
    DecimalFormat fmd = new DecimalFormat("#.##");
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> list = new ArrayList<>();
        
        
        List<entity.Product> listnewP = proDB.top12New();
        List<String[]> listnew = new ArrayList<>();
        
        
        for(entity.Product p : listnewP){
            listnew.add(new String[]{
                p.getProID(),
                p.getProName(),
                "$"+p.getProPrice(),
                proDB.imageOf(p),
                p.getStarAVG()+"",
                p.getReviewCollection().size()+"",
                "$"+newprice(p)
            });
        }
        
        List<String[]> listType = new ArrayList<>();
        List<String[]> listCat = new ArrayList<>();
        
        
        
        String icon, catdescription;
        for(Category c : catDB.FindCatStatus()){
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
        for(ProductType t : typeDB.FindTypeStatus()){
            listType.add(new String[]{
                t.getTypeID()+"",
                t.getTypeName(),
                typeDB.getQuanType(t)+""
            });
        }
    
      
        req.setAttribute("list", list);
        req.setAttribute("listn", listnew);
        req.setAttribute("listCat", listCat);
        req.setAttribute("listType", listType);
        req.setAttribute("pagename", "Home");
        HttpSession session=req.getSession();
        req.setAttribute("sessionname", session.getAttribute("sessionname"));
        getServletContext().getRequestDispatcher("/home.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
    private String newprice(entity.Product p) {
        return (p.getDiscout() == 0)? "0.0" : fmd.format((100 - p.getDiscout()) * p.getProPrice() /100);
    }

}