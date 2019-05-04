/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.ImgStog;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Asus
 */
@Local
public interface ImgStogFacadeLocal {

    void create(ImgStog imgStog);

    void edit(ImgStog imgStog);

    void remove(ImgStog imgStog);

    ImgStog find(Object id);

    List<ImgStog> findAll();

    List<ImgStog> findRange(int[] range);

    int count();
    
}
