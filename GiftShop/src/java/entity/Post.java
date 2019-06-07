/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.text.ParseException;
import java.util.Collection;
import java.util.Date;
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
 * @author bemap
 */
@Entity
@Table(name = "post", catalog = "projectSem4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Post.findAll", query = "SELECT p FROM Post p"),
    @NamedQuery(name = "Post.findByPostID", query = "SELECT p FROM Post p WHERE p.postID = :postID"),
    @NamedQuery(name = "Post.findByTitlePost", query = "SELECT p FROM Post p WHERE p.titlePost = :titlePost"),
    @NamedQuery(name = "Post.findByInfontContent", query = "SELECT p FROM Post p WHERE p.infontContent = :infontContent"),
    @NamedQuery(name = "Post.findByTitleContent", query = "SELECT p FROM Post p WHERE p.titleContent = :titleContent"),
    @NamedQuery(name = "Post.findByDateRealease", query = "SELECT p FROM Post p WHERE p.dateRealease = :dateRealease"),
    @NamedQuery(name = "Post.findByPostStatus", query = "SELECT p FROM Post p WHERE p.postStatus = :postStatus"),
    @NamedQuery(name = "Post.findByPostTag", query = "SELECT p FROM Post p WHERE p.postTag = :postTag")})
public class Post implements Serializable {
    @OneToMany(mappedBy = "postLiked")
    private Collection<Likes> likesCollection;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "postID", nullable = false)
    private Integer postID;
    @Size(max = 500)
    @Column(name = "titlePost", length = 500)
    private String titlePost;
    @Size(max = 500)
    @Column(name = "infontContent", length = 500)
    private String infontContent;
    @Size(max = 1073741823)
    @Column(name = "titleContent", length = 1073741823)
    private String titleContent;
    @Column(name = "dateRealease")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateRealease;
    @Column(name = "postStatus")
    private Boolean postStatus;
    @Size(max = 500)
    @Column(name = "postTag", length = 500)
    private String postTag;
    @JoinColumn(name = "cusID", referencedColumnName = "cusID")
    @ManyToOne
    private Customer cusID;
    @OneToMany(mappedBy = "postID")
    private Collection<Comment> commentCollection;

    public Post() {
    }
 public Post(String titlePost, String infontContent, String titleContent) {

        this.titlePost = titlePost;
        this.infontContent = infontContent;
        this.titleContent = titleContent;

    }

    public Post(String titlePost, String infontContent, String titleContent,Date date, String postTag, Customer cusID) throws ParseException {
      
        this.titlePost = titlePost;
        this.infontContent = infontContent;
        this.titleContent = titleContent;
        this.postStatus = true;
        this.dateRealease = date;
        this.postTag = postTag;
        this.cusID = cusID;
    }


    public Post(Integer postID) {
        this.postID = postID;
    }

    public Integer getPostID() {
        return postID;
    }

    public void setPostID(Integer postID) {
        this.postID = postID;
    }

    public String getTitlePost() {
        return titlePost;
    }

    public void setTitlePost(String titlePost) {
        this.titlePost = titlePost;
    }

    public String getInfontContent() {
        return infontContent;
    }

    public void setInfontContent(String infontContent) {
        this.infontContent = infontContent;
    }

    public String getTitleContent() {
        return titleContent;
    }

    public void setTitleContent(String titleContent) {
        this.titleContent = titleContent;
    }

    public Date getDateRealease() {
        return dateRealease;
    }

    public void setDateRealease(Date dateRealease) {
        this.dateRealease = dateRealease;
    }

    public Boolean getPostStatus() {
        return postStatus;
    }

    public void setPostStatus(Boolean postStatus) {
        this.postStatus = postStatus;
    }

    public String getPostTag() {
        return postTag;
    }

    public void setPostTag(String postTag) {
        this.postTag = postTag;
    }

    public Customer getCusID() {
        return cusID;
    }

    public void setCusID(Customer cusID) {
        this.cusID = cusID;
    }

    @XmlTransient
    public Collection<Comment> getCommentCollection() {
        return commentCollection;
    }

    public void setCommentCollection(Collection<Comment> commentCollection) {
        this.commentCollection = commentCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (postID != null ? postID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Post)) {
            return false;
        }
        Post other = (Post) object;
        if ((this.postID == null && other.postID != null) || (this.postID != null && !this.postID.equals(other.postID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Post[ postID=" + postID + " ]";
    }

    @XmlTransient
    public Collection<Likes> getLikesCollection() {
        return likesCollection;
    }

    public void setLikesCollection(Collection<Likes> likesCollection) {
        this.likesCollection = likesCollection;
    }
    
}
