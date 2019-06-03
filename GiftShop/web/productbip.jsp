<%-- 
    Document   : productbip
    Created on : May 17, 2019, 1:25:49 PM
    Author     : johnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table id="demo"></table>
        <c:import url="templates/script.jsp"></c:import>
        <script>
            $.ajax({
                type: "GET",
                dataType: 'json',
                contentType: 'application/json',
                url: "api/product",
                success: function(data) {
                    console.log("success");
                    
//                    console.log(data);
                    $.each(data, function(key, value) {
                        console.log(value.proName);
                        $("#demo").append("<tr>");
                        var listSiteClass = "";
                        listSiteClass = listSiteClass + "<td>" + value.proID + "</td>";
                        listSiteClass = listSiteClass + "<td>" + value.proName + "</td>";
                        listSiteClass = listSiteClass + "<td>" + value.proPrice + "</td>";
                        listSiteClass = listSiteClass + "<td>" + value.date + "</td>";
                        listSiteClass = listSiteClass + "<td>" + value.type + "</td>";
                        
                        $("#demo").append(listSiteClass);
                        $("#demo").append("</tr>");
                    });
                    
                },
                error: function() {
                    console.log("error");
                },
            });

        </script>
    </body>
</html>
