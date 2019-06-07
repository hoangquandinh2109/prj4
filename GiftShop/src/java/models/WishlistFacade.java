/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Customer;
import entity.Wishlist;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Asus
 */
@Stateless
public class WishlistFacade extends AbstractFacade<Wishlist> implements WishlistFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public WishlistFacade() {
        super(Wishlist.class);
    }
    @Override
    public List<Wishlist> getWishlistOfMe(Customer me) {
        return em.createQuery("SELECT w FROM Wishlist w WHERE w.cusID = :me ORDER BY w.wishlistID DESC")
                .setParameter("me", me)
                .getResultList();
    }
}
