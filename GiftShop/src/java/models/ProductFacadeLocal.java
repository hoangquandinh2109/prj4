/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Category;
import entity.Product;
import entity.ProductType;
import entity.Report;
import java.util.Date;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Asus
 */
@Local
public interface ProductFacadeLocal {

    void create(Product product);

    void edit(Product product);

    void remove(Product product);

    Product find(Object id);

    List<Product> findAll();

    List<Product> findRange(int[] range);

    int count();

    List<Product> getProductByType(ProductType productType);

    List<Product> getProductByCategory(Category category);

    Product getSingleProduct(String id);

    List<Product> filtCategoryProductByPrice(Category category, int from, int to);

    List<Product> filtTypeProductByPrice(ProductType type, int from, int to);

    List<Product> searchByName(String name);

    Double getMaxPrice();

    String imageOf(Product p);

    List<String> imagesOf(Product p);

    List<Product> getProbyCat(int cat);

    List<Product> getProbyFea(int feaID);
    
    List<Product> ProductTruee();
    
    List<Report> ProductReport(String proID, Date startDate, Date endDate);

    List<Product> top12New();

    List<Object[]> getFeautureProduct();
    
}
