/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.User;

import models.CartFacade;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author johnn
 */
@WebServlet(name = "democartdeleteupdate", urlPatterns = {"/johnny"})
public class democartdeleteupdate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int quan = Integer.parseInt(request.getParameter("quan"));
        HttpSession session = request.getSession();
        CartFacade c = new CartFacade(session);
        if (quan == 0) {
            try {
                c.deletefromCart(id);
            } catch (Exception e) {
            }
        } else {
            c.updateQuantityCart(id, quan);
        }

    }
}
