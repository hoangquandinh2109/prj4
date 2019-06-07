/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author bemap
 */
@Entity
@Table(name = "comment", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Comment.findAll", query = "SELECT c FROM Comment c"),
    @NamedQuery(name = "Comment.findByCommentID", query = "SELECT c FROM Comment c WHERE c.commentID = :commentID"),
    @NamedQuery(name = "Comment.findByCommentStatus", query = "SELECT c FROM Comment c WHERE c.commentStatus = :commentStatus"),
    @NamedQuery(name = "Comment.findByDateComment", query = "SELECT c FROM Comment c WHERE c.dateComment = :dateComment")})
public class Comment implements Serializable {
    @OneToMany(mappedBy = "notifyComment")
    private Collection<TbnotifyPost> tbnotifyPostCollection;
    @OneToMany(mappedBy = "commentID")
    private Collection<Reply> replyCollection;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "commentID", nullable = false)
    private Integer commentID;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "commentContent", length = 2147483647)
    private String commentContent;
    @Column(name = "commentStatus")
    private Boolean commentStatus;
    @Column(name = "dateComment")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateComment;
    @JoinColumn(name = "cusID", referencedColumnName = "cusID")
    @ManyToOne
    private Customer cusID;
    @JoinColumn(name = "postID", referencedColumnName = "postID")
    @ManyToOne
    private Post postID;

    public Comment() {
    }
public Comment(String commentContent, Date dateComment, Post postID, Customer cusID) {
     
        this.commentContent = commentContent;
        this.commentStatus = true;
        this.dateComment = dateComment;
        this.postID = postID;
        this.cusID = cusID;
       
    }
    public Comment(Integer commentID) {
        this.commentID = commentID;
    }

    public Integer getCommentID() {
        return commentID;
    }

    public void setCommentID(Integer commentID) {
        this.commentID = commentID;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Boolean getCommentStatus() {
        return commentStatus;
    }

    public void setCommentStatus(Boolean commentStatus) {
        this.commentStatus = commentStatus;
    }

    public Date getDateComment() {
        return dateComment;
    }

    public void setDateComment(Date dateComment) {
        this.dateComment = dateComment;
    }

    public Customer getCusID() {
        return cusID;
    }

    public void setCusID(Customer cusID) {
        this.cusID = cusID;
    }

    public Post getPostID() {
        return postID;
    }

    public void setPostID(Post postID) {
        this.postID = postID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (commentID != null ? commentID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comment)) {
            return false;
        }
        Comment other = (Comment) object;
        if ((this.commentID == null && other.commentID != null) || (this.commentID != null && !this.commentID.equals(other.commentID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Comment[ commentID=" + commentID + " ]";
    }

    @XmlTransient
    public Collection<Reply> getReplyCollection() {
        return replyCollection;
    }

    public void setReplyCollection(Collection<Reply> replyCollection) {
        this.replyCollection = replyCollection;
    }

    @XmlTransient
    public Collection<TbnotifyPost> getTbnotifyPostCollection() {
        return tbnotifyPostCollection;
    }

    public void setTbnotifyPostCollection(Collection<TbnotifyPost> tbnotifyPostCollection) {
        this.tbnotifyPostCollection = tbnotifyPostCollection;
    }
    
}
