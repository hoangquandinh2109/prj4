/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Customer;
import entity.Likes;
import entity.Post;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author bemap
 */
@Local
public interface LikesFacadeLocal {

    void create(Likes likes);

    void edit(Likes likes);

    void remove(Likes likes);

    Likes find(Object id);

    List<Likes> findAll();

    List<Likes> findRange(int[] range);

    int count();
       long countLike(Post p);
    int findByPostID(Post p,Customer u);

    boolean checkLike(Post p, Customer u);

    long totalUserisLiked(Post p);

     List<Likes> LikedPosts(Customer c);
    
}
