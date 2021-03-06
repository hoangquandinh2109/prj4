/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import entity.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class showStaffServlet extends HttpServlet {
    @EJB
    private StaffFacadeLocal staffFacade;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            if (action.equals("ShowStaff")) {
                List<Staff> listStaff = staffFacade.findAll();
                request.setAttribute("list", listStaff);
                request.getRequestDispatcher("admin/listStaff.jsp").forward(request, response);
            }
            else  if(action.equals("Block")){
                String id = request.getParameter("id");
                Staff staff = staffFacade.find(id);
                if(staff != null){
                    if(staff.getStaffStatus().equals(true)){
                        staff.setStaffStatus(false);
                        staffFacade.edit(staff);
                        request.getRequestDispatcher("showStaffServlet?action=ShowStaff").forward(request, response);
                    }
                }
                request.getRequestDispatcher("showStaffServlet?action=ShowStaff").forward(request, response);
            }            
            else if(action.equals("Active")){
                String id = request.getParameter("id");
                Staff staff = staffFacade.find(id);
                if(staff != null){
                    if(staff.getStaffStatus().equals(false)){
                        staff.setStaffStatus(true);
                        staffFacade.edit(staff);
                        request.getRequestDispatcher("showStaffServlet?action=ShowStaff").forward(request, response);
                    }
                }
                request.getRequestDispatcher("showStaffServlet?action=ShowStaff").forward(request, response);
        }
            else if(action.equals("Delete")){
            String code = request.getParameter("code");
            Staff staff = staffFacade.find(code);
            staffFacade.remove(staff);
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
