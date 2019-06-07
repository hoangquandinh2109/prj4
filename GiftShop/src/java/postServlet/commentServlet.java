/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package postServlet;

import entity.Comment;
import entity.Customer;
import entity.Likes;
import entity.Post;
import entity.Reply;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
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

/**
 *
 * @author bemap
 */
@WebServlet(name = "commentServlet", urlPatterns = {"/commentServlet"})
public class commentServlet extends HttpServlet {
    @EJB
    private ReplyFacadeLocal replyFacade;

    @EJB
    private CustomerFacadeLocal customerFacade;

    @EJB
    private LikesFacadeLocal likesFacade;

    @EJB
    private PostFacadeLocal postFacade;
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

    @EJB
    private CommentFacadeLocal commentFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        int user = (int) session.getAttribute("sessionid");
        int post = Integer.parseInt(request.getParameter("postID"));
        Customer u = customerFacade.find(user);
        Post p = postFacade.find(post);
        JsonArrayBuilder jsonUserArray = Json.createArrayBuilder();
        switch (action) {
            case "hitLike":
                int likeID = Integer.parseInt(request.getParameter("likeID"));
                boolean likeStatus = Boolean.parseBoolean(request.getParameter("likeStatus"));
                if (!likeStatus && likeID == 0) {//tao khi chua co
                    Likes l = new Likes(true, p, u);
                    likesFacade.create(l);

                    String pCountLike = String.valueOf(likesFacade.countLike(p));
                    JsonObjectBuilder likeItem = Json.createObjectBuilder()
                            .add("likeStatus", true)
                            .add("countLikes", pCountLike)
                            .add("likeID", l.getLikeID());
                    jsonUserArray.add(likeItem);
                    JsonObject jsonFinalOutput = Json.createObjectBuilder().add("likeItem", jsonUserArray).build();
                    out.print(jsonFinalOutput);

                } else {// co roi nhung update thanh thich hoac ko thich
                    boolean check = true;
                    if (!likeStatus && likeID > 0) {//update thich thanh ko thich khi da co ID
                        System.out.println("VO DAY ");
                        Likes l = new Likes();
                        l.setLikeID(likeID);
                        l.setLikeStatus(true);

                        l.setPostLiked(p);
                        l.setCusID(u);
                        likesFacade.edit(l);
                        check = l.getLikeStatus();
                    } else {
                        System.out.println("HAY VO DAY");
                        Likes l = new Likes();
                        l.setLikeID(likeID);
                        l.setLikeStatus(false);
                        l.setPostLiked(p);
                        l.setCusID(u);
                        likesFacade.edit(l);
                        check = l.getLikeStatus();
                    }//up date ko thich thanh thich khi da co ID
                    System.out.println(check);
                    String pCountLike = String.valueOf(likesFacade.countLike(p));
                    JsonObjectBuilder likeItem = Json.createObjectBuilder()
                            .add("likeStatus", check)
                            .add("countLikes", pCountLike)
                            .add("likeID", likeID);
                    jsonUserArray.add(likeItem);
                    JsonObject jsonFinalOutput = Json.createObjectBuilder().add("likeItem", jsonUserArray).build();
                    out.print(jsonFinalOutput);
                }
                break;
           
            case "createComment":
                String data = request.getParameter("data");
                Date date = new Date(System.currentTimeMillis());
                Comment c = new Comment(data, date, p, u);
                DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                String dateCmt = dateFormat.format(date);
                commentFacade.create(c);
                //COUNT AREA//
                long ab = 0;
                List<Comment> cmt = commentFacade.listCommentByPostID(p);
                for (Comment ce : cmt) {
                    ab += GetReply(ce);
                }   //GET TOTAL post
                long a = commentFacade.countComment(p);
                long total = a + ab;
                String sTotal = String.valueOf(total);
                //----------------JSON AREA-----------------//
                JsonObjectBuilder list = Json.createObjectBuilder()
                        .add("postID", p.getPostID())
                        .add("userName", u.getCusName())
                        .add("avat", "AVT")
                        .add("dateTime", dateCmt)
                        .add("commentContent", data)
                        .add("sTotal", sTotal);
                jsonUserArray.add(list);
                javax.json.JsonObject jsonFinalOutput = Json.createObjectBuilder().add("commentItem", jsonUserArray).build();
                System.out.println(jsonFinalOutput);
                out.print(jsonFinalOutput);
                break;
            case "createReply":
                String replyContent = request.getParameter("data");
                int cmtID = Integer.parseInt(request.getParameter("cmtID"));
                Comment rc = commentFacade.find(cmtID);
                Date dateDB = new Date(System.currentTimeMillis());
                Reply r = new Reply(replyContent, dateDB, rc, u);
                DateFormat dateFormatRep = new SimpleDateFormat("dd-MM-yyyy");
                String dateRep = dateFormatRep.format(dateDB);
                replyFacade.create(r);
                //COUNT AREA//
                String subTotal = CountTotal(p);
                //----------------JSON AREA-----------------//
                JsonObjectBuilder listRep = Json.createObjectBuilder()
                        .add("postID", p.getPostID())
                        .add("userName", u.getCusName())
                        .add("avat", "AVT")
                        .add("dateTime", dateRep)
                        .add("replyContent", replyContent)
                        .add("sTotal", subTotal);
                jsonUserArray.add(listRep);
                javax.json.JsonObject jsonFinalOutputRep = Json.createObjectBuilder().add("replyItem", jsonUserArray).build();
                out.print(jsonFinalOutputRep);
                break;
        }
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

    public String CountTotal(Post p) {
        long ab = 0;
        List<Comment> cmt = commentFacade.listCommentByPostID(p);
        for (Comment ce : cmt) {
            ab += GetReply(ce);
        }   //GET TOTAL post
        long a = commentFacade.countComment(p);
        long total = a + ab;
        String sTotal = String.valueOf(total);
        return sTotal;
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