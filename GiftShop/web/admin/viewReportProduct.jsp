<%-- 
    Document   : viewReportProduct
    Created on : Jun 9, 2019, 3:15:38 PM
    Author     : Asus
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Table row -->
        <div class="row">
            <div id="example1" class="col-xs-12 table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Sale No.</th>
                            <th>Category  Name</th>

                            <th>Price</th>
                            <th>Order Date</th>
                            <th>Product name</th>
                            <th>Total </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="e" items="${reportList}">
                            <tr>
                                <td>${e.purID}</td>
                                
                                <td>${e.totalPrice}</a></td>
                                <td>${e.proName}</td>
                                <td><fmt:formatDate value="${e.dateOrderPlaced}" pattern="dd-MM-yyyy" /></td>
                                <td>                                                       
                                    <c:if test="${e.purchaseStatus eq '2'}">
                                        <span class="label label-success">Completed</span>
                                    </c:if>
                                    <c:if test="${e.purchaseStatus eq '1'}">
                                        <span class="label label-info">Shipping</span>
                                    </c:if>
                                    <c:if test="${e.purchaseStatus eq '0'}">
                                        <span class="label label-warning">Process</span>
                                    </c:if>
                                    <c:if test="${e.purchaseStatus eq '3'}">
                                        <span class="label label-danger">Cancel</span>
                                    </c:if>
                                </td>

                                <td>
                                    <c:choose>
                                        <c:when test = "${e.purchaseStatus eq '3'}">
                                            $0
                                        </c:when>
                                        <c:otherwise>
                                            $${e.finalTotal}
                                        </c:otherwise>
                                    </c:choose>    
                                </td>

                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-xs-6">
                <div class="table-responsive">
                    <table class="table">
                        <tr>
                        <h3 style="color: red"><b>The total of order have status completed :</b> <span>$<fmt:formatNumber value="${totalProfit}" maxFractionDigits="0"/></span></h3>
                        </tr>
                    </table>
                </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </body>
</html>
