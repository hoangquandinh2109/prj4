/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Staff;
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
public class StaffFacade extends AbstractFacade<Staff> implements StaffFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StaffFacade() {
        super(Staff.class);
    }
    @Override
    public List<Staff> searchStaff(String name) {
        Query q = em.createQuery("SELECT s FROM Staff s WHERE s.staffName like :name");
        q.setParameter("name", "%"+name+"%");      
        return q.getResultList();
    }

    @Override
    public List<Staff> findByEmail(String email) {
        Query q = em.createQuery("SELECT s FROM Staff s WHERE s.staffEmail = :staffEmail");
        q.setParameter("staffEmail", email);      
        return q.getResultList();
    }

    @Override
    public List<Staff> findByID(int id) {
        Query q = em.createQuery("SELECT s FROM Staff s WHERE s.staffID = :staffID");
        q.setParameter("staffID", id);      
        return q.getResultList();
    }
}
