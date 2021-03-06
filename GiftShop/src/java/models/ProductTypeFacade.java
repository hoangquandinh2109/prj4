/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Category;
import entity.Feature;
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
        List<Product> lp = em.createQuery("SELECT p FROM Product p WHERE p.typeID = :typeID")
                .setParameter("typeID", Pt)
                .getResultList();
        if(lp == null){
            return 0;
        }
        return lp.size();
    }
    @Override
    public List<ProductType> FindTypeStatus() {
        try {
            return em.createQuery("SELECT p FROM ProductType p WHERE p.statusType = :statusType")
                    .setParameter("statusType", true)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }

    }

    @Override
    public List<ProductType> FilterByCate(Category cate) {
        List<ProductType> lp = em.createQuery("SELECT p FROM ProductType p WHERE p.catID = :cateID")
                .setParameter("cateID", cate)
                .getResultList();
        return lp;
    }

}
