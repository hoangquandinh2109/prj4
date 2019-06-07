/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.User;

import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.CustomerFacadeLocal;
import models.PurchaseFacadeLocal;
import models.PurchaseItemFacadeLocal;
import models.WishlistFacadeLocal;

/**
 *
 * @author johnn
 */
@WebServlet(name = "Account", urlPatterns = {"/account/*"})
public class Account extends HttpServlet {

    @EJB
    private PurchaseItemFacadeLocal orderdetail;
    @EJB
    private PurchaseFacadeLocal order;
    @EJB
    private WishlistFacadeLocal wishlist;
    @EJB
    private CustomerFacadeLocal customer;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        int myid = (int) session.getAttribute("sessionid");

        Customer me = customer.find(myid);
        switch (action) {
            case "changepass":
                String password = req.getParameter("password");

                me.setCusPassword(password);

                try {
                    customer.edit(me);
                    resp.setStatus(200);
                } catch (Exception e) {
                    resp.setStatus(404);
                }
                break;
            case "testoldpass":
                String oldpass = req.getParameter("oldpassword");
                if (!me.getCusPassword().equals(oldpass)) {
                    resp.setStatus(200);
                } else {
                    resp.setStatus(404);
                }
                break;
            case "updateinfo":
                String address = req.getParameter("address");
                String phone = req.getParameter("phone");
                String name = req.getParameter("name");
                String email = req.getParameter("email");

                me.setCusAddress(address);
                me.setCusPhone(phone);
                me.setCusName(name);
                me.setCusEmail(email);
                try {
                    customer.edit(me);
                    resp.setStatus(200);
                } catch (Exception e) {
                    resp.setStatus(404);
                }

                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String usernamess = (String) session.getAttribute("sessionname");

        if (usernamess == null) {
            resp.sendRedirect(req.getContextPath());
        } else {
            int myid = (int) session.getAttribute("sessionid");

            Customer me = customer.find(myid);
            req.setAttribute("myname", me.getCusName());
            req.setAttribute("myaddress", me.getCusAddress());
            req.setAttribute("myphone", me.getCusPhone());
            req.setAttribute("myemail", me.getCusEmail());

            req.setAttribute("username", usernamess);
            String[] uris = new String[]{};
            PrintWriter out = resp.getWriter();

            try {//page != null case
                uris = req.getPathInfo().substring(1).split("/");
                String page = uris[0];
                String subpage = null;//only use subpage for order detail
                String uri3rd = null;

                //            prevent any other subpage and blank subpage
                try {
                    subpage = uris[1];
                    uri3rd = uris[2];
                } catch (Exception e) {
                }

                //if no.0 
                if ((subpage == null || page.equals("orders")) && uri3rd == null) {
                    switch (page) {
                        case "":
                            req.setAttribute("pagename", "DashBoard");
                            req.setAttribute("tabname", "dashboard");
                            getServletContext().getRequestDispatcher("/account.jsp").forward(req, resp);
                            break;
                        case "dashboard":
                            req.setAttribute("pagename", "DashBoard");
                            req.setAttribute("tabname", "dashboard");
                            getServletContext().getRequestDispatcher("/account.jsp").forward(req, resp);
                            break;

                        case "orders":
                            if (subpage != null) {
                                req.setAttribute("pagename", subpage);//bip
                                req.setAttribute("tabname", "orderdetail");
                                getServletContext().getRequestDispatcher("/account.jsp").forward(req, resp);
                            } else {
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
                            getServletContext().getRequestDispatcher("/404.jsp").forward(req, resp);
                            return;
                    }
                } else {
                    getServletContext().getRequestDispatcher("/404.jsp").forward(req, resp);
                    return;
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
