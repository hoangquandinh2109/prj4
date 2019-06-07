/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package postServlet;

import com.google.gson.Gson;
import entity.Post;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.PostFacadeLocal;

/**
 *
 * @author bemap
 */
@WebServlet(name = "getPost", urlPatterns = {"/getPost"})
public class getPost extends HttpServlet {
    @EJB
    private PostFacadeLocal postFacade;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        //  response.setCharacterEncoding("UTF-8");
        JsonArrayBuilder jsonUserArray = Json.createArrayBuilder();
        JsonObjectBuilder list = Json.createObjectBuilder();
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        String data = request.getParameter("data");
        //   action="searchByTitle";
        //  data="O";
        System.out.println(action);
        List<Post> postList = new ArrayList<>();
        if (action.equals("showAll")) {
            postList = postFacade.findAll();
        } 
        else if (action.equals("searchByTag")) {
            postList = postFacade.searchByTag(data);
            System.out.println("hihi");
            if (postList.isEmpty()) {
                list.add("status", false);
                jsonUserArray.add(list);
                javax.json.JsonObject jsonFinalOutput = Json.createObjectBuilder().add("POST", jsonUserArray).build();
                out.print(jsonFinalOutput);
                
                return;
            }
            
        }
        else if (action.equals("searchByTitle")) {
            postList = postFacade.searchByTitle(data);
            System.out.println(postList);
            if (postList.isEmpty()) {
                list.add("status", false);
                jsonUserArray.add(list);
                javax.json.JsonObject jsonFinalOutput = Json.createObjectBuilder().add("POST", jsonUserArray).build();
                out.print(jsonFinalOutput);
                return;
            }
            
        }
        else if (action.equals("searchByContent")) {
            postList = postFacade.searchByContent(data);
            if (postList.isEmpty()) {
                list.add("status", false);
                jsonUserArray.add(list);
                javax.json.JsonObject jsonFinalOutput = Json.createObjectBuilder().add("POST", jsonUserArray).build();
                out.print(jsonFinalOutput);
                return;
            }
            
        }
        
        for (Post b : postList) {
            //  Date date = Calendar.getInstance().getTime();
            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            String postRele = dateFormat.format(b.getDateRealease());
       //    String[]a= b.getPostTag().split(";");
           
          
            list.add("postID", b.getPostID())
                    .add("postTitle", b.getTitlePost())
                    .add("postContent", b.getInfontContent())
                    .add("dateTime", postRele)
                    .add("tag", b.getPostTag())
                    .add("userName", b.getCusID().getCusName())
                    .add("status", true)
                    .add("postTag",b.getPostTag());
            jsonUserArray.add(list);
            
        }
        javax.json.JsonObject jsonFinalOutput = Json.createObjectBuilder().add("POST", jsonUserArray).build();
           // request.setAttribute("date", "DATE NE");
        //   String action =request.getParameter("action");
        out.print(jsonFinalOutput);
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        String getCT = request.getParameter("data");
        System.out.println(getCT);
        Gson g = new Gson();
        
        Post p = new Post("blabla", getCT, getCT);
        postFacade.create(p);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(g.toJson(getCT));
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
