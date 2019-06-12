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
 * @author USE
 */
public class changPassServlet extends HttpServlet {

     @EJB
    private StaffFacadeLocal staffFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String retypePass = request.getParameter("retypePassword");

            HttpSession session = request.getSession();

            String id = (String) session.getAttribute("staff_id");

            Staff list = staffFacade.find(id);
            String message = null;
            
            if (id != null) {
                if (list.getStaffPassword().equals(currentPassword)) {
                    if (newPassword.equals(retypePass)) {
                        Staff staff = new Staff();
                        staff.setStaffID(id);
                        staff.setStaffName(list.getStaffName());
                        staff.setStaffAddress(list.getStaffAddress());
                        staff.setStaffPhone(list.getStaffPhone());
                        staff.setStaffEmail(list.getStaffEmail());
                        staff.setStaffPassword(newPassword);
                        staff.setRole(list.getRole());
                        staff.setStaffStatus(true);
                        staffFacade.edit(staff);
                        session.setAttribute("msg", true);
//                        response.sendRedirect("admin/profile.jsp");
                        request.getRequestDispatcher("profileServlet?action=profile").forward(request, response);
                        return;
                    } else {
                        session.setAttribute("msg", true);
                        session.setAttribute("message", "Password Confirm incorrect");
                        response.sendRedirect("admin/changepassword.jsp");
                        return;

                    }

                    //  session.invalidate();
                    //session.setAttribute("id", id);
                }
                session.setAttribute("err1", true);
                response.sendRedirect("admin/changepassword.jsp");
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
