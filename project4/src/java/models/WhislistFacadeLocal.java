/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Product;
import entity.Whislist;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author johnn
 */
@Local
public interface WhislistFacadeLocal {
    
    void create(Whislist whislist);

    void edit(Whislist whislist);

    void remove(Whislist whislist);

    Whislist find(Object id);

    List<Whislist> findAll();

    List<Whislist> findRange(int[] range);

    int count();
}
