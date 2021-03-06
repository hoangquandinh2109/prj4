/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import entity.Category;
import entity.Feature;
import entity.ProductType;
import entity.TbTag;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.CategoryFacadeLocal;
import models.FeatureFacadeLocal;
import models.ProductTypeFacadeLocal;
import models.TbTagFacadeLocal;

/**
 *
 * @author Asus
 */
public class showCatServlet extends HttpServlet {
    @EJB
    private TbTagFacadeLocal tbTagFacade;
    @EJB
    private ProductTypeFacadeLocal productTypeFacade;
    @EJB
    private CategoryFacadeLocal categoryFacade;
     @EJB
    private FeatureFacadeLocal fe;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             List<Category> listCate = categoryFacade.FindCatStatus();
             List<ProductType> listTyp = productTypeFacade.FindTypeStatus();
             List<Feature> listFea = fe.FindFeaStatus();
             List<TbTag> listTag=tbTagFacade.findAll();
             request.setAttribute("tags", listTag);
          request.setAttribute("listFea", listFea);
          request.setAttribute("listCat", listCate);
          request.setAttribute("listType", listTyp);
          request.getRequestDispatcher("admin/insertPro.jsp").forward(request, response);
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
