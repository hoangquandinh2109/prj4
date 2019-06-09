/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package postServlet;

import entity.Customer;
import entity.Post;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.CommentFacadeLocal;
import models.CustomerFacadeLocal;
import models.PostFacadeLocal;

/**
 *
 * @author bemap
 */
@WebServlet(name = "createPostServlet", urlPatterns = {"/createPostServlet"})
public class createPostServlet extends HttpServlet {

    @EJB
    private CustomerFacadeLocal customerFacade;
    @EJB
    private CommentFacadeLocal commentFacade;

    @EJB
    private PostFacadeLocal postFacade;

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
        Date date = new Date(System.currentTimeMillis());
        //   System.out.println(date);
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
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        int postID = Integer.parseInt(request.getParameter("postID"));
        String title = request.getParameter("title");
        String tag = request.getParameter("tag");
        String content = request.getParameter("content");
        String infor = request.getParameter("infor");
        Date date = new Date(System.currentTimeMillis());
        JsonArrayBuilder jsonUserArray = Json.createArrayBuilder();
        if (action.equals("create")) {
            try {
                Customer u = customerFacade.find(1);
                Post p = new Post(title, infor, content, date, tag, u);
                postFacade.create(p);

            } catch (ParseException ex) {
                Logger.getLogger(createPostServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("update")) {
             Post edPost = postFacade.find(postID);
            if(tag.equals("")){
                edPost.setPostTag(edPost.getPostTag());
            }
            else{
                  edPost.setPostTag(tag);
            }
            edPost.setTitleContent(content);
            edPost.setTitlePost(title);
            edPost.setInfontContent(infor);
            edPost.setDateRealease(date);
            postFacade.edit(edPost);
        } else {
            Post rmPost = postFacade.find(postID);
           rmPost.setPostStatus(false);
           postFacade.edit(rmPost);
        }
        JsonObjectBuilder sRes = Json.createObjectBuilder()
                .add("status", true);
        jsonUserArray.add(sRes);
        JsonObject jsonFinalOutput = Json.createObjectBuilder().add("statusRes", jsonUserArray).build();
        out.print(jsonFinalOutput);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
