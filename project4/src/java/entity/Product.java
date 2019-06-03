/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Asus
 */
@Entity
@Table(name = "product", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p"),
    @NamedQuery(name = "Product.findByProID", query = "SELECT p FROM Product p WHERE p.proID = :proID"),
    @NamedQuery(name = "Product.findByProName", query = "SELECT p FROM Product p WHERE p.proName = :proName"),
    @NamedQuery(name = "Product.findByProPrice", query = "SELECT p FROM Product p WHERE p.proPrice = :proPrice"),
    @NamedQuery(name = "Product.findByQuantity", query = "SELECT p FROM Product p WHERE p.quantity = :quantity"),
    @NamedQuery(name = "Product.findByDateRelease", query = "SELECT p FROM Product p WHERE p.dateRelease = :dateRelease"),
    @NamedQuery(name = "Product.findByProStatus", query = "SELECT p FROM Product p WHERE p.proStatus = :proStatus"),
    @NamedQuery(name = "Product.findByTags", query = "SELECT p FROM Product p WHERE p.tags = :tags"),
    @NamedQuery(name = "Product.findByDiscout", query = "SELECT p FROM Product p WHERE p.discout = :discout"),
    @NamedQuery(name = "Product.findByStarAVG", query = "SELECT p FROM Product p WHERE p.starAVG = :starAVG")})
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "proID", nullable = false, length = 10)
    private String proID;
    @Size(max = 255)
    @Column(name = "proName", length = 255)
    private String proName;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "proDetails", length = 2147483647)
    private String proDetails;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "proPrice", precision = 53)
    private Double proPrice;
    @Column(name = "quantity")
    private Integer quantity;
    @Column(name = "DateRelease")
    @Temporal(TemporalType.DATE)
    private Date dateRelease;
    @Column(name = "proStatus")
    private Boolean proStatus;
    @Size(max = 255)
    @Column(name = "tags", length = 255)
    private String tags;
    @Column(name = "discout")
    private Integer discout;
    @Column(name = "starAVG", precision = 53)
    private Double starAVG;
    @JoinColumn(name = "catID", referencedColumnName = "catID")
    @ManyToOne
    private Category catID;
    @JoinColumn(name = "FeatureID", referencedColumnName = "FeatureID")
    @ManyToOne
    private Feature featureID;
    @JoinColumn(name = "typeID", referencedColumnName = "typeID")
    @ManyToOne
    private ProductType typeID;
    @OneToMany(mappedBy = "proID")
    private Collection<Wishlist> wishlistCollection;
    @OneToMany(mappedBy = "proID")
    private Collection<Review> reviewCollection;
    @OneToMany(mappedBy = "proID")
    private Collection<PurchaseItem> purchaseItemCollection;
    @OneToMany(mappedBy = "proID")
    private Collection<ImgStog> imgStogCollection;

    public Product() {
    }

    public Product(String proID, String proName, String proDetails, Double proPrice, Integer quantity, Date dateRelease, Boolean proStatus, String tags, Double starAVG, Category catID, ProductType typeID) {
        this.proID = proID;
        this.proName = proName;
        this.proDetails = proDetails;
        this.proPrice = proPrice;
        this.quantity = quantity;
        this.dateRelease = dateRelease;
        this.proStatus = proStatus;
        this.tags = tags;
        this.starAVG = starAVG;
        this.catID = catID;
        this.typeID = typeID;
    }

    public Product(String proID) {
        this.proID = proID;
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

    public String getProDetails() {
        return proDetails;
    }

    public void setProDetails(String proDetails) {
        this.proDetails = proDetails;
    }

    public Double getProPrice() {
        return proPrice;
    }

    public void setProPrice(Double proPrice) {
        this.proPrice = proPrice;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Date getDateRelease() {
        return dateRelease;
    }

    public void setDateRelease(Date dateRelease) {
        this.dateRelease = dateRelease;
    }

    public Boolean getProStatus() {
        return proStatus;
    }

    public void setProStatus(Boolean proStatus) {
        this.proStatus = proStatus;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public Integer getDiscout() {
        return discout;
    }

    public void setDiscout(Integer discout) {
        this.discout = discout;
    }

    public Double getStarAVG() {
        return starAVG;
    }

    public void setStarAVG(Double starAVG) {
        this.starAVG = starAVG;
    }

    public Category getCatID() {
        return catID;
    }

    public void setCatID(Category catID) {
        this.catID = catID;
    }

    public Feature getFeatureID() {
        return featureID;
    }

    public void setFeatureID(Feature featureID) {
        this.featureID = featureID;
    }

    public ProductType getTypeID() {
        return typeID;
    }

    public void setTypeID(ProductType typeID) {
        this.typeID = typeID;
    }

    @XmlTransient
    public Collection<Wishlist> getWishlistCollection() {
        return wishlistCollection;
    }

    public void setWishlistCollection(Collection<Wishlist> wishlistCollection) {
        this.wishlistCollection = wishlistCollection;
    }

    @XmlTransient
    public Collection<Review> getReviewCollection() {
        return reviewCollection;
    }

    public void setReviewCollection(Collection<Review> reviewCollection) {
        this.reviewCollection = reviewCollection;
    }

    @XmlTransient
    public Collection<PurchaseItem> getPurchaseItemCollection() {
        return purchaseItemCollection;
    }

    public void setPurchaseItemCollection(Collection<PurchaseItem> purchaseItemCollection) {
        this.purchaseItemCollection = purchaseItemCollection;
    }

    @XmlTransient
    public Collection<ImgStog> getImgStogCollection() {
        return imgStogCollection;
    }

    public void setImgStogCollection(Collection<ImgStog> imgStogCollection) {
        this.imgStogCollection = imgStogCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (proID != null ? proID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.proID == null && other.proID != null) || (this.proID != null && !this.proID.equals(other.proID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Product[ proID=" + proID + " ]";
    }
    
}
