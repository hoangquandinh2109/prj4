/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet.User;

import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.CustomerFacadeLocal;
import models.PurchaseFacadeLocal;

/**
 *
 * @author johnn
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {
    @EJB
    private CustomerFacadeLocal db;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        HttpSession session=req.getSession();  
        PrintWriter out = resp.getWriter();
        Customer thisCus = db.login(email, password);
        if(thisCus != null){
            resp.setStatus(HttpServletResponse.SC_OK);
            session.setAttribute("sessionname", thisCus.getCusName());  
            session.setAttribute("sessionid", thisCus.getCusID()); 
//            resp.setContentType("application/json");
        }else{
            resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
        
        
    }
    
}
