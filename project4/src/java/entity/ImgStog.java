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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Asus
 */
@Entity
@Table(name = "imgStog", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ImgStog.findAll", query = "SELECT i FROM ImgStog i"),
    @NamedQuery(name = "ImgStog.findByImgID", query = "SELECT i FROM ImgStog i WHERE i.imgID = :imgID"),
    @NamedQuery(name = "ImgStog.findByImgName", query = "SELECT i FROM ImgStog i WHERE i.imgName = :imgName"),
    @NamedQuery(name = "ImgStog.findByThumbnail", query = "SELECT i FROM ImgStog i WHERE i.thumbnail = :thumbnail")})
public class ImgStog implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "imgID", nullable = false)
    private Integer imgID;
    @Size(max = 255)
    @Column(name = "img_name", length = 255)
    private String imgName;
    @Column(name = "thumbnail")
    private Boolean thumbnail;
    @JoinColumn(name = "proID", referencedColumnName = "proID")
    @ManyToOne
    private Product proID;

    public ImgStog() {
    }

    public ImgStog(Integer imgID, String imgName, Product proID) {
        this.imgID = imgID;
        this.imgName = imgName;
        this.proID = proID;
    }

    public ImgStog( String imgName, Product proID) {
        this.imgName = imgName;
        this.proID = proID;
    }

    public ImgStog(Integer imgID) {
        this.imgID = imgID;
    }

    public Integer getImgID() {
        return imgID;
    }

    public void setImgID(Integer imgID) {
        this.imgID = imgID;
    }

    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }

    public Boolean getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(Boolean thumbnail) {
        this.thumbnail = thumbnail;
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
        hash += (imgID != null ? imgID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ImgStog)) {
            return false;
        }
        ImgStog other = (ImgStog) object;
        if ((this.imgID == null && other.imgID != null) || (this.imgID != null && !this.imgID.equals(other.imgID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ImgStog[ imgID=" + imgID + " ]";
    }
    
}
