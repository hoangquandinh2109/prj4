/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Mailbox;
import entity.Staff;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Asus
 */
@Local
public interface MailboxFacadeLocal {

    void create(Mailbox mailbox);

    void edit(Mailbox mailbox);

    void remove(Mailbox mailbox);

    Mailbox find(Object id);

    List<Mailbox> findAll();

    List<Mailbox> findRange(int[] range);

    int count();
    Staff findByEmail(String email);
    
}
