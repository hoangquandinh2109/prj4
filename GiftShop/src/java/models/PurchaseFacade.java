/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Customer;
import entity.Product;
import entity.Purchase;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Asus
 */
@Stateless
public class PurchaseFacade extends AbstractFacade<Purchase> implements PurchaseFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PurchaseFacade() {
        super(Purchase.class);
    }
    
    @Override
    public String getLastPurchaseID() {
        try{
            List<Purchase> list = em.createQuery("SELECT p FROM Purchase p ORDER BY p.purID DESC").getResultList();
            return list.get(0).getPurID();
}
        catch(Exception e){
            return null;
        }
        
    }

    @Override
    public List<Purchase> orderofme(Customer me) {
        return em.createQuery("SELECT p FROM Purchase p WHERE p.cusID = :cusID ORDER BY p.dateOrderPlaced DESC")
                .setParameter("cusID", me)
                .getResultList();
    }
    @Override
    public List<Product> top4productordered(Customer me) {
        return em.createQuery("SELECT p2.proID FROM Purchase p INNER JOIN p.purchaseItemCollection p2 WHERE p.cusID = :cusID")
                .setMaxResults(4)
                .setParameter("cusID", me)
                .getResultList();
    }
    
}
