/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import com.sun.xml.ws.transport.tcp.io.OutputWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bemap
 */
@WebServlet(name = "ProductDetail", urlPatterns = {"/product"})
public class Product extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> list = new ArrayList<>();
        list.add("hello");
        list.add("sdfdsf");
        list.add("hsdfdellddo");
        list.add("hesssllo");
        list.add("heddfdllo");
        list.add("hesddddfdfllo");
        list.add("hedfsdfllo");
        list.add("helxcjgjghdlo");
        req.setAttribute("list", list);
        String id = "";
        id = req.getParameter("id");
        if(id != null){
            getServletContext().getRequestDispatcher("/proDetails.jsp").forward(req, resp);
        }else{
            getServletContext().getRequestDispatcher("/home.jsp").forward(req, resp);
        }
        
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

}
