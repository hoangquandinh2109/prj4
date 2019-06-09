/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Category;
import entity.Feature;
import entity.ImgStog;
import entity.Product;
import entity.ProductType;
import entity.Report;
import java.util.ArrayList;
import java.util.Date;
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
            return em.createQuery("SELECT p FROM Product p WHERE p.proName = :name AND p.proStatus = :proStatus")
                .setParameter("name", name)
                .setParameter("proStatus", true)
                .getResultList();
        } catch (Exception e) {
            return null;
        }
        
    }  
    
    @Override
    public Double getMaxPrice() {
        return (Double) em.createQuery("select max(p.proPrice) from Product p").getSingleResult();
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
    @Override
    public List<String> imagesOf(Product p){
        List<ImgStog> listImg =  (List<ImgStog>) em.createQuery("SELECT i FROM Product p INNER JOIN p.imgStogCollection i WHERE p.proID = :product")
                    .setParameter("product", p.getProID())
                    .getResultList();
        List<String> limgname = new ArrayList<>();
            for(ImgStog img : listImg){
                    limgname.add(img.getImgName());
                }
            return limgname;
    }
     @Override
    public List<Product> getProbyCat(int cat) {
        try {
            return em.createQuery("SELECT p FROM Product p WHERE p.catID.catID = :catID and p.proStatus = :proStatus")
                    .setParameter("catID", cat)
                    .setParameter("proStatus", true)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Product> getProbyFea(int feaID) {
        try {
            return em.createQuery("SELECT p FROM Product p WHERE p.featureID.featureID = :FeatureID and p.proStatus = :proStatus")
                    .setParameter("FeatureID", feaID)
                    .setParameter("proStatus", true)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    @Override
    public List<Product> ProductTruee() {
          try {
            return em.createQuery("SELECT f FROM Product f WHERE f.proStatus = :proStatus")
                    .setParameter("proStatus", true)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
        
    }
    
     @Override
    public List<Report> ProductReport(String proID, Date startDate, Date endDate) {
        Query q = em.createQuery("SELECT r FROM Report r WHERE r.proID = :pro and r.dateOrderPlaced >= :startDate and r.dateOrderPlaced <= :endDate");
        q.setParameter("pro", proID);
        q.setParameter("startDate", startDate);
        q.setParameter("endDate", endDate);
        return q.getResultList();
       
    }

   

    @Override
    public List<Product> top12New() {
         try {
            return em.createQuery("SELECT p FROM Feature f INNER JOIN f.productCollection p WHERE f.featureID = 1 AND p.proStatus = true")
                    .setMaxResults(12)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Object[]> getFeautureProduct() {
        try {
            return em.createQuery("SELECT p,f FROM Feature f INNER JOIN f.productCollection p WHERE p.proStatus = true AND f.statusFeature = true")
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    
    
    
    
}
