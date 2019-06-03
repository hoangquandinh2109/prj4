/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet.User;

import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.CustomerFacadeLocal;

/**
 *
 * @author johnn
 */
@WebServlet(name = "Register", urlPatterns = {"/register"})
public class Register extends HttpServlet {
    @EJB
    private CustomerFacadeLocal customerFacade;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        System.out.println("Your email: "+email);
        if(!customerFacade.checkIfEmailExisted(email)){
            response.setStatus(HttpServletResponse.SC_OK);
        } else{
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        
        String gender = request.getParameter("gender");
        boolean isMale =(gender.equals("male"))?true:false;
        
        Customer customer = new Customer(name, email, password, address, phone, true, isMale);
        
        if (customerFacade.register(customer)) {
            HttpSession session=request.getSession();  
            session.setAttribute("sessionname", customer.getCusName());  
            session.setAttribute("sessionid", customer.getCusID()); 
            response.setStatus(HttpServletResponse.SC_OK);
        } else{
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }


}
