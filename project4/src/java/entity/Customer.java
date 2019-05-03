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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author bemap
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
    @NamedQuery(name = "Customer.findByCusStatus", query = "SELECT c FROM Customer c WHERE c.cusStatus = :cusStatus")})
public class Customer implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
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

    public Customer() {
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
    
}
