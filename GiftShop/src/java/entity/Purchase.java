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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
 * @author Asus
 */
@Entity
@Table(name = "purchase", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Purchase.findAll", query = "SELECT p FROM Purchase p"),
    @NamedQuery(name = "Purchase.findByPurID", query = "SELECT p FROM Purchase p WHERE p.purID = :purID"),
    @NamedQuery(name = "Purchase.findByTotalPrice", query = "SELECT p FROM Purchase p WHERE p.totalPrice = :totalPrice"),
    @NamedQuery(name = "Purchase.findByPurchaseStatus", query = "SELECT p FROM Purchase p WHERE p.purchaseStatus = :purchaseStatus"),
    @NamedQuery(name = "Purchase.findByDateOrderPlaced", query = "SELECT p FROM Purchase p WHERE p.dateOrderPlaced = :dateOrderPlaced"),
    @NamedQuery(name = "Purchase.findByDateOrderPaid", query = "SELECT p FROM Purchase p WHERE p.dateOrderPaid = :dateOrderPaid")})
public class Purchase implements Serializable {
   
    @Size(max = 50)
    @Column(name = "toName", length = 50)
    private String toName;
    @Size(max = 50)
    @Column(name = "toAddress", length = 50)
    private String toAddress;
    @Size(max = 11)
    @Column(name = "toPhone", length = 11)
    private String toPhone;
    @Size(max = 50)
    @Column(name = "paymentMethod", length = 50)
    private String paymentMethod;
    @Size(max = 255)
    @Column(name = "note", length = 255)
    private String note;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "purID", nullable = false, length = 20)
    private String purID;
    @Column(name = "total_price")
    private Integer totalPrice;
    @Column(name = "purchaseStatus")
    private Short purchaseStatus;
    @Column(name = "date_order_placed")
    @Temporal(TemporalType.DATE)
    private Date dateOrderPlaced;
    @Column(name = "date_order_paid")
    @Temporal(TemporalType.DATE)
    private Date dateOrderPaid;
    @JoinColumn(name = "cusID", referencedColumnName = "cusID")
    @ManyToOne
    private Customer cusID;
    @OneToMany(mappedBy = "purID")
    private Collection<PurchaseItem> purchaseItemCollection;

    public Purchase() {
    }

    public Purchase(String purID) {
        this.purID = purID;
    }

    public String getPurID() {
        return purID;
    }

    public void setPurID(String purID) {
        this.purID = purID;
    }

    public Integer getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Short getPurchaseStatus() {
        return purchaseStatus;
    }

    public void setPurchaseStatus(Short purchaseStatus) {
        this.purchaseStatus = purchaseStatus;
    }

    public Date getDateOrderPlaced() {
        return dateOrderPlaced;
    }

    public void setDateOrderPlaced(Date dateOrderPlaced) {
        this.dateOrderPlaced = dateOrderPlaced;
    }

    public Date getDateOrderPaid() {
        return dateOrderPaid;
    }

    public void setDateOrderPaid(Date dateOrderPaid) {
        this.dateOrderPaid = dateOrderPaid;
    }

    public Customer getCusID() {
        return cusID;
    }

    public void setCusID(Customer cusID) {
        this.cusID = cusID;
    }

    @XmlTransient
    public Collection<PurchaseItem> getPurchaseItemCollection() {
        return purchaseItemCollection;
    }

    public void setPurchaseItemCollection(Collection<PurchaseItem> purchaseItemCollection) {
        this.purchaseItemCollection = purchaseItemCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (purID != null ? purID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Purchase)) {
            return false;
        }
        Purchase other = (Purchase) object;
        if ((this.purID == null && other.purID != null) || (this.purID != null && !this.purID.equals(other.purID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Purchase[ purID=" + purID + " ]";
    }

    
    public String getToName() {
        return toName;
    }

    public void setToName(String toName) {
        this.toName = toName;
    }

    public String getToAddress() {
        return toAddress;
    }

    public void setToAddress(String toAddress) {
        this.toAddress = toAddress;
    }

    public String getToPhone() {
        return toPhone;
    }

    public void setToPhone(String toPhone) {
        this.toPhone = toPhone;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
}
