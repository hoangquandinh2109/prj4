/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Feature;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Asus
 */
@Local
public interface FeatureFacadeLocal {

    void create(Feature feature);

    void edit(Feature feature);

    void remove(Feature feature);

    Feature find(Object id);

    List<Feature> findAll();

    List<Feature> findRange(int[] range);

    int count();
    
}
