/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Product;
import entity.ProductType;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Asus
 */
@Stateless
public class ProductTypeFacade extends AbstractFacade<ProductType> implements ProductTypeFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductTypeFacade() {
        super(ProductType.class);
    }
    
    @Override
    public String getNameType(int id) {
         try {
            return em.find(ProductType.class, id).getTypeName();
        } catch (Exception e) {
            return null;
}
    }

    @Override
    public int getQuanType(ProductType Pt) {
        List<Product> lp = em.createQuery("SELECT p.productCollection FROM ProductType p WHERE p.typeID = :typeID")
                .setParameter("typeID", Pt.getTypeID())
                .getResultList();
        return lp.size();
    }
    

}
