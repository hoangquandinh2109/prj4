/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.PurchaseItem;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Asus
 */
@Local
public interface PurchaseItemFacadeLocal {

    void create(PurchaseItem purchaseItem);

    void edit(PurchaseItem purchaseItem);

    void remove(PurchaseItem purchaseItem);

    PurchaseItem find(Object id);

    List<PurchaseItem> findAll();

    List<PurchaseItem> findRange(int[] range);

    int count();
    
}
