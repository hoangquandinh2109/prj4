<%-- 
    Document   : 404
    Created on : May 22, 2019, 9:46:30 AM
    Author     : johnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="templates/head.jsp"></c:import>
        <style>
            #button-404{
                background-color: #76c4ce;
                color: #fff;
                font-family: 'MerriweatherSans';
                display: inline-block;
                padding: 15px;
                text-align: center;
                border: 1px solid #ededed;
            }
            
            #button-404:hover{
                background-color: #ee6c92;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="content-n-cart clearfix">
            <div class="content">
                <div class="clickdetrove"></div>
                <c:import url="templates/header.jsp"></c:import>
                <div class="web-body">
                    <div class="container">
                        <div class="text-center" style="padding: 50px 0;">
                            <h1>Oops, This Page Could Not Be Found!</h1>
                            <p>The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.</p>
                            <img style="display:block; width: max-content; margin: 0 auto; padding-bottom: 30px" src="${pageContext.request.contextPath}/img/404-image.png">
                            <a id="button-404" href="${pageContext.request.contextPath}">Go to Home page</a>
                        </div>
                    </div>
                </div>
                <c:import url="templates/footer.jsp"></c:import>
            </div>
            <c:import url="templates/cart-modal.jsp"></c:import>
        </div>
        <c:import url="templates/script.jsp"></c:import>
    </body>

</html>