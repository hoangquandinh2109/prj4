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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "Feature", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Feature.findAll", query = "SELECT f FROM Feature f"),
    @NamedQuery(name = "Feature.findByFeatureID", query = "SELECT f FROM Feature f WHERE f.featureID = :featureID"),
    @NamedQuery(name = "Feature.findByFname", query = "SELECT f FROM Feature f WHERE f.fname = :fname"),
    @NamedQuery(name = "Feature.findByFdescription", query = "SELECT f FROM Feature f WHERE f.fdescription = :fdescription"),
    @NamedQuery(name = "Feature.findByStatusFeature", query = "SELECT f FROM Feature f WHERE f.statusFeature = :statusFeature")})
public class Feature implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "FeatureID", nullable = false)
    private Integer featureID;
    @Size(max = 50)
    @Column(name = "Fname", length = 50)
    private String fname;
    @Size(max = 255)
    @Column(name = "Fdescription", length = 255)
    private String fdescription;
    @Column(name = "statusFeature")
    private Boolean statusFeature;
    @OneToMany(mappedBy = "featureID")
    private Collection<Product> productCollection;

    public Feature() {
    }

    public Feature(Integer featureID) {
        this.featureID = featureID;
    }

    public Integer getFeatureID() {
        return featureID;
    }

    public void setFeatureID(Integer featureID) {
        this.featureID = featureID;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getFdescription() {
        return fdescription;
    }

    public void setFdescription(String fdescription) {
        this.fdescription = fdescription;
    }

    public Boolean getStatusFeature() {
        return statusFeature;
    }

    public void setStatusFeature(Boolean statusFeature) {
        this.statusFeature = statusFeature;
    }

    @XmlTransient
    public Collection<Product> getProductCollection() {
        return productCollection;
    }

    public void setProductCollection(Collection<Product> productCollection) {
        this.productCollection = productCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (featureID != null ? featureID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Feature)) {
            return false;
        }
        Feature other = (Feature) object;
        if ((this.featureID == null && other.featureID != null) || (this.featureID != null && !this.featureID.equals(other.featureID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Feature[ featureID=" + featureID + " ]";
    }
    
}
