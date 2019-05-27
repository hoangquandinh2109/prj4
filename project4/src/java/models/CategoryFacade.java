/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Category;
import entity.ProductType;
import java.util.ArrayList;
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
public class CategoryFacade extends AbstractFacade<Category> implements CategoryFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CategoryFacade() {
        super(Category.class);
    }

    @Override
    public List<Category> showCategory() {
       List<Category> list = new ArrayList<>();
        Query q = em.createNamedQuery("select DISTINCT catName from category");
        list =q.getResultList();
        return list;
    }

    @Override
    public String getCategoryName(int id) {
        
        try {
            return em.find(Category.class, id).getCatName();
        } catch (Exception e) {
            return null;
        }
    }
    
}
