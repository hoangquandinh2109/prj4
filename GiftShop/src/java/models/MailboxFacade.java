/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Mailbox;
import entity.Staff;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Asus
 */
@Stateless
public class MailboxFacade extends AbstractFacade<Mailbox> implements MailboxFacadeLocal {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MailboxFacade() {
        super(Mailbox.class);
    }

    @Override
    public Staff findByEmail(String email) {
// List<Staff> list = new ArrayList<>();
        Query q= em.createQuery("SELECT s FROM Staff s WHERE s.staffEmail = :staffEmail");
        q.setParameter("staffEmail", email);
        
        return (Staff) q.getSingleResult();
    }
    
    
}
