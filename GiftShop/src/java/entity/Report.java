/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
@Table(name = "Report", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Report.findAll", query = "SELECT r FROM Report r"),
    @NamedQuery(name = "Report.findByRowid", query = "SELECT r FROM Report r WHERE r.rowid = :rowid"),
    @NamedQuery(name = "Report.findByPurID", query = "SELECT r FROM Report r WHERE r.purID = :purID"),
    @NamedQuery(name = "Report.findByProID", query = "SELECT r FROM Report r WHERE r.proID = :proID"),
    @NamedQuery(name = "Report.findByProName", query = "SELECT r FROM Report r WHERE r.proName = :proName"),
    @NamedQuery(name = "Report.findByDateOrderPlaced", query = "SELECT r FROM Report r WHERE r.dateOrderPlaced = :dateOrderPlaced"),
    @NamedQuery(name = "Report.findByTotalPrice", query = "SELECT r FROM Report r WHERE r.totalPrice = :totalPrice"),
    @NamedQuery(name = "Report.findByCusID", query = "SELECT r FROM Report r WHERE r.cusID = :cusID"),
    @NamedQuery(name = "Report.findByCusName", query = "SELECT r FROM Report r WHERE r.cusName = :cusName"),
    @NamedQuery(name = "Report.findByToName", query = "SELECT r FROM Report r WHERE r.toName = :toName"),
    @NamedQuery(name = "Report.findByPurchaseStatus", query = "SELECT r FROM Report r WHERE r.purchaseStatus = :purchaseStatus"),
    @NamedQuery(name = "Report.findByFinalTotal", query = "SELECT r FROM Report r WHERE r.finalTotal = :finalTotal")})
public class Report implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "rowid")
    @Id
    private BigInteger rowid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "purID", nullable = false, length = 20)
    private String purID;
    @Size(max = 10)
    @Column(name = "proID", length = 10)
    private String proID;
    @Size(max = 255)
    @Column(name = "proName", length = 255)
    private String proName;
    @Temporal(TemporalType.DATE)
    @Column(name = "date_order_placed")
    private Date dateOrderPlaced;
    @Column(name = "total_price")
    private Integer totalPrice;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cusID", nullable = false)
    private int cusID;
    @Size(max = 255)
    @Column(name = "cusName", length = 255)
    private String cusName;
    @Size(max = 50)
    @Column(name = "toName", length = 50)
    private String toName;
    @Column(name = "purchaseStatus")
    private Short purchaseStatus;
    @Column(name = "FinalTotal")
    private Integer finalTotal;

    public Report() {
    }

    public Report(BigInteger rowid, String purID, String proID, String proName, Date dateOrderPlaced, Integer totalPrice, int cusID, String cusName, String toName, Short purchaseStatus, Integer finalTotal) {
        this.rowid = rowid;
        this.purID = purID;
        this.proID = proID;
        this.proName = proName;
        this.dateOrderPlaced = dateOrderPlaced;
        this.totalPrice = totalPrice;
        this.cusID = cusID;
        this.cusName = cusName;
        this.toName = toName;
        this.purchaseStatus = purchaseStatus;
        this.finalTotal = finalTotal;
    }

    public BigInteger getRowid() {
        return rowid;
    }

    public void setRowid(BigInteger rowid) {
        this.rowid = rowid;
    }

    public String getPurID() {
        return purID;
    }

    public void setPurID(String purID) {
        this.purID = purID;
    }

    public String getProID() {
        return proID;
    }

    public void setProID(String proID) {
        this.proID = proID;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public Date getDateOrderPlaced() {
        return dateOrderPlaced;
    }

    public void setDateOrderPlaced(Date dateOrderPlaced) {
        this.dateOrderPlaced = dateOrderPlaced;
    }

    public Integer getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getCusID() {
        return cusID;
    }

    public void setCusID(int cusID) {
        this.cusID = cusID;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getToName() {
        return toName;
    }

    public void setToName(String toName) {
        this.toName = toName;
    }

    public Short getPurchaseStatus() {
        return purchaseStatus;
    }

    public void setPurchaseStatus(Short purchaseStatus) {
        this.purchaseStatus = purchaseStatus;
    }

    public Integer getFinalTotal() {
        return finalTotal;
    }

    public void setFinalTotal(Integer finalTotal) {
        this.finalTotal = finalTotal;
    }
    
}
