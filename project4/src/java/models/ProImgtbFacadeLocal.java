/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.ProImgtb;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author johnn
 */
@Local
public interface ProImgtbFacadeLocal {

    void create(ProImgtb proImgtb);

    void edit(ProImgtb proImgtb);

    void remove(ProImgtb proImgtb);

    ProImgtb find(Object id);

    List<ProImgtb> findAll();

    List<ProImgtb> findRange(int[] range);

    int count();
    
}
