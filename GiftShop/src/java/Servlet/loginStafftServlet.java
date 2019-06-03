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
import javax.servlet.http.HttpSession;
import models.StaffFacadeLocal;

/**
 *
 * @author USER
 */
public class loginStafftServlet extends HttpServlet {
    @EJB
    private StaffFacadeLocal staffFacade;

   
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            
             throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            String pwd = request.getParameter("password");
//            List<Staff> listStaff = new ArrayList<>();
            HttpSession session = request.getSession();
            String mess = null;
            for (Staff staff : staffFacade.findAll()) {
                if (staff.getStaffEmail().equals(email)) {
                    if (pwd.equals(staff.getStaffPassword().toString())) {
                        mess = staff.getStaffEmail();
                        request.setAttribute("mess", mess);
                        session.setAttribute("staff_name", staff.getStaffName().toString());
                        session.setAttribute("staff_id", staff.getStaffID().toString());
                        session.setAttribute("role", staff.getRole().toString());
                        request.getRequestDispatcher("admin/index.jsp").forward(request, response);
                    }
                }
            }
            mess = "Username or Password incorrect";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("admin/LoginStaff.jsp").forward(request, response);
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
