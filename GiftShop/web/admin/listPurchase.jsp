<%-- 
    Document   : listPurchase
    Created on : May 29, 2019, 12:16:25 AM
    Author     : Asus
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="../templates/adminHead.jsp"></c:import>
            <!--<link rel="stylesheet" href="$.{pageContext.request.contextPath}/assets/library/bootstrap/css/bootstrap.min.css"/>-->
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
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a></li>
            </ul>
        </div>
        <div class="wrapper">
            <!-- Main content -->
            <section class="content d-none d-print-block">
                <!-- title row -->
                <div class="row">
                    <div class="col-xs-12">
                        <h2 class="page-header">
                            &nbsp; &nbsp;<i class="fa fa-globe"></i> Cangcucotv2, Group 4.
                            <br/>
                            &nbsp; &nbsp;<small class="pull-right">Date:<i id="date"></i></small>
                        </h2>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- info row -->
                <div class="row invoice-info d-none d-print-block">
                    <div class="col-sm-4 invoice-col">
                        &nbsp;   Addess
                        <address>
                            <strong> &nbsp; &nbsp;Admin, Inc.</strong><br>
                            &nbsp; &nbsp;  590 Cach mang thang 8, District 3<br>     
                            &nbsp; &nbsp;  Phone: (804) 123-5432<br>
                            &nbsp; &nbsp;  Email: cangcucotV2@gmail.com
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        &nbsp; &nbsp;  <b>Invoice #007612</b><br>
                        &nbsp; &nbsp;  <br>
                        &nbsp; &nbsp;   <b>Order ID:</b> 4F3S8J<br>
                        &nbsp; &nbsp;   <b>Payment Due:</b> 2/22/2014<br>
                        &nbsp; &nbsp;   <b>Account:</b> 968-34567
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </section>
            <div id="wrap" class="table-responsive">
                <table id="example" class="table table-striped table-bordered display">
                    <thead>
                        <tr>
                            <th>Purchase ID</th>
                            <th>Customer Name</th>
                            <th>Customer Email</th>
                            <th>Date Order</th>
                            <th>Date Paid</th>
                            <th>Total Price</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listPur}" var="s">
                            <tr>
                                <td>${s.purID}</td>
                                <td>${s.cusID.cusName}</td>

                                <td>
                                    ${s.cusID.cusEmail}
                                </td>
                                <td>  
                                    <fmt:formatDate value="${s.dateOrderPlaced}" pattern="yyyy-MM-dd" />
                                </td>
                                <td>  
                                    <fmt:formatDate value="${s.dateOrderPaid}" pattern="yyyy-MM-dd" />
                                </td>
                                <td>
                                    ${s.totalPrice}
                                </td>

                                <c:if test="${s.purchaseStatus == 0}">
                                    <td>
                                        <b>Process</b>
                                    </td>  
                                </c:if>
                                <c:if test="${s.purchaseStatus == 1}">
                                    <td>
                                        <b>Shipping</b>
                                    </td>  
                                </c:if>
                                <c:if test="${s.purchaseStatus == 2}">
                                    <td>
                                        <b>Completed</b>
                                    </td>  
                                </c:if> 
                                <c:if test="${s.purchaseStatus == 3}">
                                    <td>
                                        <b>Cancel</b>
                                    </td>  
                                </c:if>


                                <c:if test="${s.purchaseStatus == 0 }">       
                                    <td>
                                        <c:forEach var="c" items="${listPurItem}">
                                            <c:if test="${s.purID == c.purID.purID}">
                                                <a class="btn btn-outline-primary btn-sm" href="changeStatusServlet?purID=${s.purID}&status=1&proID=${c.proID.proID}&puritem=${c.purItemID}">Shipping</a>
                                                &nbsp;
                                                <a class="btn btn-outline-danger btn-sm" href="changeStatusServlet?purID=${s.purID}&status=3&proID=${c.proID.proID}&puritem=${c.purItemID}">Cancel</a>
                                                &nbsp;
                                                <a class="btn btn-outline-secondary btn-sm" href="getDetailsPurServlet?purID=${s.purID}">Details</a>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                </c:if>
                                <c:if test="${s.purchaseStatus == 1 }">
                                    <td>
                                        <c:forEach var="c" items="${listPurItem}">
                                            <c:if test="${s.purID == c.purID.purID}">
                                                <a class="btn btn-outline-success btn-sm" href="changeStatusServlet?purID=${s.purID}&status=2&proID=${c.proID.proID}&puritem=${c.purItemID}">Completed</a>
                                                &nbsp;
                                                <a class="btn btn-outline-danger btn-sm" href="changeStatusServlet?purID=${s.purID}&status=3&proID=${c.proID.proID}&puritem=${c.purItemID}">Cancel</a>
                                                &nbsp;
                                                <br/>
                                                <br/>
                                                <a class="btn btn-outline-secondary btn-sm" href="getDetailsPurServlet?purID=${s.purID}">Details</a>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                </c:if>
                                <c:if test="${s.purchaseStatus == 2 }">
                                    <td>
                                        <a class="btn btn-outline-secondary btn-sm" href="getDetailsPurServlet?purID=${s.purID}">Details</a> 
                                    </td>
                                </c:if>
                                <c:if test="${s.purchaseStatus == 3 }">
                                    <td>
                                        <a class="btn btn-outline-secondary btn-sm" href="getDetailsPurServlet?purID=${s.purID}">Details</a>    
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="d-print-none col-md-2">
                    <div class="col-xs-12">
                        <a href="#" target="_blank" onclick="window.print();" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
                    </div>
                </div>
                <div class="clearix"></div>
                <div class="col-md"></div>
            </div>
        </div>
    </main>
    <c:import url="../templates/adminScript.jsp"></c:import>
    <script>
        n = new Date();
        y = n.getFullYear();
        m = n.getMonth() + 1;
        d = n.getDate();
        document.getElementById("date").innerHTML = m + "/" + d + "/" + y;
    </script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#example').DataTable();
        });
    </script>
</body>
</html>
