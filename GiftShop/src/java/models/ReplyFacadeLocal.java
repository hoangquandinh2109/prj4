/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import entity.Comment;
import entity.Reply;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author bemap
 */
@Local
public interface ReplyFacadeLocal {

    void create(Reply reply);

    void edit(Reply reply);

    void remove(Reply reply);

    Reply find(Object id);

    List<Reply> findAll();

    List<Reply> findRange(int[] range);

    int count();
    List<Reply> removeReplies(Comment c);
}
