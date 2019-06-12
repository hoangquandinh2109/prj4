/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import entity.Category;
import entity.Feature;
import entity.ImgStog;
import entity.Product;
import entity.ProductType;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.CategoryFacadeLocal;
import models.FeatureFacadeLocal;
import models.ImgStogFacadeLocal;
import models.ProductFacadeLocal;
import models.ProductTypeFacadeLocal;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class InsertProductServlet extends HttpServlet {

    @EJB
    private FeatureFacadeLocal featureFacade;

    @EJB
    private ImgStogFacadeLocal imgStogFacade;

    @EJB
    private ProductTypeFacadeLocal productTypeFacade;

    @EJB
    private CategoryFacadeLocal categoryFacade;

    @EJB
    private ProductFacadeLocal productFacade;
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

        // Tạo thư mục nếu nó không tồn tại.
        File fileSaveDir = new File(fullSavePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                String proID = "";
                Integer numOfProducts = Integer.valueOf(productFacade.count() + 1);
                switch (numOfProducts.toString().length()) {
                    case 1: // '\001'
                        proID = (new StringBuilder()).append("PR00").append(numOfProducts).toString();
                        break;

                    case 2: // '\002'
                        proID = (new StringBuilder()).append("PR0").append(numOfProducts).toString();
                        break;

                    case 3: // '\003'
                        proID = (new StringBuilder()).append("PR").append(numOfProducts).toString();
                        break;
                }
                String proName = multiparts.get(0).getString();
                String details = multiparts.get(1).getString();
                Double price = Double.parseDouble(multiparts.get(2).getString());
                int quantity = Integer.parseInt(multiparts.get(3).getString());
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                String date1 = multiparts.get(4).getString();
                Date dateRe = sdf.parse(date1);
                int cboCategory = Integer.parseInt(multiparts.get(5).getString());
                Category categoryid = categoryFacade.find(cboCategory);
                int cboType = Integer.parseInt(multiparts.get(6).getString());
                ProductType typeID = productTypeFacade.find(cboType);
                int cboFea = Integer.parseInt(multiparts.get(7).getString());
                Feature feaID = featureFacade.find(cboFea);
                Product product = new Product();
                product.setProID(proID);
                product.setProName(proName);
                product.setProDetails(details);
                product.setProPrice(price);
                product.setQuantity(quantity);
                product.setDateRelease(dateRe);
                product.setTags(null);
                product.setProStatus(true);
                product.setCatID(categoryid);
                product.setTypeID(typeID);
                product.setFeatureID(feaID);
                product.setStarAVG(Double.parseDouble("0"));
                product.setDiscout(0);
                productFacade.create(product);
                //  System.out.println(multiparts.get(8));;
                String tags = "";
                int i = 0;
                for (FileItem item : multiparts) {
                    if (item.getFieldName().toString().equals("tagInput")) {
                        tags = tags.concat(item.getString() + ":");
//                        System.out.println("trong for " + tags);
                    }
                    if (!item.isFormField()) {
                        String name = new File(item.getName()).getName();
                        item.write(new File(getServletContext().getRealPath("") + File.separator + SAVE_DIRECTORY + File.separator + name));
                        Product PID = productFacade.find(proID);
                        ImgStog newImg = new ImgStog();
                        newImg.setImgName(name);
                        newImg.setProID(PID);
                        i++;
                        newImg.setThumbnail(i == 1);
                        imgStogFacade.create(newImg);

                    }

                }
                Product pSingle = productFacade.find(product.getProID());
                pSingle.setProID(product.getProID());
                pSingle.setTags(tags);
                productFacade.edit(pSingle);
//                   System.out.println("ProID hien tai "+pSingle);
//                System.out.println("Ngoai for  "+tags);

                request.setAttribute("message", "Insert product successful.");
            } catch (Exception ex) {
                request.setAttribute("message", "File upload failed due to : " + ex);
            }
        } else {
            request.setAttribute("message", "Sorry this servlet only handles file upload request.");
        }
        request.getRequestDispatcher("showCatServlet").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
