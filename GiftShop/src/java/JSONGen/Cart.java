/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package JSONGen;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.List;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;

/**
 *
 * @author johnn
 */
public class Cart {
        DecimalFormat fmd = new DecimalFormat("#.##");
    public static JsonObject getTypeJson(entity.Cart cart, String img){
        Double proprice;
        proprice =  (cart.getProduct().getProPrice() * (100-cart.getProduct().getDiscout()) / 100);
        return Json.createObjectBuilder()
                .add("ID",cart.getId())
                .add("quantity", cart.getQuantity())
                .add("proID", cart.getProduct().getProID())
                .add("proName", cart.getProduct().getProName())
                .add("proPrice", proprice)
                .add("proImg", img)
                .build();
    }
    public static JsonObject getTypeThings(JsonArray cart, Double total){
        return Json.createObjectBuilder()
                .add("listCI", cart)
                .add("total", total)
                .build();
    }
}
