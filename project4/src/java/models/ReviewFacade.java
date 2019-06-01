/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Customer;
import entity.Product;
import entity.Review;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author johnn
 */
@Stateless
public class ReviewFacade extends AbstractFacade<Review> implements ReviewFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ReviewFacade() {
        super(Review.class);
    }
    @Override
    public boolean checkIfCusRatingThis(Customer cusID, Product proID){
        try {
           Review abc = (Review) em.createQuery("SELECT r FROM Review r WHERE r.cusID = :cusID AND r.proID = :proID")
                .setParameter("cusID", cusID)
                .setParameter("proID", proID)
                .getSingleResult(); 
            System.out.println(abc.getReviewTitle());
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
}
