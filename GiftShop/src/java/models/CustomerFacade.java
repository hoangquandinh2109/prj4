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
import javax.persistence.Query;

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
    public Customer findByEmail(String email) {
        Query q = em.createQuery("SELECT c FROM Customer c WHERE c.cusEmail = :cusEmail");
        q.setParameter("cusEmail", email);
        System.out.println(q.getResultList());
        return (Customer) q.getSingleResult();
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

    @Override
    public boolean checkIfEmailExisted(String email) {
        try {
           Customer abc = (Customer) em.createQuery("SELECT c FROM Customer c WHERE c.cusEmail = :email")
                .setParameter("email", email)
                .getSingleResult();
            System.out.println(abc.getCusName());
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    @Override
    public boolean register(Customer customer) {
        try {
           em.persist(customer);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    
    
}
