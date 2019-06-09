/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Comment;
import entity.Post;
import entity.Reply;
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
public class ReplyFacade extends AbstractFacade<Reply> implements ReplyFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ReplyFacade() {
        super(Reply.class);
    }
       @Override
    public List<Reply> removeReplies(Comment c) {
        Query q =em.createQuery("SELECT r FROM Reply r WHERE r.commentID = :commentID");
        q.setParameter("commentID", c);
        return  q.getResultList();
    }
}
