/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Customer;
import entity.Product;
import entity.Purchase;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Asus
 */
@Local
public interface PurchaseFacadeLocal {

    void create(Purchase purchase);

    void edit(Purchase purchase);

    void remove(Purchase purchase);

    Purchase find(Object id);

    List<Purchase> findAll();

    List<Purchase> findRange(int[] range);

    int count();
    
    String getLastPurchaseID();

    List<Purchase> orderofme(Customer me);
    
}
