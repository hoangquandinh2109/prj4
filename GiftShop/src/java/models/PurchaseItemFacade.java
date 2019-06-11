/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Customer;
import entity.Product;
import entity.Purchase;
import entity.PurchaseItem;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Asus
 */
@Stateless
public class PurchaseItemFacade extends AbstractFacade<PurchaseItem> implements PurchaseItemFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PurchaseItemFacade() {
        super(PurchaseItem.class);
    }

    @Override
    public List<PurchaseItem> purItemByPur(String purchaseID) {
        Query q = getEntityManager().createQuery("SELECT p FROM PurchaseItem p WHERE p.purID.purID = :purID");
        q.setParameter("purID", purchaseID);
        return q.getResultList();
    }
    
    @Override
    public List<PurchaseItem> ItemofMe(Purchase purID) {
        return em.createQuery("SELECT p FROM PurchaseItem p WHERE p.purID = :purID")
                .setParameter("purID", purID)
                .getResultList();
    }

    @Override
    public List<Product> getAllPurchaseItemOfMe(Customer me) {
        return em.createQuery("SELECT pi.proID FROM Purchase p INNER JOIN p.purchaseItemCollection pi WHERE p.cusID = :me ORDER BY p.purID DESC")
                .setParameter("me", me)
                .getResultList();
    }
    
    
}
