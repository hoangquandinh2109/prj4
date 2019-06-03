/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "Home", urlPatterns = {"/home"})
public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> list = new ArrayList<>();
        list.add("Vipkien");
        list.add("Tunzin 093");
        list.add("Iphone 7");
        list.add("Samsung 7");
        list.add("Kzenton 0392");
        list.add("Fovien 830");
        list.add("Moutain Dew ");
        list.add("Vip 700 S7");
        list.add("Black Milktea");
        list.add("Aleader Funky");
        list.add("Black coil");
        list.add("Logitech Mouse");
//        list.add("Vippro");
//        list.add("Nguoi dung lang im");
//        list.add("Monster");
//        list.add("Vip bien hoa");
//        list.add("Guitar Solo");
//        list.add("Bip Na Dang");
//        list.add("Sony Z8");
        req.setAttribute("list", list);
        req.setAttribute("pagename", "Home");
        HttpSession session=req.getSession();
        req.setAttribute("sessionname", session.getAttribute("sessionname"));
        getServletContext().getRequestDispatcher("/home.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

}