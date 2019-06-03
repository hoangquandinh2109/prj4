/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import static Servlet.InsertProductServlet.SAVE_DIRECTORY;
import entity.Category;
import entity.Feature;
import entity.ImgStog;
import entity.Product;
//import entity.ProImgtb;
import entity.ProductType;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import models.CategoryFacadeLocal;
import models.FeatureFacadeLocal;
import models.ImgStogFacadeLocal;
//import models.ProImgtbFacadeLocal;
import models.ProductFacadeLocal;
import models.ProductTypeFacadeLocal;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Asus
 */
public class updateProductServlet extends HttpServlet {

    @EJB
    private FeatureFacadeLocal featureFacade;

    @EJB
    private ImgStogFacadeLocal imgStogFacade;
    @EJB
    private ProductTypeFacadeLocal productTypeFacade;
    @EJB
    private ProductFacadeLocal productFacade;
    @EJB
    private CategoryFacadeLocal categoryFacade;

    private static final long serialVersionUID = 1L;
    public static final String SAVE_DIRECTORY = "productImage";

//            String proid = request.getParameter("id");
//            String name = request.getParameter("name");
//            String details = request.getParameter("details");
//            int price = Integer.parseInt(request.getParameter("price"));
//            int quantity = Integer.parseInt(request.getParameter("quantity"));
//            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
//            String date1 = request.getParameter("datepicker");
//            Date dateRe = sdf.parse(date1);
//            String tags = request.getParameter("tags");
//            int imgID = Integer.parseInt(request.getParameter("imgID"));
//             int proImgID = Integer.parseInt(request.getParameter("proImgid"));
//            boolean status;
//            if ("Active".equals(request.getParameter("status"))) {
//                status = true;
//            } else{
//                status=false;
//            }
//            int cboCate = Integer.parseInt(request.getParameter("cboCategory"));
//            int cboType = Integer.parseInt(request.getParameter("cboType"));
//            path = uploadFile(request);
//            entity.Product product = new entity.Product();
//            product.setProID(proid);
//            product.setProName(name);
//            product.setProDetails(details);
//            product.setProPrice(price);
//            product.setProStatus(true);
//            product.setDateRelease(dateRe);
//            product.setQuantity(quantity);
//            product.setTags(tags);
//            product.setProStatus(status);
//
//            //find catID 
//            Category cateID = categoryFacade.find(cboCate);
//            product.setCatID(cateID);
//            ProductType typeID = productTypeFacade.find(cboType);
//            product.setTypeID(typeID);
//            productFacade.edit(product);
//            entity.Product proIDD = productFacade.find(proid);
//            
//            ImgStog imgtog = new ImgStog();
//            imgtog.setImgID(imgID);
//            imgtog.setImgName(path);
//            imgStogFacade.edit(imgtog);
//            request.getRequestDispatcher("showProductServlet").forward(request, response);
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullSavePath = null;
        String appPath = request.getServletContext().getRealPath("");
        appPath = appPath.replace('\\', '/');
        if (appPath.endsWith("/")) {
            fullSavePath = appPath + SAVE_DIRECTORY;
        } else {
            fullSavePath = appPath + "/" + SAVE_DIRECTORY;
        }
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                System.out.println(multiparts);
//                System.out.println(multiparts.get(0).getString());
//                System.out.println(multiparts.get(1).getString());
//                System.out.println(multiparts.get(2).getString());
//                System.out.println(multiparts.get(3).getString());
//                System.out.println(multiparts.get(4).getString());
//                System.out.println(multiparts.get(5).getString());
//                System.out.println(multiparts.get(6).getString());
//                System.out.println(" status " + multiparts.get(7).getString());
//                System.out.println(multiparts.get(8).getString());
//                System.out.println("type " + multiparts.get(9).getString());
//                System.out.println("Fea " + multiparts.get(10).getString());
//                System.out.println("IMGID " + multiparts.get(11).getString());
//  s
                String proID = multiparts.get(0).getString();
                String proName = multiparts.get(1).getString();
                String details = multiparts.get(2).getString();
                double price = Double.parseDouble(multiparts.get(3).getString());
                int quantity = Integer.parseInt(multiparts.get(4).getString());
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                String date1 = multiparts.get(5).getString();
                Date dateRe = sdf.parse(date1);
                Boolean status = Boolean.valueOf(multiparts.get(6).getString());
                //Find cat ID
                int cboCategory = Integer.parseInt(multiparts.get(7).getString());
                Category categoryid = categoryFacade.find(cboCategory);
                int cboType = Integer.parseInt(multiparts.get(8).getString());
                ProductType typeID = productTypeFacade.find(cboType);
                int cboFr = Integer.parseInt(multiparts.get(9).getString());
                Feature fID = featureFacade.find(cboFr);

                Product product = new Product();
                product.setProID(proID);
                product.setProName(proName);
                product.setProDetails(details);
                product.setProPrice(price);
                product.setQuantity(quantity);
                product.setDateRelease(dateRe);
                product.setTags("");
                product.setProStatus(status);
                product.setCatID(categoryid);
                product.setTypeID(typeID);
                product.setFeatureID(fID);
                productFacade.edit(product);
//                int imgID1 = Integer.parseInt(multiparts.get(11).getString());
//                int imgID2 = Integer.parseInt(multiparts.get(12).getString());
                /*
                 TODO CODE HERE
                 */
                System.out.println("ditme");
                for (FileItem item : multiparts) {

                    if (!item.isFormField()) {
                        if (item.getSize() > 0) {
                            //int imgID = Integer.parseInt(request.getParameter("imgID"));
                            String name = new File(item.getName()).getName();

                            String id = new File(item.getFieldName()).getName();
                            int idImg = Integer.parseInt(id);
                            item.write(new File(getServletContext().getRealPath("") + File.separator + SAVE_DIRECTORY + File.separator + name));
                            System.out.println(name);
                            System.out.println(id);
                            System.out.println(item);
                            //  System.out.println(id);
////                        System.out.println(id);
                            Product PID = productFacade.find(proID);
                            System.out.println(item);
                            ImgStog is = new ImgStog(idImg, name, PID);
                            imgStogFacade.edit(is);
                        } else {
                            System.out.println("deoo co gi");
                        }

                    }

                }
                request.setAttribute("message", "Insert product successful.");
            } catch (Exception ex) {
                request.setAttribute("message", "File upload failed due to : " + ex);
            }
        } else {
            request.setAttribute("message", "Sorry this servlet only handles file upload request.");
        }
        request.getRequestDispatcher("showProductServlet").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
