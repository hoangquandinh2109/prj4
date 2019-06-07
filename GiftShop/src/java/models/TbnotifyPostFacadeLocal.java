/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.TbnotifyPost;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author bemap
 */
@Local
public interface TbnotifyPostFacadeLocal {

    void create(TbnotifyPost tbnotifyPost);

    void edit(TbnotifyPost tbnotifyPost);

    void remove(TbnotifyPost tbnotifyPost);

    TbnotifyPost find(Object id);

    List<TbnotifyPost> findAll();

    List<TbnotifyPost> findRange(int[] range);

    int count();
    
}
