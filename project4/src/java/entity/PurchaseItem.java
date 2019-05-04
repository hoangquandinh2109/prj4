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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "purchaseItem", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PurchaseItem.findAll", query = "SELECT p FROM PurchaseItem p"),
    @NamedQuery(name = "PurchaseItem.findByPurItemID", query = "SELECT p FROM PurchaseItem p WHERE p.purItemID = :purItemID"),
    @NamedQuery(name = "PurchaseItem.findByQuantity", query = "SELECT p FROM PurchaseItem p WHERE p.quantity = :quantity")})
public class PurchaseItem implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "purItemID", nullable = false, length = 20)
    private String purItemID;
    @Column(name = "quantity")
    private Integer quantity;
    @OneToMany(mappedBy = "purItemID")
    private Collection<Purchase> purchaseCollection;
    @JoinColumn(name = "proID", referencedColumnName = "proID")
    @ManyToOne
    private Product proID;

    public PurchaseItem() {
    }

    public PurchaseItem(String purItemID) {
        this.purItemID = purItemID;
    }

    public String getPurItemID() {
        return purItemID;
    }

    public void setPurItemID(String purItemID) {
        this.purItemID = purItemID;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @XmlTransient
    public Collection<Purchase> getPurchaseCollection() {
        return purchaseCollection;
    }

    public void setPurchaseCollection(Collection<Purchase> purchaseCollection) {
        this.purchaseCollection = purchaseCollection;
    }

    public Product getProID() {
        return proID;
    }

    public void setProID(Product proID) {
        this.proID = proID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (purItemID != null ? purItemID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PurchaseItem)) {
            return false;
        }
        PurchaseItem other = (PurchaseItem) object;
        if ((this.purItemID == null && other.purItemID != null) || (this.purItemID != null && !this.purItemID.equals(other.purItemID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.PurchaseItem[ purItemID=" + purItemID + " ]";
    }
    
}
