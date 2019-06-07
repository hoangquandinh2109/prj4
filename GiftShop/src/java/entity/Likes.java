/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author bemap
 */
@Entity
@Table(name = "likes", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Likes.findAll", query = "SELECT l FROM Likes l"),
    @NamedQuery(name = "Likes.findByLikeID", query = "SELECT l FROM Likes l WHERE l.likeID = :likeID"),
    @NamedQuery(name = "Likes.findByLikeStatus", query = "SELECT l FROM Likes l WHERE l.likeStatus = :likeStatus")})
public class Likes implements Serializable {
    @JoinColumn(name = "cusID", referencedColumnName = "cusID")
    @ManyToOne
    private Customer cusID;
    
    @JoinColumn(name = "postLiked", referencedColumnName = "postID")
    @ManyToOne
    private Post postLiked;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "likeID", nullable = false)
    private Integer likeID;
    @Column(name = "likeStatus")
    private Boolean likeStatus;
    @OneToMany(mappedBy = "notifyLike")
    private Collection<TbnotifyPost> tbnotifyPostCollection;

    public Likes() {
    }
     public Likes(Boolean likeStatus, Post postLiked, Customer cusID) {
        
        this.likeStatus = likeStatus;
       
        this.postLiked = postLiked;
        this.cusID = cusID;
    }

    public Likes(Integer likeID) {
        this.likeID = likeID;
    }

    public Integer getLikeID() {
        return likeID;
    }

    public void setLikeID(Integer likeID) {
        this.likeID = likeID;
    }

    public Boolean getLikeStatus() {
        return likeStatus;
    }

    public void setLikeStatus(Boolean likeStatus) {
        this.likeStatus = likeStatus;
    }

    @XmlTransient
    public Collection<TbnotifyPost> getTbnotifyPostCollection() {
        return tbnotifyPostCollection;
    }

    public void setTbnotifyPostCollection(Collection<TbnotifyPost> tbnotifyPostCollection) {
        this.tbnotifyPostCollection = tbnotifyPostCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (likeID != null ? likeID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Likes)) {
            return false;
        }
        Likes other = (Likes) object;
        if ((this.likeID == null && other.likeID != null) || (this.likeID != null && !this.likeID.equals(other.likeID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Likes[ likeID=" + likeID + " ]";
    }
    public Post getPostLiked() {
        return postLiked;
    }

    public void setPostLiked(Post postLiked) {
        this.postLiked = postLiked;
    }

    public Customer getCusID() {
        return cusID;
    }

    public void setCusID(Customer cusID) {
        this.cusID = cusID;
    }
    
}
