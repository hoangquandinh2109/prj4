/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.TbTag;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Asus
 */
@Local
public interface TbTagFacadeLocal {

    void create(TbTag tbTag);

    void edit(TbTag tbTag);

    void remove(TbTag tbTag);

    TbTag find(Object id);

    List<TbTag> findAll();

    List<TbTag> findRange(int[] range);

    int count();

  
    
}
