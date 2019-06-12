/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package postServlet;

import entity.Comment;
import entity.Customer;
import entity.Post;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObjectBuilder;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.CommentFacadeLocal;
import models.CustomerFacadeLocal;
import models.LikesFacadeLocal;
import models.PostFacadeLocal;

/**
 *
 * @author bemap
 */
@WebServlet(name = "countRuntime", urlPatterns = {"/countRuntime"})
public class countRuntime extends HttpServlet {
    @EJB
    private CommentFacadeLocal commentFacade;
    @EJB
    private CustomerFacadeLocal customerFacade;
    @EJB
    private LikesFacadeLocal likesFacade;
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;
    @EJB
    private PostFacadeLocal postFacade;

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        int id= Integer.parseInt(request.getParameter("id"));
        Customer c=customerFacade.find(id);
      List<Post> p =postFacade.findByAuthor(c);
      List like=new ArrayList();
       List comment=new ArrayList();
       long totalLikedPAllpost =0;
              List<Post> fPost=postFacade.findByAuthor(c);
              for(Post pe:fPost){
                  totalLikedPAllpost+=likesFacade.countLike(pe);
              }
           
            
                          /////////////
           
            //FIND TOTAL POST USER POST!
              //List<Post> postTotal=postFacade.findByAuthor(p.getCusID());
            int tPost=  fPost.size();
      
      request.setAttribute("totalComment", tPost);
            request.setAttribute("totalLike", totalLikedPAllpost);
      request.setAttribute("p", p);
      request.setAttribute("c", c);
      request.getRequestDispatcher("detailsPostUser.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

   public long GetReply(Comment c) {
        Query q = em.createQuery("SELECT count(r) FROM Reply r WHERE r.commentID = :commentID");
        q.setParameter("commentID", c);

        return (long) q.getSingleResult();
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void persist(Object object) {
        try {
            utx.begin();
            em.persist(object);
            utx.commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
    }

}
