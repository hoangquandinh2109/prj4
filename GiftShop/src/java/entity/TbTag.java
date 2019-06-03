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
@Table(name = "tbTag", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TbTag.findAll", query = "SELECT t FROM TbTag t"),
    @NamedQuery(name = "TbTag.findByTagID", query = "SELECT t FROM TbTag t WHERE t.tagID = :tagID"),
    @NamedQuery(name = "TbTag.findByTag", query = "SELECT t FROM TbTag t WHERE t.tag = :tag"),
    @NamedQuery(name = "TbTag.findByTagDescription", query = "SELECT t FROM TbTag t WHERE t.tagDescription = :tagDescription")})
public class TbTag implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tagID", nullable = false)
    private Integer tagID;
    @Size(max = 255)
    @Column(name = "tag", length = 255)
    private String tag;
    @Size(max = 255)
    @Column(name = "tag_description", length = 255)
    private String tagDescription;

    public TbTag() {
    }

    public TbTag( String tag, String tagDescription) {
        this.tag = tag;
        this.tagDescription = tagDescription;
    }

    public TbTag(Integer tagID) {
        this.tagID = tagID;
    }

    public Integer getTagID() {
        return tagID;
    }

    public void setTagID(Integer tagID) {
        this.tagID = tagID;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getTagDescription() {
        return tagDescription;
    }

    public void setTagDescription(String tagDescription) {
        this.tagDescription = tagDescription;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tagID != null ? tagID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TbTag)) {
            return false;
        }
        TbTag other = (TbTag) object;
        if ((this.tagID == null && other.tagID != null) || (this.tagID != null && !this.tagID.equals(other.tagID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.TbTag[ tagID=" + tagID + " ]";
    }
    
}
