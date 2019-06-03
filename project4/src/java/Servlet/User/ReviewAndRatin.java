/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.User;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.ProductFacadeLocal;
import models.ReviewFacadeLocal;
import entity.Product;
import entity.Review;
import java.util.Collection;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;
import models.CustomerFacadeLocal;

/**
 *
 * @author johnn
 */
@WebServlet(name = "ReviewAndRatin", urlPatterns = {"/review"})
public class ReviewAndRatin extends HttpServlet {
    @EJB
    private CustomerFacadeLocal customerFacade;

    @EJB
    private ProductFacadeLocal productFacade;
    @EJB
    private ReviewFacadeLocal reviewFacade;
    
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String product = request.getParameter("proID");
        PrintWriter out = response.getWriter();
        String json = "[";
        int i = 0;
        List<Review> lisRe = em.createQuery("SELECT r FROM Review r WHERE r.proID = :proID")
                .setParameter("proID", productFacade.find(product))
                .getResultList();
        for(Review r : lisRe){
            json += "{";
            json += "\"title\":\""+r.getReviewTitle()+"\",";
            json += "\"content\":\""+r.getReviewContent()+"\",";
            json += "\"star\":\""+r.getStar()+"\",";
            json += "\"cusName\":\""+r.getCusID().getCusName()+"\"";
            json += "}";
            i++;
            if(i != lisRe.size()){
                json+=",";
            }
        }
        json+="]";
        out.println(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int star = Integer.parseInt(request.getParameter("star"));
        int cusid = Integer.parseInt(request.getParameter("cusid"));
        String product = request.getParameter("product");
        System.out.println(title+" "+content+" "+star+" "+cusid+" "+product);
        
        Review r = new Review();
        Product p = productFacade.find(product);
        r.setProID(p);
        r.setCusID(customerFacade.find(cusid));
        r.setReviewContent(content);
        r.setReviewTitle(title);
        r.setStar(star);
        
        Collection<Review> cr = p.getReviewCollection();
        cr.add(r);
        p.setReviewCollection(cr);
        System.out.println("number of stars: "+cr.size());
        double newavg = 0.0D;
        for(Review rv : cr){
            newavg += rv.getStar();
        }
        newavg = newavg/cr.size();
        System.out.println("new avgstar : "+newavg);
        p.setStarAVG(newavg);
        
        productFacade.edit(p);
        

    }
}
