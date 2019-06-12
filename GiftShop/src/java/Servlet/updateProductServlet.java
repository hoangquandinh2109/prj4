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
                product.setTags(null);
                product.setProStatus(status);
                product.setCatID(categoryid);
                product.setTypeID(typeID);
                product.setFeatureID(fID);
                productFacade.edit(product);
                  String tags = "";
                /*
                 TODO CODE HERE
                 */
                int i = 0;
                for (FileItem item : multiparts) {
                      if (item.getFieldName().toString().equals("tagInput")) {
                        tags = tags.concat(item.getString() + ";");
//                        System.out.println("trong for " + tags);
                    }
                    if (!item.isFormField()) {
                        if (item.getSize() > 0) {
                            String name = new File(item.getName()).getName();
                            String id = new File(item.getFieldName()).getName();
                            int idImg = Integer.parseInt(id);
                            item.write(new File(getServletContext().getRealPath("") + File.separator + SAVE_DIRECTORY + File.separator + name));
                            Product PID = productFacade.find(proID);
                            i++;
                            ImgStog oldImg = imgStogFacade.find(idImg);
                            ImgStog is = new ImgStog(idImg, name,oldImg.getThumbnail(), PID);
                            imgStogFacade.edit(is);
                        } else {
                            System.out.println("Loi roiii");
                        } 
                    }

                }
                Product pSingle = productFacade.find(product.getProID());
                pSingle.setProID(product.getProID());
                pSingle.setTags(tags);
                productFacade.edit(pSingle);
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
