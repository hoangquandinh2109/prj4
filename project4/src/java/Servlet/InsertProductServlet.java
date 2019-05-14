/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import entity.Category;
import entity.ImgStog;
import entity.ProImgtb;
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
import models.ImgStogFacadeLocal;
import models.ProImgtbFacadeLocal;
import models.ProductFacadeLocal;
import models.ProductTypeFacadeLocal;

@MultipartConfig
public class InsertProductServlet extends HttpServlet {
    @EJB
    private ProductTypeFacadeLocal productTypeFacade;
    @EJB
    private ProImgtbFacadeLocal proImgtbFacade;
    @EJB
    private ImgStogFacadeLocal imgStogFacade;
    @EJB
    private CategoryFacadeLocal categoryFacade;
    @EJB
    private ProductFacadeLocal productFacade;

    private static final long serialVersionUID = 1L;
    private String path = "";
    public static final String SAVE_DIRECTORY = "uploadDir";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
 String proid = request.getParameter("id");
            String name = request.getParameter("name");
            String details = request.getParameter("details");
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
            String date1 = request.getParameter("datepicker");
            Date dateRe = sdf.parse(date1);
            String tags = request.getParameter("tags");  
            int cboCate = Integer.parseInt(request.getParameter("cboCategory"));
            int cboType = Integer.parseInt(request.getParameter("cboType"));
            path = uploadFile(request);
            entity.Product product = new entity.Product();
            product.setProID(proid);
            product.setProName(name);
            product.setProDetails(details);
            product.setProPrice(price);
            product.setProStatus(true);
            product.setDateRelease(dateRe);
            product.setQuantity(quantity);
            product.setTags(tags);
            //find catID 
            Category categoryid = categoryFacade.find(cboCate);
            product.setCatID(categoryid);
            ProductType typeID = productTypeFacade.find(cboType);
            product.setTypeID(typeID);
            productFacade.create(product);
            entity.Product proIDD = productFacade.find(proid); 
            ImgStog imgtog = new ImgStog();
            imgtog.setImgName(path);
            imgStogFacade.create(imgtog);
            ProImgtb proimg = new ProImgtb();
            proimg.setImgID(imgtog);
            proimg.setProID(proIDD);
            proImgtbFacade.create(proimg);        
            request.getRequestDispatcher("showProductServlet").forward(request, response);
           
        }
    }

    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        String filePath = "";
        try {
            Part filePart = request.getPart("file");
            // fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            fileName = (String) getFileName(filePart);
            String basePath = getServletContext().getRealPath("") + File.separator + SAVE_DIRECTORY + File.separator;
            //      String warFile = basePath.substring(0, basePath.length() - 74) + "\\KTBPerfumeProject-war\\web\\images" + File.separator + SAVE_DIRECTORY + File.separator;

            File uploadDir = new File(basePath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            InputStream inputStream = null;
            OutputStream outputStream = null;
            filePath = getServletContext().getContextPath() + SAVE_DIRECTORY + "\\" + fileName;
            try {

                File outputFilePath = new File(basePath + fileName);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            } catch (Exception e) {
                e.printStackTrace();
                fileName = "";
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileName;
    }

    private String getFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(InsertProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(InsertProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
