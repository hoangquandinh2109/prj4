<%-- 
    Document   : acc-manage
    Created on : May 25, 2019, 11:00:32 AM
    Author     : johnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="templates/head.jsp"></c:import>
    </head>
    <body ng-app="cangcucot">
        <div class="content-n-cart clearfix">
            <div class="content">
                <div class="clickdetrove"></div>
                <c:import url="templates/header.jsp"></c:import>
                <div class="web-body">
                    <div class="container">
                        
                    </div>
                </div>
                <c:import url="templates/footer.jsp"></c:import>
            </div>
            <c:import url="templates/cart-modal.jsp"></c:import>
        </div>
        <c:import url="templates/script.jsp"></c:import>
    </body>

</html>
