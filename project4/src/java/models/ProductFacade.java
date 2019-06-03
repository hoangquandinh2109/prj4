/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Category;
import entity.ImgStog;
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

    @Override
    public List<Product> filtCategoryProductByPrice(Category category, int from, int to) {
        try {
            return em.createQuery("SELECT p FROM Product p WHERE p.catID = :catID AND p.proStatus = :proStatus AND p.proPrice >= :from AND p.proPrice <= :to")
                .setParameter("catID", category)
                .setParameter("from", from)
                .setParameter("to", to)
                .setParameter("proStatus", true)
                .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    
    @Override
    public List<Product> filtTypeProductByPrice(ProductType producttype, int from, int to) {
        try {
            return em.createQuery("SELECT p FROM Product p WHERE p.typeID = :typeID AND p.proStatus = :proStatus AND p.proPrice >= :from AND p.proPrice <= :to")
                .setParameter("typeID", producttype)
                .setParameter("from", from)
                .setParameter("to", to)
                .setParameter("proStatus", true)
                .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    
    @Override
    public List<Product> searchByName(String name){
        try {
            return em.createQuery("SELECT p FROM Product p WHERE p.proName = :name")
                .setParameter("name", name)
                .setParameter("proStatus", true)
                .getResultList();
        } catch (Exception e) {
            return null;
        }
        
    }  
    
    @Override
    public int getMaxPrice() {
        return (int) em.createQuery("select max(p.proPrice) from Product p").getSingleResult();
    }

    @Override
    public String imageOf(Product p) {
        
         List<ImgStog> listImg =  (List<ImgStog>) em.createQuery("SELECT i FROM Product p INNER JOIN p.imgStogCollection i WHERE p.proID = :product")
                    .setParameter("product", p.getProID())
                    .getResultList();
            for(ImgStog img : listImg){
                if(img.getThumbnail()!=null && img.getThumbnail()){
                    return img.getImgName();
                }
            }
            return null;
    }
    
}
