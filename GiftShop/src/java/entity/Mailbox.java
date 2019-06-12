/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.util.Date;
import javax.annotation.Generated;
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
 * @author Asus
 */
@Entity
@Table(name = "mailbox", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Mailbox.findAll", query = "SELECT m FROM Mailbox m"),
    @NamedQuery(name = "Mailbox.findByMailID", query = "SELECT m FROM Mailbox m WHERE m.mailID = :mailID"),
    @NamedQuery(name = "Mailbox.findByMessage", query = "SELECT m FROM Mailbox m WHERE m.message = :message"),
    @NamedQuery(name = "Mailbox.findBySubject", query = "SELECT m FROM Mailbox m WHERE m.subject = :subject"),
    @NamedQuery(name = "Mailbox.findByReceivedDate", query = "SELECT m FROM Mailbox m WHERE m.receivedDate = :receivedDate"),
    @NamedQuery(name = "Mailbox.findByReplyDate", query = "SELECT m FROM Mailbox m WHERE m.replyDate = :replyDate")})
public class Mailbox implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mailID", nullable = false)
    private Integer mailID;
    @Size(max = 500)
    @Column(name = "Subject", length = 500)
    private String subject;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "Message", length = 2147483647)
    private String message;
    @Column(name = "ReceivedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date receivedDate;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "replyContent", length = 2147483647)
    private String replyContent;
    @Column(name = "replyDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date replyDate;
    @JoinColumn(name = "cusID", referencedColumnName = "cusID")
    @ManyToOne
    private Customer cusID;
    @JoinColumn(name = "staffID", referencedColumnName = "staffID")
    @ManyToOne
    private Staff staffID;

    public Mailbox() {
    }
    
    public Mailbox(String message) {
        
        this.subject = "Reset Password";
        this.message = message;
        
        this.receivedDate = new Date();
        this.replyContent = null;
        this.replyDate = null;
        this.cusID = null;
        this.staffID = null;
    }
    
    public Mailbox(Integer mailID) {
        this.mailID = mailID;
    }

    public Integer getMailID() {
        return mailID;
    }

    public void setMailID(Integer mailID) {
        this.mailID = mailID;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(Date receivedDate) {
        this.receivedDate = receivedDate;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public Date getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(Date replyDate) {
        this.replyDate = replyDate;
    }

    public Customer getCusID() {
        return cusID;
    }

    public void setCusID(Customer cusID) {
        this.cusID = cusID;
    }

    public Staff getStaffID() {
        return staffID;
    }

    public void setStaffID(Staff staffID) {
        this.staffID = staffID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (mailID != null ? mailID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Mailbox)) {
            return false;
        }
        Mailbox other = (Mailbox) object;
        if ((this.mailID == null && other.mailID != null) || (this.mailID != null && !this.mailID.equals(other.mailID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Mailbox[ mailID=" + mailID + " ]";
    }
    
}
