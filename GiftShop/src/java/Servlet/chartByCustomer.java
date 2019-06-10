/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import entity.ChartByCustomer;
import entity.Customer;
import entity.Purchase;
import entity.PurchaseItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.CustomerFacadeLocal;
import models.PurchaseFacadeLocal;

/**
 *
 * @author Asus
 */
public class chartByCustomer extends HttpServlet {

    @EJB
    private PurchaseFacadeLocal purchaseFacade;
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;
    @EJB
    private CustomerFacadeLocal customerFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            List<ChartByCustomer> list = new ArrayList<ChartByCustomer>();
            double total = 0.0D;
            for (Customer c : customerFacade.findAll()) {
                String email = c.getCusEmail();
                String name = c.getCusName();
                double income = 0.0D;
                for (Purchase o : orderofCus(c)) {
                    for (PurchaseItem od : oddofod(o)) {
                        income += od.getPurID().getTotalPrice();
                    }
                }
                if (income > 0.0D) {
                    ChartByCustomer cus = new ChartByCustomer(email, name, income);
                    list.add(cus);
                    total += income;
                    request.setAttribute("total", total);
                }
            }
            request.setAttribute("list", list);//Luu ten hang doang thu vao bien
            request.getRequestDispatcher("admin/chartByCustomer.jsp").forward(request, response);

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

    private List<PurchaseItem> oddofod(Purchase o) {

        return em.createQuery("SELECT o FROM PurchaseItem o WHERE o.purID = :purID")
                .setParameter("purID", o)
                .getResultList();
    }

    private List<Purchase> orderofCus(Customer c) {
        return em.createQuery("SELECT o FROM Purchase o WHERE o.cusID = :br")
                .setParameter("br", c)
                .getResultList();
    }

}
