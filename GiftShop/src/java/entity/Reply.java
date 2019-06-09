/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author bemap
 */
@Entity
@Table(name = "reply", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reply.findAll", query = "SELECT r FROM Reply r"),
    @NamedQuery(name = "Reply.findByRepID", query = "SELECT r FROM Reply r WHERE r.repID = :repID"),
    @NamedQuery(name = "Reply.findByReplyStatus", query = "SELECT r FROM Reply r WHERE r.replyStatus = :replyStatus"),
    @NamedQuery(name = "Reply.findByDateReply", query = "SELECT r FROM Reply r WHERE r.dateReply = :dateReply")})
public class Reply implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "repID", nullable = false)
    private Integer repID;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "replyContent", length = 2147483647)
    private String replyContent;
    @Column(name = "replyStatus")
    private Boolean replyStatus;
    @Column(name = "dateReply")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateReply;
    @JoinColumn(name = "commentID", referencedColumnName = "commentID")
    @ManyToOne
    private Comment commentID;
    @JoinColumn(name = "cusID", referencedColumnName = "cusID")
    @ManyToOne
    private Customer cusID;

    public Reply() {
    }
public Reply(String replyContent, Date dateReply, Comment commentID, Customer cusID) {
        this.replyContent = replyContent;
        this.replyStatus = true;
        this.dateReply = dateReply;
        this.commentID = commentID;
        this.cusID = cusID;
    }
    public Reply(Integer repID) {
        this.repID = repID;
    }

    public Reply(Integer repID, String replyContent, Boolean replyStatus, Date dateReply, Comment commentID, Customer cusID) {
        this.repID = repID;
        this.replyContent = replyContent;
        this.replyStatus = replyStatus;
        this.dateReply = dateReply;
        this.commentID = commentID;
        this.cusID = cusID;
    }

    

    public Integer getRepID() {
        return repID;
    }

    public void setRepID(Integer repID) {
        this.repID = repID;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public Boolean getReplyStatus() {
        return replyStatus;
    }

    public void setReplyStatus(Boolean replyStatus) {
        this.replyStatus = replyStatus;
    }

    public Date getDateReply() {
        return dateReply;
    }

    public void setDateReply(Date dateReply) {
        this.dateReply = dateReply;
    }

    public Comment getCommentID() {
        return commentID;
    }

    public void setCommentID(Comment commentID) {
        this.commentID = commentID;
    }

    public Customer getCusID() {
        return cusID;
    }

    public void setCusID(Customer cusID) {
        this.cusID = cusID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (repID != null ? repID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reply)) {
            return false;
        }
        Reply other = (Reply) object;
        if ((this.repID == null && other.repID != null) || (this.repID != null && !this.repID.equals(other.repID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Reply[ repID=" + repID + " ]";
    }
    
}
