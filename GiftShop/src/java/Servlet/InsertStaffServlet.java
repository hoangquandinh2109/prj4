/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import entity.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.StaffFacadeLocal;

/**
 *
 * @author USER
 */
public class InsertStaffServlet extends HttpServlet {

    @EJB
    private StaffFacadeLocal staffFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String pass = request.getParameter("password");
//            boolean status = Boolean.parseBoolean(request.getParameter("status"))==true?true:false;
//            int role = Integer.parseInt(request.getParameter("role"));
            String errmess = null;
            for (Staff staff : staffFacade.findAll()) {
                if (staff.getStaffEmail().equals(email)) {
                    if (staff.getStaffID().equals(id)) {
                        errmess = "ID does not exist";
                        request.setAttribute("loi1", true);
                        request.setAttribute("abc", errmess);
                        request.getRequestDispatcher("admin/insertStaff.jsp").forward(request, response);
                        return;
                    }
                    errmess = "Email does not exist";
                    request.setAttribute("loi2", true);
                    request.setAttribute("abc", errmess);
                    request.getRequestDispatcher("admin/insertStaff.jsp").forward(request, response);
                    return;
                }
//                String staffid = "";
//                Integer numOfProducts = Integer.valueOf(staffFacade.count() + 1);
//                switch (numOfProducts.toString().length()) {
//                    case 1: // '\001'
//                        staffid = (new StringBuilder()).append("S00").append(numOfProducts).toString();
//                        break;
//
//                    case 2: // '\002'
//                        staffid = (new StringBuilder()).append("S0").append(numOfProducts).toString();
//                        break;
//
//                    case 3: // '\003'
//                        staffid = (new StringBuilder()).append("S").append(numOfProducts).toString();
//                        break;
//                }
                Staff staf = new Staff(id, name, phone, email, address, pass);
                //Staff staf = new Staff();
                
                staffFacade.create(staf);
                
                errmess = "Insert Success!";
                request.setAttribute("loi3", true);
                request.setAttribute("abc", errmess);
                request.getRequestDispatcher("showStaffServlet?action=ShowStaff").forward(request, response);

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
