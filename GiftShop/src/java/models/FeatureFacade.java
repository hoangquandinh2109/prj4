/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entity.Feature;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Asus
 */
@Stateless
public class FeatureFacade extends AbstractFacade<Feature> implements FeatureFacadeLocal {

    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public FeatureFacade() {
        super(Feature.class);
    }

    @Override
    public List<Feature> FindFeaStatus() {
        try {
            return em.createQuery("SELECT f FROM Feature f WHERE f.statusFeature = :statusFeature")
                    .setParameter("statusFeature", true)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }

    }
}
