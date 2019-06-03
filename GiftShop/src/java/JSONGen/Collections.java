/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package JSONGen;

import java.math.BigDecimal;
import java.util.List;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;

/**
 *
 * @author johnn
 */
public class Collections {
    public static JsonArray getTypesJson(List<String[]> listPT){
        JsonArrayBuilder jab = Json.createArrayBuilder();
        for(String[] type : listPT){
                jab.add(getTypeJson(type));
        }
        return jab.build();
    }
    public static JsonObject getTypeJson(String[] type){
        return Json.createObjectBuilder()
                .add("coID", type[0])
                .add("coName",type[1])
                .add("coQuan",type[2])
                .build();
    }
    public static JsonObject getTypeThings(List<String[]> listPT, int pagenum, int pageno){
        return Json.createObjectBuilder()
                .add("listCo", getTypesJson(listPT))
                .add("pagenum", pagenum)
                .add("currPage", pageno)
                .build();
    }
}
