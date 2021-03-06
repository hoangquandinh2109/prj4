/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package postServlet;

import entity.Customer;
import entity.Post;
import entity.TbTag;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.CustomerFacadeLocal;
import models.LikesFacadeLocal;
import models.PostFacadeLocal;
import models.TbTagFacadeLocal;

/**
 *
 * @author bemap
 */
@WebServlet(name = "searchForwardPage", urlPatterns = {"/searchForwardPage"})
public class searchForwardPage extends HttpServlet {
    @EJB
    private CustomerFacadeLocal customerFacade;
    @EJB
    private PostFacadeLocal postFacade;
    @EJB
    private LikesFacadeLocal likesFacade;
    @EJB
    private TbTagFacadeLocal tbTagFacade;
  

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
          List<TbTag> t= tbTagFacade.findAll();
          Post p=postFacade.find(1);
          List<Post> findByTag= new ArrayList<>();
        //  Customer c=customerFacade.find((int)session.getAttribute("sessionid"));
          String tagData=request.getParameter("data");
          if(tagData!=null){
              System.out.println("hahaha");
              findByTag=postFacade.searchByTag(tagData);
              System.out.println(findByTag);
              request.setAttribute("tagData", findByTag);
          }
          String name=(String)session.getAttribute("sessionname");
          if(name!=null){
              int id=(int) session.getAttribute("sessionid");
              Customer cusLogged=customerFacade.find(id);
                long totalLikedPAllpost =0;
              List<Post> fPost=postFacade.findByAuthor(cusLogged);
              for(Post pe:fPost){
                  totalLikedPAllpost+=likesFacade.countLike(pe);
              }
           
            
                          /////////////
           
            //FIND TOTAL POST USER POST!
              //List<Post> postTotal=postFacade.findByAuthor(p.getCusID());
            int tPost=  fPost.size();
          request.setAttribute("like", totalLikedPAllpost);
          request.setAttribute("post", tPost);
          }
        request.setAttribute("tags", t);
        request.getRequestDispatcher("searchPage.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
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
