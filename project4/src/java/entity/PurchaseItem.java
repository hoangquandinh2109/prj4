/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import javax.annotation.Generated;
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
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author johnn
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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "purItemID", nullable = false)
    private Integer purItemID;
    @Column(name = "quantity")
    private Integer quantity;
    @JoinColumn(name = "proID", referencedColumnName = "proID")
    @ManyToOne
    private Product proID;
    @JoinColumn(name = "purID", referencedColumnName = "purID")
    @ManyToOne
    private Purchase purID;

    public PurchaseItem() {
    }

    public PurchaseItem(Integer purItemID) {
        this.purItemID = purItemID;
    }

    public Integer getPurItemID() {
        return purItemID;
    }

    public void setPurItemID(Integer purItemID) {
        this.purItemID = purItemID;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Product getProID() {
        return proID;
    }

    public void setProID(Product proID) {
        this.proID = proID;
    }

    public Purchase getPurID() {
        return purID;
    }

    public void setPurID(Purchase purID) {
        this.purID = purID;
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
