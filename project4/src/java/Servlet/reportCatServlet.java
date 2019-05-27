/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import entity.Category;
import entity.CategoryReport;
import entity.Customer;
import entity.Product;
import entity.Purchase;
import entity.PurchaseItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.CategoryFacadeLocal;

/**
 *
 * @author Asus
 */
public class reportCatServlet extends HttpServlet {

    @EJB
    private CategoryFacadeLocal categoryFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
//            for (PurchaseItem pc : p.getPurchaseItemCollection()) {
//                        income += pc.getQuantity();
//                    }
            ArrayList<CategoryReport> list = new ArrayList<CategoryReport>();
            double total = 0.0D;
            for (Category cat : categoryFacade.findAll()) {
                String category = cat.getCatName();
                double income = 0.0D;
                for (Product p : cat.getProductCollection()) {
                    for (PurchaseItem pc : p.getPurchaseItemCollection()) {
                        income += pc.getQuantity();
                    }
                }
                CategoryReport cReport = new CategoryReport(category, income);
                list.add(cReport);
                total += income;
                request.setAttribute("total", total);

            }
            request.setAttribute("list", list);//Luu ten hang doang thu vao bien
            request.getRequestDispatcher("admin/ReportCat.jsp").forward(request, response);
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
