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
@WebServlet(name = "postIndex", urlPatterns = {"/postIndex"})
public class postIndex extends HttpServlet {
    @EJB
    private TbTagFacadeLocal tbTagFacade;
    @EJB
    private LikesFacadeLocal likesFacade;
    @EJB
    private PostFacadeLocal postFacade;
    @EJB
    private CustomerFacadeLocal customerFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
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
          List<TbTag> tag=tbTagFacade.findAll();
          request.setAttribute("tags", tag);
            request.getRequestDispatcher("postIndex.jsp").forward(request, response);
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
