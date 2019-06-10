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
          Customer c=customerFacade.find((int)session.getAttribute("sessionid"));
          List<Post> authorPost= postFacade.findByAuthor(c);
          long a=0;
          for(Post pe: authorPost){
              a+=likesFacade.totalUserisLiked(pe);
          }
          long b =postFacade.countTotalPostPerUser(c);
          System.out.println(b);
                  
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
