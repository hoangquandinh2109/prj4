<%-- 
    Document   : test
    Created on : Jun 8, 2019, 8:33:29 PM
    Author     : USER
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
        <form action="RecomendServlet" method="post">
            <select name="cusid">
                <c:forEach items="${listcustomer}" var="item">
                    <option value="${item.cusID}">${item.cusName}</option>
                </c:forEach>
            </select>
            <input type="submit" value="submit" name="action">
        </form>
        ----------- danh sach cac san pham duoc goi y cung loai
        <table>
            <tr>
                <th>Name</th>
                <th>ID</th>
                <th>Price</th>
            </tr>
            <c:forEach var="item" items="${list}">
                <tr>
                    <td>${item.proName}</td>
                    <td>${item.proID}</td>
                    <td>${item.proPrice}</td>
                </tr>
            </c:forEach>
        </table>
        ------------------ cac san pham duoc goi y giong voi cai ten o tren ma co sao >= 3
        <table>
            <tr>
                <th>Name</th>
                <th>ID</th>
                <th>Price</th>
                <th>Type</th>
                <th>Customer</th>
            </tr>
            <c:forEach var="item" items="${listReview}">
                <tr>
                    <td>${item.proID.proName}</td>
                    <td>${item.proID.proID}</td>
                    <td>${item.proID.proPrice}</td>
                    <td>${item.proID.typeID.typeName}</td>
                    <td>${item.cusID.cusName}</td>
                </tr>
            </c:forEach>
        </table>
        -------------------------- cac san pham duoc goi y boi nhung thang giong thang o tren
        <table>
            <tr>
                <th>Name</th>
                <th>ID</th>
                <th>Price</th>
                <th>Type</th>
                <th>Customer</th>
                <th>ma rate</th>
            </tr>
            <c:forEach var="item" items="${listReview1}">
                <tr>
                    <td>${item.proID.proName}</td>
                    <td>${item.proID.proID}</td>
                    <td>${item.proID.proPrice}</td>
                    <td>${item.proID.typeID.typeName}</td>
                    <td>${item.cusID.cusName}</td>
                    <td>${item.rateID}</td>
                </tr>
            </c:forEach>
        </table>
        ---- danh sach may thang giong thang o tren 
        <table>
            <tr>
                <th>Name</th>
                <th>ID</th>
            </tr>
            <c:forEach var="item" items="${listC}">
                <tr>
                    <td>${item.cusName}</td>
                    <td>${item.cusID}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
