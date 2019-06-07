/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.TbnotifyPost;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author bemap
 */
@Stateless
public class TbnotifyPostFacade extends AbstractFacade<TbnotifyPost> implements TbnotifyPostFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TbnotifyPostFacade() {
        super(TbnotifyPost.class);
    }
    
}
