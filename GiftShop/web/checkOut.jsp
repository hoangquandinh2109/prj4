<%-- 
    Document   : checkOut
    Created on : Apr 25, 2019, 11:07:45 AM
    Author     : bemap
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="templates/head.jsp"></c:import>
            <link rel="stylesheet" href="assets/css/listProduct.css">

        </head>
        <body onload="hidedangcap();" ng-app="cangcucot">
            <div class="content-n-cart clearfix">
                <div class="content">
                    <div class="clickdetrove"></div>
                <c:import url="templates/header.jsp"></c:import>
                    <div class="web-body">
                        <div class="container">
                            <span style="text-align: center">YOUR CARC</span>
                            <div class="co-form-block">
                                <form>
                                    <div class="list-product">
                                        
                                    </div>
                                    <div class="total-n-submit">

                                    </div>
                                </form>
                            </div>
                        </div>
                    <c:import url="templates/footer.jsp"></c:import>
                    </div>
                </div>
            </div>
        <c:import url="templates/script.jsp"></c:import>
    </body>
</html>
