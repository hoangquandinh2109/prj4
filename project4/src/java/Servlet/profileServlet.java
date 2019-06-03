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
public class profileServlet extends HttpServlet {

    @EJB
    private StaffFacadeLocal staffFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            String staff_id = (String) session.getAttribute("staff_id");
            Staff staff = staffFacade.find(staff_id);
            String action = request.getParameter("action");
            if (action.equals("profile")) {
                if (staff != null) {
                    Staff stf = new Staff();
                    stf.setStaffID(staff_id);
                    stf.setStaffName(staff.getStaffName());
                    stf.setStaffEmail(staff.getStaffEmail());
                    stf.setStaffAddress(staff.getStaffAddress());
                    stf.setStaffPhone(staff.getStaffPhone());
                    stf.setStaffPassword(staff.getStaffPassword());
                    session.setAttribute("staff", stf);
                    response.sendRedirect("admin/profile.jsp");
                }
            }

            if (action.equals("Update")) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                String role = request.getParameter("role");
   
                Staff st = new Staff();
                st.setStaffID(staff_id);
                st.setStaffName(name);
                st.setStaffEmail(email);
                st.setStaffAddress(address);
                st.setStaffPhone(phone);
                st.setStaffPassword(staff.getStaffPassword());
                 st.setStaffStatus(staff.getStaffStatus());
                st.setRole(staff.getRole());
 

                staffFacade.edit(st);
                session.setAttribute("staff", st);
                response.sendRedirect("admin/profile.jsp");
            }
//                        session.setAttribute("id", staff.getStaffID().toString());
//                        session.setAttribute("staff_name", staff.getStaffName().toString());
//                        request.getRequestDispatcher("admin/DetailStaff.jsp").forward(request, response);

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
