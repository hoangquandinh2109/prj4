<%-- 
    Document   : demoajax
    Created on : May 9, 2019, 8:34:29 AM
    Author     : johnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="templates/head.jsp"></c:import>
    </head>
    <body>
        <h1>Hello World!</h1>
        <input id="myname">
        <input id="myage">
        <button id="check">Hello</button>
        <button id="searchDoc">fdf</button>
        <div id="results"></div>
        <c:import url="templates/script.jsp"></c:import>
        <script type="text/javascript">

        $(document).on("click", "#check", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
              event.preventDefault();
              var name=$("#myname").val();
              var age=$("#myage").val();


             $.ajax({
                    type: "POST",
                    url: "quanvip",
                    data:{"name":name,"age":age},
                    success: function(status){
                        console.log("Entered",status);
                    },
                    error:function(error){
                        console.log("error",error);
                    },

                });
        });
        
        $('#searchDoc').click(function() {
            event.preventDefault();
              var name=$("#myname").val();
              var age=$("#myage").val();
            $.ajax({
                type:"GET",
               data:{"name":name,"age":age},
               url: "quanvip",
               success: function(data) {
                   $('#results').html(data);
               }
            });
        });

        </script>
    </body>
</html>
