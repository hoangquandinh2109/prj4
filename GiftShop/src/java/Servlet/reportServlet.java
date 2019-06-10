/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import entity.Report;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.CategoryFacadeLocal;
import models.ProductFacadeLocal;
import models.PurchaseFacadeLocal;

/**
 *
 * @author Asus
 */
public class reportServlet extends HttpServlet {

    @EJB
    private CategoryFacadeLocal categoryFacade;

    @EJB
    private PurchaseFacadeLocal purchaseF;
    @EJB
    private ProductFacadeLocal productF;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("proList", productF.ProductTruee());
        request.getRequestDispatcher("admin/reportProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String proid = request.getParameter("productID");

//        String dateValue1 = daterange.substring(0, 10);
//        String dateValue2 = daterange.substring(13, 23);
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        String dateC = request.getParameter("dateSt");
        String dateE = request.getParameter("dateEnd");
        Date dateCr = new Date();
        Date dateEnd = new Date();
        try {
            dateCr = sdf.parse(dateC);
            dateEnd = sdf.parse(dateE);
        } catch (ParseException ex) {
            Logger.getLogger(reportServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
//        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
//        Date Startdate = new Date();
//        Date Enddate = new Date();
//        try {
//            Startdate = formatter.parse(dateValue1);
//            Enddate = formatter.parse(dateValue2);
//
//        } catch (ParseException e) {
//        }
        List<Report> reportList = productF.ProductReport(proid, dateCr, dateEnd);
        int totalPrice = 0;
        for (int i = 0; i < reportList.size(); i++) {
            if (reportList.get(i).getPurchaseStatus()==2) {
                totalPrice += reportList.get(i).getTotalPrice();
            }
        }
        request.setAttribute("totalProfit", totalPrice);
        request.setAttribute("dateStart", dateC);
        request.setAttribute("dateEndd", dateE);
//        request.setAttribute("dateRange", daterange);
        request.setAttribute("pro", productF.find(proid));
        request.setAttribute("reportList", reportList);
        request.getRequestDispatcher("admin/viewReportProduct.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
