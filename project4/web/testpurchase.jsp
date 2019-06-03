<%-- 
    Document   : testpurchase
    Created on : May 6, 2019, 9:54:08 AM
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
        <c:forEach items="${listP}" var="vip">
        <div class="itemvip">
            <p><span>ID: </span>${vip.proID}</p>
            <p><span>Ten san pham: </span>${vip.proName}</p>
            <p><span>Gia: </span>${vip.proPrice}</p>
            <p><span>Con lai: </span>${vip.quantity} san pham</p>
            <input id="proID-to-cart" type="hidden" name="proID" value="${vip.proID}">
            <button class="btn-add-to-cart">Purchase</button>
        </div>
    </c:forEach>
        <div id="results"></div>
        <c:import url="templates/script.jsp"></c:import>
    </body>
</html>
