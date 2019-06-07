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
@Table(name = "tb_notifyPost", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TbnotifyPost.findAll", query = "SELECT t FROM TbnotifyPost t"),
    @NamedQuery(name = "TbnotifyPost.findByNoID", query = "SELECT t FROM TbnotifyPost t WHERE t.noID = :noID"),
    @NamedQuery(name = "TbnotifyPost.findByMessage", query = "SELECT t FROM TbnotifyPost t WHERE t.message = :message"),
    @NamedQuery(name = "TbnotifyPost.findBySeenByUser", query = "SELECT t FROM TbnotifyPost t WHERE t.seenByUser = :seenByUser"),
    @NamedQuery(name = "TbnotifyPost.findByNotificationDate", query = "SELECT t FROM TbnotifyPost t WHERE t.notificationDate = :notificationDate")})
public class TbnotifyPost implements Serializable {
    @JoinColumn(name = "notifyComment", referencedColumnName = "commentID")
    @ManyToOne
    private Comment notifyComment;
    @JoinColumn(name = "cusToNotify", referencedColumnName = "cusID")
    @ManyToOne
    private Customer cusToNotify;
    @JoinColumn(name = "cusLike", referencedColumnName = "cusID")
    @ManyToOne
    private Customer cusLike;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "noID", nullable = false)
    private Integer noID;
    @Size(max = 255)
    @Column(name = "message", length = 255)
    private String message;
    @Column(name = "seenByUser")
    private Boolean seenByUser;
    @Column(name = "notificationDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date notificationDate;
    @JoinColumn(name = "notifyLike", referencedColumnName = "likeID")
    @ManyToOne
    private Likes notifyLike;

    public TbnotifyPost() {
    }
public TbnotifyPost(String message, Comment notifyComment, Likes notifyLike,Date date, Customer userToNotify, Customer usersLike) {
        this.message = message;
        this.seenByUser = true;
        this.notifyComment = notifyComment;
        this.notifyLike = notifyLike;
        this.notificationDate=date;
        this.cusToNotify = userToNotify;
        this.cusLike = usersLike;
    }
    public TbnotifyPost(Integer noID) {
        this.noID = noID;
    }

    public Integer getNoID() {
        return noID;
    }

    public void setNoID(Integer noID) {
        this.noID = noID;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Boolean getSeenByUser() {
        return seenByUser;
    }

    public void setSeenByUser(Boolean seenByUser) {
        this.seenByUser = seenByUser;
    }

    public Date getNotificationDate() {
        return notificationDate;
    }

    public void setNotificationDate(Date notificationDate) {
        this.notificationDate = notificationDate;
    }

    public Likes getNotifyLike() {
        return notifyLike;
    }

    public void setNotifyLike(Likes notifyLike) {
        this.notifyLike = notifyLike;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (noID != null ? noID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TbnotifyPost)) {
            return false;
        }
        TbnotifyPost other = (TbnotifyPost) object;
        if ((this.noID == null && other.noID != null) || (this.noID != null && !this.noID.equals(other.noID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.TbnotifyPost[ noID=" + noID + " ]";
    }

    public Comment getNotifyComment() {
        return notifyComment;
    }

    public void setNotifyComment(Comment notifyComment) {
        this.notifyComment = notifyComment;
    }

    public Customer getCusToNotify() {
        return cusToNotify;
    }

    public void setCusToNotify(Customer cusToNotify) {
        this.cusToNotify = cusToNotify;
    }

    public Customer getCusLike() {
        return cusLike;
    }

    public void setCusLike(Customer cusLike) {
        this.cusLike = cusLike;
    }
    
}
