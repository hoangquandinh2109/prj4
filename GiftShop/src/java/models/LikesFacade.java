/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Customer;
import entity.Likes;
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
public class LikesFacade extends AbstractFacade<Likes> implements LikesFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public LikesFacade() {
        super(Likes.class);
    }
    @Override
    public long countLike(Post p) {
        Query q =em.createQuery("SELECT count(l) FROM Likes l WHERE l.postLiked = :postLiked and l.likeStatus = :checkStatus");
        q.setParameter("postLiked", p);
        q.setParameter("checkStatus", true);
        return  (long)  q.getSingleResult();
    }
     @Override
    public int findByPostID(Post p, Customer c) {
        Query q =em.createQuery("SELECT l FROM Likes l WHERE l.postLiked = :postLiked and l.cusID = :cusLike");
        q.setParameter("postLiked", p);
        q.setParameter("cusLike", c);
        List<Likes> l =q.getResultList();
         
         if(l.isEmpty()){
           //  System.out.println("hihi" +l);
             return 0;
         }
         else{  
            //    System.out.println(l.get(0).getLikeID());
                  return  l.get(0).getLikeID();
                 }
       
    }
  
    @Override
    public boolean checkLike(Post p, Customer c) {
          Query q =em.createQuery("SELECT count(l) FROM Likes l WHERE l.postLiked = :postLiked and l.cusID = :cusLike and l.likeStatus = :likeSt");
          q.setParameter("postLiked", p);
          q.setParameter("cusLike", c);
          q.setParameter("likeSt", true);
          if(q.getResultList().get(0).toString().equals("0")){
              return false;
          }
          else{
              return true;
          }
    }

    @Override
    public List<Likes> LikedPost(Customer c) {
         Query q =em.createQuery("SELECT count(l) FROM Likes l WHERE l.cusID = :cusLike and l.likeStatus = :likeSt");
          q.setParameter("cusLike", c);
          q.setParameter("likeSt", true);
          
        return q.getResultList();
    }

    @Override
    public List<Likes> LikedPosts(Customer c) {
          Query q =em.createQuery("SELECT count(l) FROM Likes l WHERE l.cusID = :cusLike and l.likeStatus = :likeSt");
          q.setParameter("cusLike", c);
          q.setParameter("likeSt", true);
          
        return q.getResultList();
    }
    
    
    
}