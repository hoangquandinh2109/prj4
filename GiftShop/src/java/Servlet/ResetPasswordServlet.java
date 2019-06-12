/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import entity.Mailbox;
import entity.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.MailboxFacade;
import models.MailboxFacadeLocal;
import models.StaffFacadeLocal;

/**
 *
 * @author USER
 */
@WebServlet(name = "ResetPasswordServlet", urlPatterns = {"/ResetPasswordServlet"})
public class ResetPasswordServlet extends HttpServlet {
    @EJB
    private StaffFacadeLocal staffFacade;
    @EJB
    private MailboxFacadeLocal mailboxFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
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
        String action = request.getParameter("action");
        String email = request.getParameter("email");
        //      String sub = "FOR GOT PASS WORD"
        String messa = request.getParameter("abcxyz");
        int i = 0;
        int count = 0;
        String errmess = null;
        while (i < staffFacade.findAll().size()) {
            if (staffFacade.findAll().get(i).getStaffEmail().equals(messa)) {
                count++;
            }
            i++;
        }
        if (count == 0) {
            errmess = "Email does not exist";
            request.setAttribute("loi", true);
            request.setAttribute("abc", errmess);
        } else {
            errmess = "Success";
            Mailbox mail = new Mailbox(messa);
            mailboxFacade.create(mail);
            request.setAttribute("loi1", true);
            request.setAttribute("abc", errmess);
        }
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