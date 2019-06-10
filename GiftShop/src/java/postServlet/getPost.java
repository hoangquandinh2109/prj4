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
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import javax.servlet.http.HttpSession;
import models.CommentFacadeLocal;
import models.CustomerFacadeLocal;
import models.LikesFacadeLocal;
import models.PostFacadeLocal;
import org.joda.time.DateTime;
import org.joda.time.Days;

/**
 *
 * @author bemap
 */
@WebServlet(name = "getPost", urlPatterns = {"/getPost"})
public class getPost extends HttpServlet {

    @EJB
    private CustomerFacadeLocal customerFacade;
    @EJB
    private CommentFacadeLocal commentFacade;
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
        JsonArrayBuilder jsonUserArray = Json.createArrayBuilder();
        JsonObjectBuilder list = Json.createObjectBuilder();
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        String data = request.getParameter("data");
        System.out.println(data);
        System.out.println(action);
        HttpSession session = request.getSession();
        int cID;
        long ab;
        long total;
        long totalCommentAfterRm;
        //count total Like
        long totalLike;

        List<Post> postList = new ArrayList<>();
        if (action.equals("showAll")) {
            postList = postFacade.findAll();
        } else if (action.equals("SearchByTag")) {
            postList = postFacade.searchByTag(data);
            if (postList.isEmpty()) {
                list.add("status", false);
                jsonUserArray.add(list);
                javax.json.JsonObject jsonFinalOutput = Json.createObjectBuilder().add("POST", jsonUserArray).build();
                out.print(jsonFinalOutput);

                return;
            }

        } else if (action.equals("SearchByTitle")) {
            postList = postFacade.searchByTitle(data);
            if (postList.isEmpty()) {
                list.add("status", false);
                jsonUserArray.add(list);
                javax.json.JsonObject jsonFinalOutput = Json.createObjectBuilder().add("POST", jsonUserArray).build();
                out.print(jsonFinalOutput);
                return;
            }

        } else if (action.equals("SearchByContent")) {
            postList = postFacade.searchByContent(data);
           
            if (postList.isEmpty()) {
                list.add("status", false);
                jsonUserArray.add(list);
                javax.json.JsonObject jsonFinalOutput = Json.createObjectBuilder().add("POST", jsonUserArray).build();
                out.print(jsonFinalOutput);
                System.out.println(jsonFinalOutput);
                return;
            }

        } else if (action.equals("Liked")) {
            cID = (int) (session.getAttribute("sessionid"));
            List<Likes> gg = new ArrayList<>();
            Customer cus = customerFacade.find(cID);
            List<Likes> listLiked = likesFacade.LikedPosts(cus);

            for (Likes like : listLiked) {
                Post p = postFacade.find(like.getPostLiked().getPostID());
                ab = 0;
                total = 0;
                List<Comment> cmtAfter = commentFacade.listCommentByPostID(p);
                for (Comment ce : cmtAfter) {
                    ab += GetReply(ce);
                }   //GET TOTAL comment post
                // long after = commentFacade.countComment(p);
                totalCommentAfterRm = commentFacade.countComment(p);
                //count total Like
                totalLike = likesFacade.countLike(p);
                ///
                 
                total = totalCommentAfterRm + ab;
                String sTotal = String.valueOf(total);
                DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                DateFormat beforFormat = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
                String postRele = dateFormat.format(like.getPostLiked().getDateRealease());
                String before = beforFormat.format(like.getPostLiked().getDateRealease());
                list.add("postID", like.getPostLiked().getPostID())
                        .add("postTitle", like.getPostLiked().getTitlePost())
                        .add("postContent", like.getPostLiked().getInfontContent())
                        .add("dateTime", postRele)
                        .add("tag", like.getPostLiked().getPostTag())
                        .add("userName", like.getPostLiked().getCusID().getCusName())
                        .add("status", like.getPostLiked().getPostStatus())
                        .add("postTag", like.getPostLiked().getPostTag())
                        .add("beforFormatTime", before)
                        .add("sTotal", sTotal).add("totalLike", totalLike);
                jsonUserArray.add(list);
            }
            javax.json.JsonObject jsonFinalOutput = Json.createObjectBuilder().add("POSTLiked", jsonUserArray).build();
            out.print(jsonFinalOutput);
            
            return;
            //lay 1 list nhung post da dc like

        }

        for (Post b : postList) {

            Post p = postFacade.find(b.getPostID());
            ab = 0;
            total = 0;
            List<Comment> cmtAfter = commentFacade.listCommentByPostID(p);
            for (Comment ce : cmtAfter) {
                ab += GetReply(ce);
            }   //GET TOTAL comment post
            // long after = commentFacade.countComment(p);
            totalCommentAfterRm = commentFacade.countComment(p);
            //count total Like
            totalLike = likesFacade.countLike(p);
            ///
          
            total = totalCommentAfterRm + ab;
            String sTotal = String.valueOf(total);
            //  Date date = Calendar.getInstance().getTime();
            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            DateFormat beforFormat = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
            String postRele = dateFormat.format(b.getDateRealease());
            String before = beforFormat.format(b.getDateRealease());

            list.add("postID", b.getPostID())
                    .add("postTitle", b.getTitlePost())
                    .add("postContent", b.getInfontContent())
                    .add("dateTime", postRele)
                    .add("tag", b.getPostTag())
                    .add("userName", b.getCusID().getCusName())
                    .add("status", b.getPostStatus())
                    .add("postTag", b.getPostTag())
                    .add("beforFormatTime", before)
                    .add("sTotal", sTotal)
                    .add("totalLike", totalLike);
            jsonUserArray.add(list);

        }
        javax.json.JsonObject jsonFinalOutput = Json.createObjectBuilder().add("POST", jsonUserArray).build();
        out.print(jsonFinalOutput);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        String getCT = request.getParameter("data");
       
        Gson g = new Gson();
        Post p = new Post("blabla", getCT, getCT);
        postFacade.create(p);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(g.toJson(getCT));
    }

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
