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
@WebServlet(name = "Account", urlPatterns = {"/account/*"})
public class Account extends HttpServlet {
    @EJB
    private CustomerFacadeLocal customer;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String usernamess = (String) session.getAttribute("sessionname");
        int myid = (int) session.getAttribute("sessionid");
        
        Customer me = customer.find(myid);
        req.setAttribute("myname", me.getCusName());
        req.setAttribute("myaddress", me.getCusAddress());
        req.setAttribute("myphone", me.getCusPhone());
        req.setAttribute("myemail", me.getCusEmail());
        
        if(usernamess==null){
            resp.sendRedirect(req.getContextPath());
        }else{
            req.setAttribute("username", usernamess);
            String[] uris = new String[]{};
            PrintWriter out =  resp.getWriter();




            try {//page != null case
                uris = req.getPathInfo().substring(1).split("/");
                String page = uris[0];
                String subpage = null;//only use subpage for order detail
                String uri3rd = null;



    //            prevent any other subpage and blank subpage
                try {
                    subpage = uris[1];
                    if(!subpage.equals("detail")){
                        subpage = "sdfdsf";//make if no.0 do false things
                    }
                    uri3rd = uris[2];
                } catch (Exception e) {
                }






                //if no.0 
                if((subpage == null || (subpage.equals("detail") && page.equals("orders"))) && uri3rd == null){
                    switch (page) {
                        case "dashboard":
                            req.setAttribute("pagename", "DashBoard");
                            req.setAttribute("tabname", "dashboard");
                            getServletContext().getRequestDispatcher("/account.jsp").forward(req, resp);
                            break;




                        case "orders":
                            if(subpage !=null && subpage.equals("detail")){
                                req.setAttribute("pagename", "#201913223");//bip
                                req.setAttribute("tabname", "orderdetail");
                                getServletContext().getRequestDispatcher("/account.jsp").forward(req, resp);
                            }else{
                                req.setAttribute("pagename", "Orders");
                                req.setAttribute("tabname", "orders");
                                getServletContext().getRequestDispatcher("/account.jsp").forward(req, resp);
                            }
                            break;




                        case "wishlist":
                            req.setAttribute("pagename", "Wishlist");
                            req.setAttribute("tabname", "wishlist");
                            getServletContext().getRequestDispatcher("/account.jsp").forward(req, resp);
                            break;




                        case "info":
                            req.setAttribute("pagename", "Account");
                            req.setAttribute("tabname", "info");
                            getServletContext().getRequestDispatcher("/account.jsp").forward(req, resp);
                            break;


                        default:
                            out.println("4041"+page);
                            break;
                    }
                } else{
                    out.println("4042"+subpage);
                }
            } catch (Exception e) {
                ///page = null case
                req.setAttribute("pagename", "DashBoard");
                req.setAttribute("tabname", "dashboard");
                getServletContext().getRequestDispatcher("/account.jsp").forward(req, resp);
            }
        }
    }
}
