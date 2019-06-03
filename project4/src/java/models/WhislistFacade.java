/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Customer;
import entity.Product;
import entity.Whislist;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author johnn
 */
@Stateless
public class WhislistFacade extends AbstractFacade<Whislist> implements WhislistFacadeLocal{
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public WhislistFacade() {
        super(Whislist.class);
    }

    @Override
    public List<Whislist> getWishtlistOfMe(Customer me) {
        return em.createQuery("SELECT w FROM Whislist w WHERE w.cusID = :me")
                .setParameter("me", me)
                .getResultList();
    }
    

}
