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
@Table(name = "staff", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Staff.findAll", query = "SELECT s FROM Staff s"),
    @NamedQuery(name = "Staff.findByStaffID", query = "SELECT s FROM Staff s WHERE s.staffID = :staffID"),
    @NamedQuery(name = "Staff.findByStaffName", query = "SELECT s FROM Staff s WHERE s.staffName = :staffName"),
    @NamedQuery(name = "Staff.findByStaffPhone", query = "SELECT s FROM Staff s WHERE s.staffPhone = :staffPhone"),
    @NamedQuery(name = "Staff.findByStaffEmail", query = "SELECT s FROM Staff s WHERE s.staffEmail = :staffEmail"),
    @NamedQuery(name = "Staff.findByStaffAddress", query = "SELECT s FROM Staff s WHERE s.staffAddress = :staffAddress"),
    @NamedQuery(name = "Staff.findByStaffPassword", query = "SELECT s FROM Staff s WHERE s.staffPassword = :staffPassword"),
    @NamedQuery(name = "Staff.findByRole", query = "SELECT s FROM Staff s WHERE s.role = :role"),
    @NamedQuery(name = "Staff.findByStaffStatus", query = "SELECT s FROM Staff s WHERE s.staffStatus = :staffStatus")})
public class Staff implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "staffID", nullable = false, length = 10)
    private String staffID;
    @Size(max = 255)
    @Column(name = "staffName", length = 255)
    private String staffName;
    @Size(max = 10)
    @Column(name = "staffPhone", length = 10)
    private String staffPhone;
    @Size(max = 50)
    @Column(name = "staffEmail", length = 50)
    private String staffEmail;
    @Size(max = 255)
    @Column(name = "staffAddress", length = 255)
    private String staffAddress;
    @Size(max = 255)
    @Column(name = "staffPassword", length = 255)
    private String staffPassword;
    @Column(name = "role")
    private Short role;
    @Column(name = "staffStatus")
    private Boolean staffStatus;
    @OneToMany(mappedBy = "staffID")
    private Collection<Mailbox> mailboxCollection;

    public Staff() {
    }

     public Staff(String staffID, String staffName, String staffPhone, String staffEmail, String staffAddress, String staffPassword) {
        this.staffID = staffID;
        this.staffName = staffName;
        this.staffPhone = staffPhone;
        this.staffEmail = staffEmail;
        this.staffAddress = staffAddress;
        this.staffPassword = staffPassword;
        this.role = 2;
        this.staffStatus = true;
        
    }
     

    public Staff(String staffID) {
        this.staffID = staffID;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getStaffPhone() {
        return staffPhone;
    }

    public void setStaffPhone(String staffPhone) {
        this.staffPhone = staffPhone;
    }

    public String getStaffEmail() {
        return staffEmail;
    }

    public void setStaffEmail(String staffEmail) {
        this.staffEmail = staffEmail;
    }

    public String getStaffAddress() {
        return staffAddress;
    }

    public void setStaffAddress(String staffAddress) {
        this.staffAddress = staffAddress;
    }

    public String getStaffPassword() {
        return staffPassword;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }

    public Short getRole() {
        return role;
    }

    public void setRole(Short role) {
        this.role = role;
    }

    public Boolean getStaffStatus() {
        return staffStatus;
    }

    public void setStaffStatus(Boolean staffStatus) {
        this.staffStatus = staffStatus;
    }

    @XmlTransient
    public Collection<Mailbox> getMailboxCollection() {
        return mailboxCollection;
    }

    public void setMailboxCollection(Collection<Mailbox> mailboxCollection) {
        this.mailboxCollection = mailboxCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (staffID != null ? staffID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Staff)) {
            return false;
        }
        Staff other = (Staff) object;
        if ((this.staffID == null && other.staffID != null) || (this.staffID != null && !this.staffID.equals(other.staffID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Staff[ staffID=" + staffID + " ]";
    }
    
}
