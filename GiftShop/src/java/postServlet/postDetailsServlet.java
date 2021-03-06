/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package postServlet;

import com.google.gson.Gson;
import entity.Comment;
import entity.Customer;
import entity.Likes;
import entity.Post;
import entity.Reply;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.CommentFacadeLocal;
import models.CustomerFacadeLocal;
import models.LikesFacadeLocal;
import models.PostFacadeLocal;
import models.ReplyFacadeLocal;
import models.TbTagFacadeLocal;

/**
 *
 * @author bemap
 */
@WebServlet(name = "postDetailsServlet", urlPatterns = {"/postDetailsServlet"})
public class postDetailsServlet extends HttpServlet {

    @EJB
    private TbTagFacadeLocal tbTagFacade;
    @EJB
    private CustomerFacadeLocal customerFacade;

    @EJB
    private LikesFacadeLocal likesFacade;
    @EJB
    private ReplyFacadeLocal replyFacade;
    @EJB
    private CommentFacadeLocal commentFacade;
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

    @EJB
    private PostFacadeLocal postFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        response.setCharacterEncoding("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        List<String> any = new ArrayList<String>();
        Gson g = new Gson();
        boolean check =false;
        int getLikeID=0;
        String pid = request.getParameter("pid");
        String cusName = (String) session.getAttribute("sessionname");
        
        if (pid.equals("getPost")) {
            System.out.println("ko co gi");
        }
        else{
            Post p = postFacade.find(Integer.parseInt(pid));
             List<Post> post = postFacade.findAll();
                List<Reply> reply=replyFacade.findAll();
                //// check////
              if(cusName!=null){
                  int cusID=(int) session.getAttribute("sessionid");
                Customer c = customerFacade.find(cusID);//get user LOGGED
                check=likesFacade.checkLike(p, c);
                  getLikeID =likesFacade.findByPostID(p,c);
                  
               if(getLikeID==0){
                   getLikeID=0;
               };
            }
           //FIND TOTAL USER IS LIKED
              long totalLikedPAllpost =0;
              List<Post> fPost=postFacade.findByAuthor(p.getCusID());
              for(Post pe:fPost){
                  totalLikedPAllpost+=likesFacade.countLike(pe);
              }
           
            
                          /////////////
           
            //FIND TOTAL POST USER POST!
              //List<Post> postTotal=postFacade.findByAuthor(p.getCusID());
            int tPost=  fPost.size();
           //////////////////
            long totalLike =likesFacade.countLike(p);
            long ab=0;
            List<Comment> cmt=  commentFacade.listCommentByPostID(p);
            for(Comment co:cmt){
                co.getDateComment();
               ab+=GetReply(co);
            }
            //Find Same Author
            Customer postCus=customerFacade.find(p.getCusID().getCusID());
            List<Post> authorPost =postFacade.findByAuthor(postCus);
               
            //GET TAG
            String tagList[]=p.getPostTag().split(";");
            for(int i=0;i<tagList.length;i++){
               any.add(tagList[i]);
            }
              //GET TOTAL Comment
            long a =commentFacade.countComment(p);
            long totalComment=a+ab;
                //GET DATE COMMENT
           //   DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
           // DateFormat beforFormat = new SimpleDateFormat("MM-dd-yyyy hh:mm:ss");
          //  String postRele = dateFormat.format(cmt.get());
          //  String before=beforFormat.format(b.getDateRealease());
            /*----------------JSP TAG HERE-----------------*/
        //    request.setAttribute("cus", c);
            request.setAttribute("totalPost", tPost);
            request.setAttribute("totalLikedAllpost", totalLikedPAllpost);
            request.setAttribute("likeID", getLikeID);
            request.setAttribute("checkLike", check);
            request.setAttribute("totalComment", totalComment);
            request.setAttribute("totalLike", totalLike);
            request.setAttribute("rep", reply);
            request.setAttribute("p", p);
            request.setAttribute("cmt", cmt);
            request.setAttribute("list", post);
            request.setAttribute("tags", tbTagFacade.findAll());
            request.setAttribute("authorPost", authorPost);
            request.setAttribute("content", g.toJson(p.getTitleContent()));
        //    out.print("cc");
            request.getRequestDispatcher("/postDetails.jsp").forward(request, response);
              
            }

         //  out.print(vip);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
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

    public long GetReply(Comment c) {
        Query q = em.createQuery("SELECT count(r) FROM Reply r WHERE r.commentID = :commentID");
        q.setParameter("commentID", c);

        return (long) q.getSingleResult();
    }

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
