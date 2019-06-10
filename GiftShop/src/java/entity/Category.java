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
@Table(name = "category", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c"),
    @NamedQuery(name = "Category.findByCatID", query = "SELECT c FROM Category c WHERE c.catID = :catID"),
    @NamedQuery(name = "Category.findByCatName", query = "SELECT c FROM Category c WHERE c.catName = :catName"),
    @NamedQuery(name = "Category.findByStatusCategory", query = "SELECT c FROM Category c WHERE c.statusCategory = :statusCategory"),
    @NamedQuery(name = "Category.findByCateDescription", query = "SELECT c FROM Category c WHERE c.cateDescription = :cateDescription")})
public class Category implements Serializable {
    @OneToMany(mappedBy = "catID")
    private Collection<ProductType> productTypeCollection;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "catID", nullable = false)
    private Integer catID;
    @Size(max = 20)
    @Column(name = "catName", length = 20)
    private String catName;
    @Column(name = "statusCategory")
    private Boolean statusCategory;
    @Size(max = 255)
    @Column(name = "cateDescription", length = 255)
    private String cateDescription;
    @OneToMany(mappedBy = "catID")
    private Collection<Product> productCollection;

    public Category() {
    }

    public Category(String cateDescription,Integer catID, String catName) {
        this.catID = catID;
        this.catName = catName;
        this.cateDescription = cateDescription;
    }

    public Category(String cateDescription ,String catName, Boolean statusCategory) {
        
        this.catName = catName;
        this.statusCategory = statusCategory;
        this.cateDescription = cateDescription;
       
    }

    public Category(Integer catID) {
        this.catID = catID;
    }

    public Integer getCatID() {
        return catID;
    }

    public void setCatID(Integer catID) {
        this.catID = catID;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    public Boolean getStatusCategory() {
        return statusCategory;
    }

    public void setStatusCategory(Boolean statusCategory) {
        this.statusCategory = statusCategory;
    }

    public String getCateDescription() {
        return cateDescription;
    }

    public void setCateDescription(String cateDescription) {
        this.cateDescription = cateDescription;
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
        hash += (catID != null ? catID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Category)) {
            return false;
        }
        Category other = (Category) object;
        if ((this.catID == null && other.catID != null) || (this.catID != null && !this.catID.equals(other.catID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Category[ catID=" + catID + " ]";
    }

    @XmlTransient
    public Collection<ProductType> getProductTypeCollection() {
        return productTypeCollection;
    }

    public void setProductTypeCollection(Collection<ProductType> productTypeCollection) {
        this.productTypeCollection = productTypeCollection;
    }
    
}
