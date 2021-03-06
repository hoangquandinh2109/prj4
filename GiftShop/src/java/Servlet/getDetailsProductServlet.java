package Servlet;

import entity.Category;
import entity.Feature;
import entity.ImgStog;
import entity.Product;
import entity.ProductType;
import entity.TbTag;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.CategoryFacadeLocal;
import models.FeatureFacadeLocal;
import models.ImgStogFacadeLocal;
import models.ProductFacadeLocal;
import models.ProductTypeFacadeLocal;
import models.TbTagFacade;
import models.TbTagFacadeLocal;

/**
 *
 * @author Asus
 */
public class getDetailsProductServlet extends HttpServlet {

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
    @EJB
    private TbTagFacadeLocal tbTagF;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String code = request.getParameter("code");

            // entity.Product product = productFacade.find(code);
            List<Category> listCate = categoryFacade.FindCatStatus();
            List<ProductType> listTyp = productTypeFacade.FindTypeStatus();
            List<ImgStog> listImg = imgStogFacade.findAll();
            List<Feature> listF = featureFacade.FindFeaStatus();
            Product product = productFacade.find(code);
            List<ImgStog> img = imgStogFacade.findList(product);
            List<TbTag> listTag = tbTagF.findAll();
            request.setAttribute("tags", listTag);
            /// Ngu vl
//            List<String> any = new ArrayList<String>();
//            String tagCurrent[] = product.getTags().split(";");
//            for (int i = 0; i < tagCurrent.length; i++) {
//                any.add(tagCurrent[i]);
//            }
//            ///
            request.setAttribute("listCat", listCate);
            request.setAttribute("listType", listTyp);

            request.setAttribute("listF", listF);
            //request.setAttribute("product", product);
            request.setAttribute("imgg", listImg);
            request.setAttribute("listImg", img);
            request.setAttribute("product", product);
            request.getRequestDispatcher("admin/updateProduct.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
