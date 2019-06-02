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
@Table(name = "whislist", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Whislist.findAll", query = "SELECT w FROM Whislist w"),
    @NamedQuery(name = "Whislist.findByWhislistID", query = "SELECT w FROM Whislist w WHERE w.whislistID = :whislistID"),
    @NamedQuery(name = "Whislist.findByQuantity", query = "SELECT w FROM Whislist w WHERE w.quantity = :quantity")})
public class Whislist implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "whislistID", nullable = false)
    private Integer whislistID;
    @Column(name = "quantity")
    private Integer quantity;
    @JoinColumn(name = "cusID", referencedColumnName = "cusID")
    @ManyToOne
    private Customer cusID;
    @JoinColumn(name = "proID", referencedColumnName = "proID")
    @ManyToOne
    private Product proID;

    public Whislist() {
    }

    public Whislist(Integer whislistID) {
        this.whislistID = whislistID;
    }

    public Integer getWhislistID() {
        return whislistID;
    }

    public void setWhislistID(Integer whislistID) {
        this.whislistID = whislistID;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Customer getCusID() {
        return cusID;
    }

    public void setCusID(Customer cusID) {
        this.cusID = cusID;
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
        hash += (whislistID != null ? whislistID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Whislist)) {
            return false;
        }
        Whislist other = (Whislist) object;
        if ((this.whislistID == null && other.whislistID != null) || (this.whislistID != null && !this.whislistID.equals(other.whislistID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Whislist[ whislistID=" + whislistID + " ]";
    }
    
}
