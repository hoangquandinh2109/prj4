<%-- 
    Document   : listPurchase
    Created on : May 29, 2019, 12:16:25 AM
    Author     : Asus
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="../templates/adminHead.jsp"></c:import>
        <c:import url="../templates/datatablecss.jsp"></c:import>
        </head>
        <body class="app sidebar-mini rtl">
        <c:import url="../templates/adminPage.jsp"></c:import>

        <main class="app-content">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-edit"></i>List Products</h1>
                    <p>List products</p>
                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item">Forms</li>
                    <li class="breadcrumb-item"><a href="#">Sample Forms</a></li>
                </ul>
            </div>  
            <div id="wrap" class="table-responsive">
                <table id="example" class="table table-striped table-bordered display">
                    <thead>
                        <tr>
                            <th>Purchase ID</th>
                            <th>Cus ID</th>

                            <th>Price</th>
                            <th>EMail</th>
                            <th>Status </th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listPuritem}" var="s">
                        <tr>
                            <td>${s.purID.purID}</td>
                            <td>${s.purID.cusID.cusName}</td>
                            <!--<td>  
                            <%--<fmt:formatDate value="${s.dateOrderPlaced}" pattern="yyyy-MM-dd" />--%>
                            </td>-->
                            <td>
                                ${s.purID.totalPrice}
                            </td>
                            <td>
                                ${s.purID.cusID.cusEmail}
                            </td>
                            <c:if test="${s.purID.purchaseStatus == 0}">
                                <td>
                                    Process
                                </td>  
                            </c:if>
                            <c:if test="${s.purID.purchaseStatus == 1}">
                                <td>
                                    Shipping 
                                </td>  
                            </c:if>
                            <c:if test="${s.purID.purchaseStatus == 2}">
                                <td>
                                    Completed
                                </td>  
                            </c:if> 
                            <c:if test="${s.purID.purchaseStatus == 3 }">
                                <td>
                                    Cancle  
                                </td>  
                            </c:if>

                            <c:if test="${s.purID.purchaseStatus == 0 }">        
                                <td>
                                    <a class="btn btn-primary btn-sm" href="changeStatusServlet?purID=${s.purID.purID}&puritem=${s.purItemID}&proID=${s.proID.proID}&status=1">Shipping</a>
                                    <a class="btn btn-primary btn-sm" href="changeStatusServlet?purID=${s.purID.purID}&puritem=${s.purItemID}&proID=${s.proID.proID}&status=3">Hoan don</a>
                                </td>
                            </c:if>
                            <c:if test="${s.purID.purchaseStatus == 1 }">
                                <td>
                                    <a class="btn btn-primary btn-sm" href="changeStatusServlet?purID=${s.purID.purID}&puritem=${s.purItemID}&proID=${s.proID.proID}&status=2">Completed</a>
                                    <a class="btn btn-primary btn-sm" href="changeStatusServlet?purID=${s.purID.purID}&puritem=${s.purItemID}&proID=${s.proID.proID}&status=3">Hoan don</a>
                                </td>
                            </c:if>

                            <c:if test="${s.purID.purchaseStatus == 2 }">
                                <td>
                                    <a class="btn btn-primary btn-sm" href="changeStatusServlet?purID=${s.purID}">Details</a>
                                </td>
                            </c:if>
                            <c:if test="${s.purID.purchaseStatus == 3 }">
                                <td>
                                    <a class="btn btn-primary btn-sm" href="changeStatusServlet?purID=${s.purID}">Detaisl da can</a>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="clearix"></div>
            <div class="col-md"></div>
        </div>
    </main>
    <c:import url="../templates/adminScript.jsp"></c:import>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#example').DataTable();
        });
    </script>
</body>
</html>
