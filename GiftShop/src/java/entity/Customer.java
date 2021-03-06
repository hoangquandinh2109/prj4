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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Asus
 */
@Entity
@Table(name = "customer", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Customer.findAll", query = "SELECT c FROM Customer c"),
    @NamedQuery(name = "Customer.findByCusID", query = "SELECT c FROM Customer c WHERE c.cusID = :cusID"),
    @NamedQuery(name = "Customer.findByCusName", query = "SELECT c FROM Customer c WHERE c.cusName = :cusName"),
    @NamedQuery(name = "Customer.findByCusEmail", query = "SELECT c FROM Customer c WHERE c.cusEmail = :cusEmail"),
    @NamedQuery(name = "Customer.findByCusPassword", query = "SELECT c FROM Customer c WHERE c.cusPassword = :cusPassword"),
    @NamedQuery(name = "Customer.findByCusAddress", query = "SELECT c FROM Customer c WHERE c.cusAddress = :cusAddress"),
    @NamedQuery(name = "Customer.findByCusPhone", query = "SELECT c FROM Customer c WHERE c.cusPhone = :cusPhone"),
    @NamedQuery(name = "Customer.findByCusAvatar", query = "SELECT c FROM Customer c WHERE c.cusAvatar = :cusAvatar"),
    @NamedQuery(name = "Customer.findByCusStatus", query = "SELECT c FROM Customer c WHERE c.cusStatus = :cusStatus"),
    @NamedQuery(name = "Customer.findByCusGender", query = "SELECT c FROM Customer c WHERE c.cusGender = :cusGender")})
public class Customer implements Serializable {
    @OneToMany(mappedBy = "cusToNotify")
    private Collection<TbnotifyPost> tbnotifyPostCollection;
    @OneToMany(mappedBy = "cusLike")
    private Collection<TbnotifyPost> tbnotifyPostCollection1;
    @OneToMany(mappedBy = "cusID")
    private Collection<Likes> likesCollection;
    @OneToMany(mappedBy = "cusID")
    private Collection<Reply> replyCollection;
    @OneToMany(mappedBy = "cusID")
    private Collection<Post> postCollection;
    @OneToMany(mappedBy = "cusID")
    private Collection<Comment> commentCollection;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cusID", nullable = false)
    private Integer cusID;
    @Size(max = 255)
    @Column(name = "cusName", length = 255)
    private String cusName;
    @Size(max = 255)
    @Column(name = "cusEmail", length = 255)
    private String cusEmail;
    @Size(max = 255)
    @Column(name = "cusPassword", length = 255)
    private String cusPassword;
    @Size(max = 255)
    @Column(name = "cusAddress", length = 255)
    private String cusAddress;
    @Size(max = 255)
    @Column(name = "cusPhone", length = 255)
    private String cusPhone;
    @Size(max = 255)
    @Column(name = "cusAvatar", length = 255)
    private String cusAvatar;
    @Column(name = "cusStatus")
    private Boolean cusStatus;
    @Column(name = "cusGender")
    private Boolean cusGender;
    @OneToMany(mappedBy = "cusID")
    private Collection<Wishlist> wishlistCollection;
    @OneToMany(mappedBy = "cusID")
    private Collection<Purchase> purchaseCollection;
    @OneToMany(mappedBy = "sender")
    private Collection<Feedback> feedbackCollection;
    @OneToMany(mappedBy = "cusID")
    private Collection<Mailbox> mailboxCollection;
    @OneToMany(mappedBy = "cusID")
    private Collection<Review> reviewCollection;

    public Customer() {
    }

    public Customer(String cusName, String cusEmail, String cusPassword, String cusAddress, String cusPhone, Boolean cusStatus, Boolean cusGender) {
        this.cusName = cusName;
        this.cusEmail = cusEmail;
        this.cusPassword = cusPassword;
        this.cusAddress = cusAddress;
        this.cusPhone = cusPhone;
        this.cusStatus = cusStatus;
        this.cusGender = cusGender;
    }
    

    public Customer(Integer cusID) {
        this.cusID = cusID;
    }

    public Integer getCusID() {
        return cusID;
    }

