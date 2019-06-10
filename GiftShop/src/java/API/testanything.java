/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package API;

import entity.ImgStog;
import entity.Product;
import entity.PurchaseItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.CategoryFacadeLocal;
import models.CustomerFacadeLocal;
import models.ProductFacadeLocal;
import models.ProductTypeFacadeLocal;

/**
 *
 * @author johnn
 */
@WebServlet(name = "abc", urlPatterns = {"/abc"})
public class testanything extends HttpServlet {
    @PersistenceContext(unitName = "project4PU")
    private EntityManager em;
    @EJB
    private ProductTypeFacadeLocal typefacade;
    @EJB
    private CategoryFacadeLocal catfacade;
    @EJB
    private ProductFacadeLocal productFacade;
    @EJB
    private CustomerFacadeLocal cus;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

}
