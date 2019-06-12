/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.User;

import com.sun.xml.ws.transport.tcp.io.OutputWriter;
import entity.Category;
import entity.Customer;
import entity.ProductType;
import entity.Review;
import entity.Wishlist;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Random;
import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdk.nashorn.internal.parser.JSONParser;
import models.CategoryFacadeLocal;
import models.CustomerFacadeLocal;
import models.ProductFacadeLocal;
import models.ProductTypeFacadeLocal;
import models.ReviewFacadeLocal;

/**
 *
 * @author bemap
 */
@WebServlet(name = "ProductDetail", urlPatterns = {"/product/*"})
public class Product extends HttpServlet {
    @EJB
    private CustomerFacadeLocal customerFacade;
    @EJB
    private ReviewFacadeLocal reviewFacade;
    @EJB
    private CategoryFacadeLocal proCat;
    @EJB
    private ProductTypeFacadeLocal proType;

    @EJB
    private ProductFacadeLocal productDB;
    
    HttpSession session;
    DecimalFormat fmd = new DecimalFormat("#.##");
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String model = "", id = "";
        String[] uris = new String[]{};
        try {
            uris = req.getPathInfo().substring(1).split("/");
            model = uris[0];
            try {
                id = uris[1];
            } catch (Exception e) {
                id = "";
            }
        } catch (Exception e) {
            model = "";
        }
        PrintWriter out = resp.getWriter();
        int pageno = 1;
        
        
        switch (model) {
            case "api":
                break;
            case "type":
            if(!id.isEmpty() && (!id.equals("page") && !id.equals("api"))){
                String name; // page name
                try {
                    name = proType.getNameType(Integer.parseInt(id));
                } catch (Exception e) {
                    name = null;
                }
                if(name == null){
                    getServletContext().getRequestDispatcher("/404.jsp").forward(req, resp);
                }
                else{
                     List<String[]> listCat = new ArrayList<>();
                     
       
                    String icon, catdescription;
                    for(Category c : proCat.FindCatStatus()){
                        try {
                            catdescription = c.getCateDescription().split(":")[0];
                            icon = c.getCateDescription().split(":")[1];
                        } catch (Exception e) {
                            catdescription = c.getCateDescription();
                            icon = "fa fa-gamepad";
                        }
                        listCat.add(new String[]{
                            c.getCatID()+"",
                            c.getCatName(),
                            catdescription,
                            icon
                        });
                    }
                    req.setAttribute("listCat", listCat);
                    
                    req.setAttribute("pagename", name);
                    req.setAttribute("collVal", id);
                    req.setAttribute("nameColl", "type");
                    req.setAttribute("maxPrice", productDB.getMaxPrice());
                    getServletContext().getRequestDispatcher("/product.jsp").forward(req, resp);
                }
            }else{
                //trang type
                req.setAttribute("pagename", "Types");
                try {
                    pageno = Integer.parseInt(uris[2]);
                } catch (Exception e) {
                    pageno = 1;
                }
                List<String[]> listPT = new ArrayList<>();
                int pagenum = 0, count = 0, countlist = 0, skip = (pageno-1) * 3;
                for(ProductType pt: proType.findAll()){
                    if(countlist>=skip){
                        if(count < 3){
                            listPT.add(new String[]{String.valueOf(pt.getTypeID()),pt.getTypeName(),proType.getQuanType(pt)+""});
                            count++;
                        }
                        
                    }
                    countlist++;
                    if(countlist % 3 == 0) pagenum++;
                }
                if (countlist % 3  > 0 && countlist % 3 < 3 ) pagenum++;
                if(!id.equals("api")){
                    req.setAttribute("listCollections", listPT);
                    req.setAttribute("h3name", "Types");
                    req.setAttribute("link", "type");
                    req.setAttribute("pagenum", pagenum);
                    req.setAttribute("currPage", pageno);
                    getServletContext().getRequestDispatcher("/collections.jsp").forward(req, resp);
                } else{
                    out.println(JSONGen.Collections.getTypeThings(listPT, pagenum, pageno));
                }
            }
                break;
            case "category":
            if(!id.isEmpty() && !id.equals("page") && !id.equals("api")){
                String name; // page name
                try {
                    name = proCat.getCategoryName(Integer.parseInt(id));
                } catch (Exception e) {
                    name = null;
                }
                if(name == null){
                    getServletContext().getRequestDispatcher("/404.jsp").forward(req, resp);
                }
                else{
                    
                     List<String[]> listCat = new ArrayList<>();
                     List<String[]> listType = new ArrayList<>();
       
                    String icon, catdescription;
                    for(Category c : proCat.FindCatStatus()){
                        try {
                            catdescription = c.getCateDescription().split(":")[0];
                            icon = c.getCateDescription().split(":")[1];
                        } catch (Exception e) {
                            catdescription = c.getCateDescription();
                            icon = "fa fa-gamepad";
                        }
                        listCat.add(new String[]{
                            c.getCatID()+"",
                            c.getCatName(),
                            catdescription,
                            icon
                        });
                    }
                    for(ProductType t : proType.FindTypeStatus()){
                        if(t.getCatID().getCatID() == Integer.parseInt(id)){
                            listType.add(new String[]{
                                t.getTypeID()+"",
                                t.getTypeName(),
                                proType.getQuanType(t)+""
                            });
                        }
                    }
                    req.setAttribute("listType", listType);
                    req.setAttribute("listCat", listCat);
                    req.setAttribute("pagename", name);
                    req.setAttribute("collVal", id);
                    req.setAttribute("nameColl", "category");
                    req.setAttribute("maxPrice", productDB.getMaxPrice());
                    getServletContext().getRequestDispatcher("/product.jsp").forward(req, resp);
                }
            }else{
                //trang category
                req.setAttribute("pagename", "Categories");
                try {
                    pageno = Integer.parseInt(uris[2]);
                } catch (Exception e) {
                    pageno = 1;
                }
                List<String[]> listPT = new ArrayList<>();
                int pagenum = 0, count = 0, countlist = 0, skip = (pageno-1) * 3;
                
                for(Category pt: proCat.findAll()){
                    if(countlist>=skip){
                        if(count < 3){
                            listPT.add(new String[]{String.valueOf(pt.getCatID()),pt.getCatName(), proCat.getCatQuan(pt)+""});
                            count++;
                        }
                    }
                    countlist++;
                    if(countlist % 3 == 0) {pagenum++;}
                }
                if (countlist % 3  > 0 && countlist % 3 < 3 ) pagenum++;
                if(!id.equals("api")){
                    req.setAttribute("listCollections", listPT);
                req.setAttribute("h3name", "Categories");
                req.setAttribute("link", "category");
                req.setAttribute("pagenum", pagenum);
                req.setAttribute("currPage", pageno);
                    getServletContext().getRequestDispatcher("/collections.jsp").forward(req, resp);
                } else{
                    out.println(JSONGen.Collections.getTypeThings(listPT, pagenum, pageno));
                }
            }
                break;
            case "v":
            if(!id.isEmpty()){
                entity.Product p = productDB.getSingleProduct(id);
                if(p != null && p.getProStatus()){
                    
                    req.setAttribute("thisP", p);
                    req.setAttribute("thisImg", productDB.imageOf(p));
                    req.setAttribute("otherImgs", productDB.imagesOf(p));
                    req.setAttribute("pagename", p.getProName());
                    req.setAttribute("url", req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/product/v/"+id);
                    session = req.getSession();
                    req.setAttribute("onWishlist", onWoC(p.getWishlistCollection(), session));
                    try {
                        int cusid = (int) session.getAttribute("sessionid");
                        rcm(req, resp, p, cusid);
                        if(!reviewFacade.checkIfCusRatingThis(customerFacade.find(cusid), p)){
                            req.setAttribute("allowRV", 1);
                        }else{
                            req.setAttribute("allowRV", 0);
                        }
                    } catch (Exception e) {
                        req.setAttribute("allowRV", 1);
                    }
                    
                    getServletContext().getRequestDispatcher("/proDetails.jsp").forward(req, resp);
                }else{
                    getServletContext().getRequestDispatcher("/404.jsp").forward(req, resp);
                }
            } else{
                getServletContext().getRequestDispatcher("/404.jsp").forward(req, resp);
            }
                break;
            default:
                getServletContext().getRequestDispatcher("/404.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
    
    ///Product on Wishlist of Customer
    private boolean onWoC(Collection<Wishlist> cw, HttpSession session) {
        try {
            int cusid = (int) session.getAttribute("sessionid");
            for(Wishlist wh : cw){
                if(wh.getCusID().getCusID() == cusid){
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }
    
    protected void rcm(HttpServletRequest request, HttpServletResponse response, entity.Product p, int c)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

            String action = request.getParameter("action");
            List<Customer> listCustomer = new ArrayList<>();
            
                entity.Product pro = p;
                int cusid = c;
                Customer customer = customerFacade.find(cusid);
                List<entity.Product> list = RecomendProduct(pro);
                
                List<Customer> listCus = nearestCustomer(customer, 0.3);
                List<Review> listReview = CustomerNearestProduct(customer);
                List<Review> listReview1 = new ArrayList<>();
                List<Review> listReview2 = new ArrayList<>();
                for (int i = 0; i < listCus.size(); i++) {
                    listReview1.addAll(listCus.get(i).getReviewCollection());
                }
                for (int i = 0; i < listReview.size(); i++) {
                    if(listReview.get(i).getStar() >= 4){
                        listReview2.add(listReview.get(i));
                    }
                }
                int j = 0;
                while(j < reviewFacade.findAll().size()){
                    
                    j++;
                }
                String detaillink = "http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/product/v/";
                String imglink = "http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/productImage/";
                List<String[]> youmaylike = new ArrayList<>();
                
                for(Review r : listReview1){
                    youmaylike.add(new String[]{
                        r.getProID().getProID(),
                        detaillink+r.getProID().getProID(),
                        r.getProID().getProName(),
                        imglink+productDB.imageOf(r.getProID()),
                        "$"+r.getProID().getProPrice(),
                        "$"+newprice(r.getProID()),
                        (r.getProID().getStarAVG()/5*100)+"%",
                        r.getProID().getReviewCollection().size()+"",
                        onWoC(r.getProID().getWishlistCollection())+""
                    });
                }
                List<String[]> samecat = new ArrayList<>();
                
                for(entity.Product pl : list){
                    samecat.add(new String[]{
                        pl.getProID(),
                        detaillink+pl.getProID(),
                        pl.getProName(),
                        imglink+productDB.imageOf(pl),
                        "$"+pl.getProPrice(),
                        "$"+newprice(pl),
                        (pl.getStarAVG()/5*100)+"%",
                        pl.getReviewCollection().size()+"",
                        onWoC(pl.getWishlistCollection())+""
                    });
                }
                request.setAttribute("samecat", samecat);
                request.setAttribute("youmaylike", youmaylike);
                request.setAttribute("listReview", listReview2);
                request.setAttribute("listC", listCus);
                

            Random rd = new Random();

    }
    
    private String newprice(entity.Product p) {
        return (p.getDiscout() == 0)? "0.0" : fmd.format((100 - p.getDiscout()) * p.getProPrice() /100);
    }
    private boolean onWoC(Collection<Wishlist> cw) {
        try {
            int cusid = (int) session.getAttribute("sessionid");
            for(Wishlist wh : cw){
                if(wh.getCusID().getCusID() == cusid){
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }
    private List<Review> CustomerNearestProduct(Customer customer) {
        List<Review> listReview = new ArrayList<>();
        List<Review> listReview2 = new ArrayList<>();
        List<Customer> listCus = nearestCustomer(customer, 0.3);
        List<Review> listReview1 = new ArrayList<>(customer.getReviewCollection());
        for (Customer customer1 : listCus) {
            listReview.addAll(customer1.getReviewCollection());
        }
        int i = 0;
        while (i < listReview1.size()) {
            String proid1 = listReview1.get(i).getProID().getProID();
            for (int j = 0; j < listReview.size(); j++) {
                String proid2 = listReview.get(j).getProID().getProID();

                if (proid1.equals(proid2)) {
                    listReview.remove(j);
                }
            }
            i++;
        }
//        int k = 0;
//        while (k < listReview2.size()) {
//            String proid11 = listReview.get(k).getProID().getProID();
//            for (int l = 0; l < listReview1.size(); l++) {
//                String proid22 = listReview1.get(l).getProID().getProID();
//                if (proid11.equals(proid22)) {
//                    listReview2.remove(l);
//                }
//            }
//            k++;
//        }

        return listReview;
    }

    private List<entity.Product> RecomendProduct(entity.Product product) {
        List<entity.Product> listP = new ArrayList<>();
        List<entity.Product> listR = new ArrayList<>();
        listP = productDB.findAll();
        for (int i = 0; i < listP.size(); i++) {
            if (!product.getProID().equals(listP.get(i).getProID())
                    && product.getCatID().getCatID().equals(listP.get(i).getCatID().getCatID())) {
                listR.add(listP.get(i));
            }
        }
        return listR;
    }
    private List<entity.Product> RecomendProductT(entity.Product product) {
        List<entity.Product> listP = new ArrayList<>();
        List<entity.Product> listR = new ArrayList<>();
        listP = productDB.findAll();
        for (int i = 0; i < listP.size(); i++) {
            if (!product.getProID().equals(listP.get(i).getProID())
                    && product.getTypeID().getTypeID().equals(listP.get(i).getTypeID().getTypeID())) {
                listR.add(listP.get(i));
            }
        }
        return listR;
    }

    // thuat toan tinh diem giong nhau cua 2 doi tuong
    private double caculateNeighbor(Customer cus1, Customer cus2) {
        int count = 0;
        double similarity = 0;
        double sumdiff = 0;
        double diff = 0;
        for (Review r1 : cus1.getReviewCollection()) {
            for (Review r2 : cus2.getReviewCollection()) {
                entity.Product p1 = r1.getProID();
                entity.Product p2 = r2.getProID();
                if (p1.getProID().equals(p2.getProID())) {
                    diff += r1.getStar() - r2.getStar();
                    sumdiff += diff * diff;
                    count++;
                }
            }
        }
        if (count > 0) {
            similarity = 1 / (Math.sqrt(sumdiff) + 1);
        }
        System.out.println(similarity);
        return similarity;
    }

    private List<Customer> nearestCustomer(Customer activeCus, double nearestnumber) {
        List<Customer> listCus = new ArrayList<>(customerFacade.findAll());
        List<Customer> listCusOther = new ArrayList<>();
        for (Customer Othercustomer : listCus) {
            if (!Othercustomer.getCusID().equals(activeCus.getCusID())) {
                double similarityOther = caculateNeighbor(activeCus, Othercustomer);
                if (similarityOther > nearestnumber) {
                    listCusOther.add(Othercustomer);
                }
            }
        }
        return listCusOther;
    }
    
}
