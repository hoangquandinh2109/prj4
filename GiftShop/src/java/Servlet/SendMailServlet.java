/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.CustomerFacadeLocal;

/**
 *
 * @author USER
 */
public class SendMailServlet extends HttpServlet {

    @EJB
    private CustomerFacadeLocal customerFacade;

    private String host;
    private String port;
    private String user;
    private String pass;

    @Override
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
    private static final String ALPHAC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    public static String randomAlphaC(int count) {
        StringBuilder builder = new StringBuilder();
        while (count-- != 0) {
            int character = (int) (Math.random() * ALPHAC_STRING.length());
            builder.append(ALPHAC_STRING.charAt(character));
        }
        return builder.toString();
    }
    private static final String ALPHAUC_STRING = "abcdefghiklmnopqrstuvwxyz";

    public static String randomAlphaUC(int count) {
        StringBuilder builder = new StringBuilder();
        while (count-- != 0) {
            int character = (int) (Math.random() * ALPHAUC_STRING.length());
            builder.append(ALPHAUC_STRING.charAt(character));
        }
        return builder.toString();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String recipient = request.getParameter("email");
            // String email = request.getParameter("email");

            String subject = "Reset password";
            String content = "New Password :";
            int thisCus = 0;
            for (int i = 0; i < customerFacade.findAll().size(); i++) {
                if (customerFacade.findAll().get(i).getCusEmail().equals(recipient)) {
                    thisCus++;
                }
            }
            if (thisCus != 0) {
                response.setStatus(HttpServletResponse.SC_OK);
                Random rd = new Random();
                String capitalletter = randomAlphaC(3);
                String uncapitalletter = randomAlphaUC(3);
                int numeric = rd.nextInt(999999) + 1;
                int rand = rd.nextInt(3) + 1;
                String newpass = null;
                if (rand == 1) {
                    newpass = capitalletter + String.valueOf(numeric) + uncapitalletter;
                }
                if (rand == 2) {
                    newpass = String.valueOf(numeric) + capitalletter + uncapitalletter;
                }
                if (rand == 3) {
                    newpass = uncapitalletter + String.valueOf(numeric) + capitalletter;
                }

                Customer cus = customerFacade.findByEmail(recipient);
                cus.setCusPassword(newpass);
                customerFacade.edit(cus);
                try {
                    sendMail.sendEmail(host, port, user, pass, recipient, subject,
                            content + newpass);
//            resp.setContentType("application/json");
                } catch (MessagingException ex) {
                    Logger.getLogger(SendMailServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
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