    public void setCusID(Integer cusID) {
        this.cusID = cusID;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getCusEmail() {
        return cusEmail;
    }

    public void setCusEmail(String cusEmail) {
        this.cusEmail = cusEmail;
    }

    public String getCusPassword() {
        return cusPassword;
    }

    public void setCusPassword(String cusPassword) {
        this.cusPassword = cusPassword;
    }

    public String getCusAddress() {
        return cusAddress;
    }

    public void setCusAddress(String cusAddress) {
        this.cusAddress = cusAddress;
    }

    public String getCusPhone() {
        return cusPhone;
    }

    public void setCusPhone(String cusPhone) {
        this.cusPhone = cusPhone;
    }

    public String getCusAvatar() {
        return cusAvatar;
    }

    public void setCusAvatar(String cusAvatar) {
        this.cusAvatar = cusAvatar;
    }

    public Boolean getCusStatus() {
        return cusStatus;
    }

    public void setCusStatus(Boolean cusStatus) {
        this.cusStatus = cusStatus;
    }

    public Boolean getCusGender() {
        return cusGender;
    }

    public void setCusGender(Boolean cusGender) {
        this.cusGender = cusGender;
    }

    @XmlTransient
    public Collection<Wishlist> getWishlistCollection() {
        return wishlistCollection;
    }

    public void setWishlistCollection(Collection<Wishlist> wishlistCollection) {
        this.wishlistCollection = wishlistCollection;
    }

    @XmlTransient
    public Collection<Purchase> getPurchaseCollection() {
        return purchaseCollection;
    }

    public void setPurchaseCollection(Collection<Purchase> purchaseCollection) {
        this.purchaseCollection = purchaseCollection;
    }

    @XmlTransient
    public Collection<Feedback> getFeedbackCollection() {
        return feedbackCollection;
    }

    public void setFeedbackCollection(Collection<Feedback> feedbackCollection) {
        this.feedbackCollection = feedbackCollection;
    }

    @XmlTransient
    public Collection<Mailbox> getMailboxCollection() {
        return mailboxCollection;
    }

    public void setMailboxCollection(Collection<Mailbox> mailboxCollection) {
        this.mailboxCollection = mailboxCollection;
    }

    @XmlTransient
    public Collection<Review> getReviewCollection() {
        return reviewCollection;
    }

    public void setReviewCollection(Collection<Review> reviewCollection) {
        this.reviewCollection = reviewCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cusID != null ? cusID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customer)) {
            return false;
        }
        Customer other = (Customer) object;
        if ((this.cusID == null && other.cusID != null) || (this.cusID != null && !this.cusID.equals(other.cusID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Customer[ cusID=" + cusID + " ]";
    }

    @XmlTransient
    public Collection<Post> getPostCollection() {
        return postCollection;
    }

    public void setPostCollection(Collection<Post> postCollection) {
        this.postCollection = postCollection;
    }

    @XmlTransient
    public Collection<Comment> getCommentCollection() {
        return commentCollection;
    }

    public void setCommentCollection(Collection<Comment> commentCollection) {
        this.commentCollection = commentCollection;
    }

    @XmlTransient
    public Collection<Reply> getReplyCollection() {
        return replyCollection;
    }

    public void setReplyCollection(Collection<Reply> replyCollection) {
        this.replyCollection = replyCollection;
    }

    @XmlTransient
    public Collection<Likes> getLikesCollection() {
        return likesCollection;
    }

    public void setLikesCollection(Collection<Likes> likesCollection) {
        this.likesCollection = likesCollection;
    }

    @XmlTransient
    public Collection<TbnotifyPost> getTbnotifyPostCollection() {
        return tbnotifyPostCollection;
    }

    public void setTbnotifyPostCollection(Collection<TbnotifyPost> tbnotifyPostCollection) {
        this.tbnotifyPostCollection = tbnotifyPostCollection;
    }

    @XmlTransient
    public Collection<TbnotifyPost> getTbnotifyPostCollection1() {
        return tbnotifyPostCollection1;
    }

    public void setTbnotifyPostCollection1(Collection<TbnotifyPost> tbnotifyPostCollection1) {
        this.tbnotifyPostCollection1 = tbnotifyPostCollection1;
    }
    
}
