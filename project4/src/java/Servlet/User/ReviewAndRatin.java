/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.User;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.ProductFacadeLocal;
import models.ReviewFacadeLocal;
import entity.Product;
import entity.Review;
import javax.servlet.http.HttpSession;
import models.CustomerFacadeLocal;

/**
 *
 * @author johnn
 */
@WebServlet(name = "ReviewAndRatin", urlPatterns = {"/review"})
public class ReviewAndRatin extends HttpServlet {
    @EJB
    private CustomerFacadeLocal customerFacade;

    @EJB
    private ProductFacadeLocal productFacade;
    @EJB
    private ReviewFacadeLocal reviewFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("sessionname");
        int id = (int) session.getAttribute("sessionid");
        if(reviewFacade.checkIfCusRating(customerFacade.find(id))){
            response.getWriter().println("May ko dc rating");
        }
        if (name != null) {
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet ReviewAndRatin</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet ReviewAndRatin at " + request.getContextPath() + "</h1>");
                out.println("<form method=\"post\">"
                        + "<input name=\"content\">"
                        + "<input value=\""+id+"\" name=\"cusid\">"
                        + "<input name=\"star\">");
                String productt = "<select name=\"product\">";

                for (Product p : productFacade.findAll()) {
                    productt += "<option value=\"" + p.getProID() + "\">" + p.getProName() + "</option>";
                }
                productt += "</select><button type=\"submit\">review</button></form>";
                out.println(productt);
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String content = request.getParameter("content");
        int star = Integer.parseInt(request.getParameter("star"));
        int cusid = Integer.parseInt(request.getParameter("cusid"));
        String product = request.getParameter("product");
        Review r = new Review();
        r.setProID(productFacade.find(product));
        r.setCusID(customerFacade.find(cusid));
        r.setReviewContent(content);
        r.setStar(star);
        reviewFacade.create(r);

    }
}
