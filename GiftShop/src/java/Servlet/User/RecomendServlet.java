/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.User;

import entity.Category;
import entity.Customer;
import entity.Product;
import entity.Review;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Random;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.CategoryFacadeLocal;
import models.CustomerFacadeLocal;
import models.ProductFacadeLocal;
import models.ReviewFacadeLocal;

/**
 *
 * @author USER
 */
@WebServlet(name = "RecomendServlet", urlPatterns = {"/RecomendServlet"})
public class RecomendServlet extends HttpServlet {

    @EJB
    private CustomerFacadeLocal customerFacade;
    @EJB
    private CategoryFacadeLocal categoryFacade;

    @EJB
    private ReviewFacadeLocal reviewFacade;
    @EJB
    private ProductFacadeLocal productFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String action = request.getParameter("action");
            List<Customer> listCustomer = new ArrayList<>();
            if (action.equals("show")) {
                for (Customer customer : customerFacade.findAll()) {
                    listCustomer.add(customer);
                    request.setAttribute("listcustomer", listCustomer);
                }
                request.getRequestDispatcher("test_1.jsp").forward(request, response);
            }
            if (action.equals("submit")) {
                Product pro = productFacade.find("PR009");
                int cusid = Integer.parseInt(request.getParameter("cusid"));
                Customer customer = customerFacade.find(cusid);
                List<Product> list = RecomendProduct(pro);
                request.setAttribute("list", list);
                List<Customer> listCus = nearestCustomer(customer, 0.3);
                List<Review> listReview = CustomerNearestProduct(customer);
                List<Review> listReview1 = new ArrayList<>();
                List<Review> listReview2 = new ArrayList<>();
                for (int i = 0; i < listCus.size(); i++) {
                    listReview1.addAll(listCus.get(i).getReviewCollection());
                }
                for (int i = 0; i < listReview.size(); i++) {
                    if(listReview.get(i).getStar() >= 4){
                        listReview2.add(listReview.get(i));
                    }
                }
                int j = 0;
                while(j < reviewFacade.findAll().size()){
                    
                    j++;
                }
                request.setAttribute("listReview1", listReview1);
                request.setAttribute("listReview", listReview2);
                request.setAttribute("listC", listCus);
                request.getRequestDispatcher("RecomendServlet?action=show").forward(request, response);
            }

            Random rd = new Random();

//            String a = null;
//            for (int i = 0; i < 30; i++) {
//                int ranP = rd.nextInt(20) + 1;
//                int ranS = rd.nextInt(5) + 1;
//                int ranC = rd.nextInt(20) + 1;
//                if (ranP < 10) {
//                    a = "PR00";
//                } else {
//                    a = "PR0";
//                }
//                Product product1 = productFacade.find(a + String.valueOf(ranP));
//                Customer cus = customerFacade.find(ranC);
//                Review rv = new Review();
//                rv.setCusID(cus);
//                rv.setProID(product1);
//                rv.setStar(ranS);
//                rv.setReviewContent("oke" + rd.nextInt(10000));
//                rv.setReviewTitle("sp" + rd.nextInt(20) + 1);
//                reviewFacade.create(rv);
//            }
        }
    }

    private List<Review> CustomerNearestProduct(Customer customer) {
        List<Review> listReview = new ArrayList<>();
        List<Review> listReview2 = new ArrayList<>();
        List<Customer> listCus = nearestCustomer(customer, 0.3);
        List<Review> listReview1 = new ArrayList<>(customer.getReviewCollection());
        for (Customer customer1 : listCus) {
            listReview.addAll(customer1.getReviewCollection());
        }
        int i = 0;
        while (i < listReview1.size()) {
            String proid1 = listReview1.get(i).getProID().getProID();
            for (int j = 0; j < listReview.size(); j++) {
                String proid2 = listReview.get(j).getProID().getProID();

                if (proid1.equals(proid2)) {
                    listReview.remove(j);
                }
            }
            i++;
        }
//        int k = 0;
//        while (k < listReview2.size()) {
//            String proid11 = listReview.get(k).getProID().getProID();
//            for (int l = 0; l < listReview1.size(); l++) {
//                String proid22 = listReview1.get(l).getProID().getProID();
//                if (proid11.equals(proid22)) {
//                    listReview2.remove(l);
//                }
//            }
//            k++;
//        }

        return listReview;
    }

    private List<Product> RecomendProduct(Product product) {
        List<Product> listP = new ArrayList<>();
        List<Product> listR = new ArrayList<>();
        listP = productFacade.findAll();
        for (int i = 0; i < listP.size(); i++) {
            if (!product.getProID().equals(listP.get(i).getProID())
                    && product.getCatID().getCatID().equals(listP.get(i).getCatID().getCatID())) {
                listR.add(listP.get(i));
            }
        }
        return listR;
    }
    private List<Product> RecomendProductT(Product product) {
        List<Product> listP = new ArrayList<>();
        List<Product> listR = new ArrayList<>();
        listP = productFacade.findAll();
        for (int i = 0; i < listP.size(); i++) {
            if (!product.getProID().equals(listP.get(i).getProID())
                    && product.getTypeID().getTypeID().equals(listP.get(i).getTypeID().getTypeID())) {
                listR.add(listP.get(i));
            }
        }
        return listR;
    }

    // thuat toan tinh diem giong nhau cua 2 doi tuong
    private double caculateNeighbor(Customer cus1, Customer cus2) {
        int count = 0;
        double similarity = 0;
        double sumdiff = 0;
        double diff = 0;
        for (Review r1 : cus1.getReviewCollection()) {
            for (Review r2 : cus2.getReviewCollection()) {
                Product p1 = r1.getProID();
                Product p2 = r2.getProID();
                if (p1.getProID().equals(p2.getProID())) {
                    diff += r1.getStar() - r2.getStar();
                    sumdiff += diff * diff;
                    count++;
                }
            }
        }
        if (count > 0) {
            similarity = 1 / (Math.sqrt(sumdiff) + 1);
        }
        System.out.println(similarity);
        return similarity;
    }

    private List<Customer> nearestCustomer(Customer activeCus, double nearestnumber) {
        List<Customer> listCus = new ArrayList<>(customerFacade.findAll());
        List<Customer> listCusOther = new ArrayList<>();
        for (Customer Othercustomer : listCus) {
            if (!Othercustomer.getCusID().equals(activeCus.getCusID())) {
                double similarityOther = caculateNeighbor(activeCus, Othercustomer);
                if (similarityOther > nearestnumber) {
                    listCusOther.add(Othercustomer);
                }
            }
        }
        return listCusOther;
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
