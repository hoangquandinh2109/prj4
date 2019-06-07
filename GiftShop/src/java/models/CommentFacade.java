/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Comment;
import entity.Post;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author bemap
 */
@Stateless
public class CommentFacade extends AbstractFacade<Comment> implements CommentFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CommentFacade() {
        super(Comment.class);
    }
        @Override
    public List<Comment> listCommentByPostID(Post p) {
       Query q=em.createQuery("SELECT c FROM Comment c WHERE c.postID = :postID");
       q.setParameter("postID", p);
       return q.getResultList();
    }

    @Override
    public long countComment(Post p) {
        Query q=em.createQuery("SELECT count(c) FROM Comment c WHERE c.postID = :postID");
        q.setParameter("postID", p);
        return (long) q.getSingleResult();
    }
}