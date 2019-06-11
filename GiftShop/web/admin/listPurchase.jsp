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
          
        <c:import url="../templates/datatablecss.jsp"></c:import>
        </head>
        <body class="app sidebar-mini rtl">
        <c:import url="../templates/adminPage.jsp"></c:import>

        <main class="app-content">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-edit"></i>List Purchase</h1>
                    <p>List Purchase</p>
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
                                <td>${s.cusID.cusEmail}</td>
                                <td><fmt:formatDate value="${s.dateOrderPlaced}" pattern="yyyy-MM-dd" /></td>
                                <td><fmt:formatDate value="${s.dateOrderPaid}" pattern="yyyy-MM-dd" /></td>
                                <td>${s.totalPrice}</td>
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
                               
                                                <a class="btn btn-outline-primary btn-sm" href="changeStatusServlet?purID=${s.purID}&status=1">Shipping</a>
                                                &nbsp;
                                                <a class="btn btn-outline-danger btn-sm" href="changeStatusServlet?purID=${s.purID}&status=3">Cancel</a>
                                                &nbsp;
                                                <a class="btn btn-outline-secondary btn-sm" href="getDetailsPurServlet?purID=${s.purID}">Details</a>
                                    
                                      
                                    </td>
                                </c:if>
                                <c:if test="${s.purchaseStatus == 1 }">
                                    <td>
                                     
                                                <a class="btn btn-outline-success btn-sm" href="changeStatusServlet?purID=${s.purID}&status=2">Completed</a>
                                                &nbsp;
                                                <a class="btn btn-outline-danger btn-sm" href="changeStatusServlet?purID=${s.purID}&status=3">Cancel</a>
                                                &nbsp;
                                                <br/>
                                                <br/>
                                                <a class="btn btn-outline-secondary btn-sm" href="getDetailsPurServlet?purID=${s.purID}">Details</a>
                                        
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
    <c:import url="../templates/scriptPrint.jsp"></c:import>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#example').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    {extend: 'excel', footer: true,
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6, 7]
                        }},
                    {extend: 'pdf', footer: true,
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6, 7]
                        },
                        customize: function(doc) {
                            doc.content[1].table.widths = Array(doc.content[1].table.body[0].length + 1).join('*').split('');
                            doc.content[1].table.alignment = 'right';
                            var rowCount = doc.content[1].table.body.length;
                            for (i = 0; i < rowCount; i++) {
                                for (j = 0; j < doc.content[1].table.body[i].length; j++)
                                    doc.content[1].table.body[i][j].alignment = 'center';
                            }
                            ;
                            doc.content.splice(0, 0, {
                                margin: [0, -25, 0, 12],
                                alignment: 'left',
                                image: 'data:image/png;base64,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'

                            });

                            doc['header'] = (function() {
                                return {
                                    columns: [
                                        {
                                            alignment: 'left',
                                            text: ''
                                        }
                                    ], margin: 20
                                };
                            });
                        }
                    },
                ]

            });
        });</script>
    <script>
        n = new Date();
        y = n.getFullYear();
        m = n.getMonth() + 1;
        d = n.getDate();
        document.getElementById("date").innerHTML = m + "/" + d + "/" + y;
    </script>
</body>
</html>
