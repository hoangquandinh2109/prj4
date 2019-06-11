/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Customer;
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
public class PostFacade extends AbstractFacade<Post> implements PostFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PostFacade() {
        super(Post.class);
    }
      @Override
    public List<Post> searchByTag(String tag) {
        Query q= em.createQuery("SELECT p FROM Post p WHERE p.postTag like :postTag").setParameter("postTag", "%"+tag+"%");
        
        return q.getResultList();
    }

    @Override
    public List<Post> searchByTitle(String title) {
       Query q= em.createQuery("SELECT p FROM Post p WHERE p.titlePost like :titlePost").setParameter("titlePost", '%'+title+'%');
        return q.getResultList();
    }

    @Override
    public List<Post> searchByContent(String content) {
        Query q= em.createQuery("SELECT p FROM Post p WHERE p.infontContent like :infontContent").setParameter("infontContent", '%'+content+'%');
        
        return q.getResultList();
    }
    @Override
    public List<Post> findByAuthor(Customer c){
        Query q= em.createQuery("SELECT p FROM Post p WHERE p.cusID = :cusID and p.postStatus = :pStatus").setParameter("cusID", c).setParameter("pStatus", true);
        
        return q.getResultList();
    }

    @Override
    public long countTotalPostPerUser(Customer c) {
         Query q= em.createQuery("SELECT count(p) FROM Post p WHERE p.cusID = :cusID and p.postStatus = :pStatus").setParameter("cusID", c).setParameter("pStatus", true);
         
        return (long)q.getSingleResult();
    }
    

    
}
