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
@Table(name = "ProImgtb", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProImgtb.findAll", query = "SELECT p FROM ProImgtb p"),
    @NamedQuery(name = "ProImgtb.findByCode", query = "SELECT p FROM ProImgtb p WHERE p.code = :code")})
public class ProImgtb implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
   // @NotNull
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Code", nullable = false)
    private Integer code;
    @JoinColumn(name = "imgID", referencedColumnName = "imgID")
    @ManyToOne
    private ImgStog imgID;
    @JoinColumn(name = "proID", referencedColumnName = "proID")
    @ManyToOne
    private Product proID;

    public ProImgtb() {
    }

    public ProImgtb( ImgStog imgID, Product proID) {
       
        this.imgID = imgID;
        this.proID = proID;
    }

    public ProImgtb(Integer code) {
        this.code = code;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public ImgStog getImgID() {
        return imgID;
    }

    public void setImgID(ImgStog imgID) {
        this.imgID = imgID;
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
        hash += (code != null ? code.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProImgtb)) {
            return false;
        }
        ProImgtb other = (ProImgtb) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ProImgtb[ code=" + code + " ]";
    }
    
}
