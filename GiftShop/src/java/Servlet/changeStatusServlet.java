/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import entity.Product;
import entity.Purchase;
import entity.PurchaseItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.ProductFacadeLocal;
import models.PurchaseFacadeLocal;
import models.PurchaseItemFacadeLocal;
import org.jboss.weld.servlet.SessionHolder;

/**
 *
 * @author Asus
 */
public class changeStatusServlet extends HttpServlet {

    @EJB
    private ProductFacadeLocal productFacade;
    @EJB
    private PurchaseItemFacadeLocal purchaseItemFacade;

    @EJB
    private PurchaseFacadeLocal purchaseFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String purID = request.getParameter("purID");
//            String proID = request.getParameter("proID");
//            int purItem = Integer.parseInt(request.getParameter("puritem"));
            Short purStatus = Short.parseShort(request.getParameter("status"));
//            PurchaseItem purchaseItem = purchaseItemFacade.find(purItem);
//            Product product = productFacade.find(proID);
            Purchase pur = purchaseFacade.find(purID);
            List<PurchaseItem> listPurchaseItem = purchaseItemFacade.ItemofMe(pur);
            if (purStatus == 1) {
                for (PurchaseItem pi : listPurchaseItem) {
                    Product p = pi.getProID();
                    p.setQuantity(p.getQuantity() - pi.getQuantity());
                    productFacade.edit(p);
                }
                pur.setPurchaseStatus(purStatus);
                purchaseFacade.edit(pur);
                request.getRequestDispatcher("showPurServlet").forward(request, response);
            } else if (purStatus == 2) {
                pur.setPurchaseStatus(purStatus);
                Date date = new Date();
                pur.setDateOrderPaid(date);
                purchaseFacade.edit(pur);
                request.getRequestDispatcher("showPurServlet").forward(request, response);
            } else if (purStatus == 3) {
                if (pur.getPurchaseStatus() == 0) {
                    for (PurchaseItem pi : listPurchaseItem) {
                        Product p = pi.getProID();
                        p.setQuantity(p.getQuantity());
                        productFacade.edit(p);
                    }
                    Date date = new Date();
                    pur.setDateOrderPaid(date);
                    pur.setPurchaseStatus(purStatus);
                    purchaseFacade.edit(pur);
                    request.getRequestDispatcher("showPurServlet").forward(request, response);
                } else {
                    for (PurchaseItem pi : listPurchaseItem) {
                        Product p = pi.getProID();
                        p.setQuantity(p.getQuantity() + pi.getQuantity());
                        productFacade.edit(p);
                    }
                    pur.setPurchaseStatus(purStatus);
                    Date date = new Date();
                    pur.setDateOrderPaid(date);
                    purchaseFacade.edit(pur);
                    request.getRequestDispatcher("showPurServlet").forward(request, response);
                }
            }
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
