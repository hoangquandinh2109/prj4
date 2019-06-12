/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import entity.Category;
import entity.ProductType;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;
import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.CategoryFacadeLocal;
import models.ProductTypeFacadeLocal;

/**
 *
 * @author Asus
 */
@WebServlet(name = "filterByCate", urlPatterns = {"/filterByCate"})
public class filterByCate extends HttpServlet {
    @EJB
    private CategoryFacadeLocal categoryFacade;
    @EJB
    private ProductTypeFacadeLocal productTypeFacade;

 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out =response.getWriter();
        int CateID=Integer.parseInt(request.getParameter("data"));
        
        Category cat=categoryFacade.find(CateID);
            List<ProductType> type=productTypeFacade.FilterByCate(cat);
            System.out.println(type);
             JsonArrayBuilder jsonUserArray = Json.createArrayBuilder();
            for(ProductType t:type){
                JsonObjectBuilder likeItem = Json.createObjectBuilder()
                            .add("typeStatus", true)
                            .add("typeID", t.getTypeID()).
                            add("typeName", t.getTypeName());
                            
                    jsonUserArray.add(likeItem);
            }
           
           
                    JsonObject jsonFinalOutput = Json.createObjectBuilder().add("type", jsonUserArray).build();
                    //System.out.println("");
                    out.print(jsonFinalOutput);
                    //System.out.println(jsonFinalOutput);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
