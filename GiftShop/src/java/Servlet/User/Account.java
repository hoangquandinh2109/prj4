/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.User;

import entity.Customer;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import models.CustomerFacadeLocal;
import models.PurchaseFacadeLocal;
import models.PurchaseItemFacadeLocal;
import models.WishlistFacadeLocal;

/**
 *
 * @author johnn
 */
@MultipartConfig
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

    private static final long serialVersionUID = 1L;
    private String path = "";
    public static final String SAVE_DIRECTORY = "avatar";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        int myid = (int) session.getAttribute("sessionid");

        Customer me = customer.find(myid);
        switch (action) {
            case "upavatar":
                path = uploadFile(req);
                me.setCusAvatar(path);
                customer.edit(me);
                resp.sendRedirect(req.getContextPath()+req.getServletPath());
                break;
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
                session.setAttribute("sessionname", name);
                try {
                    customer.edit(me);
                    resp.setStatus(200);
                } catch (Exception e) {
                    resp.setStatus(404);
                }

                break;
        }
    }

    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        String filePath = "";
        try {
            Part filePart = request.getPart("file");
            // fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            fileName = (String) getFileName(filePart);
            String basePath = getServletContext().getRealPath("") + File.separator + SAVE_DIRECTORY + File.separator;
            //String warFile = basePath.substring(0, basePath.length() - 74) + "\\DKHK4\\Web Pahes\\images" + File.separator + SAVE_DIRECTORY + File.separator;

            File uploadDir = new File(basePath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            InputStream inputStream = null;
            OutputStream outputStream = null;
            filePath = getServletContext().getContextPath() + SAVE_DIRECTORY + "\\" + fileName;
            try {

                File outputFilePath = new File(basePath + fileName);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
//                request.setAttribute("msg", SAVE_DIRECTORY + "/" + fileName);
//                request.setAttribute("message",
//                        "Upload has been done successfully >>" + SAVE_DIRECTORY + "/" + fileName);
            } catch (Exception e) {
                e.printStackTrace();
                fileName = "";
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileName;
    }

    private String getFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
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
            req.setAttribute("avatar", me.getCusAvatar());

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
