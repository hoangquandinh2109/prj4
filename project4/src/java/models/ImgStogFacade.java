/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.ImgStog;
import entity.Product;
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
public class ImgStogFacade extends AbstractFacade<ImgStog> implements ImgStogFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ImgStogFacade() {
        super(ImgStog.class);
    }

    @Override
    public List<ImgStog> findList(Product proID) {
        Query q = em.createQuery("SELECT i FROM ImgStog i WHERE i.proID = :proID ");
         q.setParameter("proID", proID);
        return q.getResultList();
    }
    
}
