/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Customer;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Asus
 */
@Local
public interface CustomerFacadeLocal {

    void create(Customer customer);

    void edit(Customer customer);

    void remove(Customer customer);

    Customer find(Object id);

    List<Customer> findAll();

    List<Customer> findRange(int[] range);

    int count();
    
    Customer login(String email, String password);

    boolean checkIfEmailExisted(String email);

    boolean register(Customer customer);

    Customer findByEmail(String email);
}
