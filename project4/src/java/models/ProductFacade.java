/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Category;
import entity.Product;
import entity.ProductType;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author johnn
 */
@Stateless
public class ProductFacade extends AbstractFacade<Product> implements ProductFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductFacade() {
        super(Product.class);
    }

    @Override
    public List<Product> getProductByType(ProductType productType) {
        try {
            return em.createQuery("SELECT p FROM Product p WHERE p.typeID = :typeID AND p.proStatus = :proStatus")
                .setParameter("typeID", productType)
                .setParameter("proStatus", true)
                .getResultList();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Product> getProductByCategory(Category category) {
        try {
            return em.createQuery("SELECT p FROM Product p WHERE p.catID = :catID AND p.proStatus = :proStatus")
                .setParameter("catID", category)
                .setParameter("proStatus", true)
                .getResultList();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Product getSingleProduct(String id) {
        try {
            return em.find(Product.class, id);
        } catch (Exception e) {
            return null;
        }
    }
    
    
}
