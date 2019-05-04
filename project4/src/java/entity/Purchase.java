/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

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
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "purID", nullable = false)
    private Integer purID;
    @Column(name = "total_price")
    private Integer totalPrice;
    @Column(name = "purchaseStatus")
    private Short purchaseStatus;
    @Size(max = 10)
    @Column(name = "date_order_placed", length = 10)
    private String dateOrderPlaced;
    @Size(max = 10)
    @Column(name = "date_order_paid", length = 10)
    private String dateOrderPaid;
    @JoinColumn(name = "cusID", referencedColumnName = "cusID")
    @ManyToOne
    private Customer cusID;
    @JoinColumn(name = "purItemID", referencedColumnName = "purItemID")
    @ManyToOne
    private PurchaseItem purItemID;

    public Purchase() {
    }

    public Purchase(Integer purID) {
        this.purID = purID;
    }

    public Integer getPurID() {
        return purID;
    }

    public void setPurID(Integer purID) {
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

    public String getDateOrderPlaced() {
        return dateOrderPlaced;
    }

    public void setDateOrderPlaced(String dateOrderPlaced) {
        this.dateOrderPlaced = dateOrderPlaced;
    }

    public String getDateOrderPaid() {
        return dateOrderPaid;
    }

    public void setDateOrderPaid(String dateOrderPaid) {
        this.dateOrderPaid = dateOrderPaid;
    }

    public Customer getCusID() {
        return cusID;
    }

    public void setCusID(Customer cusID) {
        this.cusID = cusID;
    }

    public PurchaseItem getPurItemID() {
        return purItemID;
    }

    public void setPurItemID(PurchaseItem purItemID) {
        this.purItemID = purItemID;
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
    
}
