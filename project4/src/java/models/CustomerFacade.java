/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Customer;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TemporalType;
import javax.ws.rs.NotFoundException;

/**
 *
 * @author Asus
 */
@Stateless
public class CustomerFacade extends AbstractFacade<Customer> implements CustomerFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;
    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CustomerFacade() {
        super(Customer.class);
    }

    @Override
    public Customer login(String email, String password) {
        try {
           return (Customer) em.createQuery("SELECT c FROM Customer c WHERE c.cusPassword = :pass AND c.cusEmail = :email")
                .setParameter("email", email)
                .setParameter("pass", password)
                .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
        
    
}
