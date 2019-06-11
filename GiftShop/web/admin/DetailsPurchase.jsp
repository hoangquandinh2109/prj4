<%-- 
    Document   : DetailsPurchase
    Created on : Jun 3, 2019, 9:09:57 PM
    Author     : Asus
--%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="../templates/adminHead.jsp"></c:import>
        </head>
        <body class="app sidebar-mini rtl">
        <c:import url="../templates/adminPage.jsp"></c:import>
        <main class="app-content">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-edit"></i>Order Details </h1>
                    <p>Order Information </p>
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
                            <strong> &nbsp; &nbsp;CangcucotV2, Inc.</strong><br>
                            &nbsp; &nbsp;  590 Cach mang thang 8, District 3<br>     
                            &nbsp; &nbsp;  Phone: (804) 123-5432<br>
                            &nbsp; &nbsp;  Email: cangcucotV2@gmail.com
                        </address>
                    </div>
                    <!-- /.col -->

                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </section>
            <div class="col-lg-6 animated fadeInDown">
                <div id="chart1"></div>
            </div>

            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="tile">
                        <h3 class="tile-title">Order # </h3>

                        <div class="tile-body">
                            <form class="form-horizontal">
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Purchase ID</label>
                                    <div class="col-md-8">
                                        <b>${purchase.purID}</b>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Total Price</label>
                                    <div class="col-md-8">
                                        <b>${purchase.totalPrice}</b>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Status</label>
                                    <div class="col-md-8">
                                        <c:if test="${purchase.purchaseStatus == 0}">
                                            <b>Process</b>
                                        </c:if>
                                        <c:if test="${purchase.purchaseStatus == 1}">
                                            <b>Shipping</b>
                                        </c:if>
                                        <c:if test="${purchase.purchaseStatus == 2}">
                                            <b>Completed</b>
                                        </c:if>
                                        <c:if test="${purchase.purchaseStatus == 3}">
                                            <b>Cancel</b>
                                        </c:if>
                                        <b></b>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Date Placed</label>
                                    <div class="col-md-8">
                                        <b> <fmt:formatDate value="${purchase.dateOrderPlaced}" pattern="yyyy-MM-dd" />  </b>   
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Date Paid</label>
                                    <div class="col-md-8">
                                        <b> <fmt:formatDate value="${purchase.dateOrderPaid}" pattern="yyyy-MM-dd" />  </b>  
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="tile">
                        <h3 class="tile-title">Customer Information</h3>
                        <div class="tile-body">
                            <form class="form-horizontal">
                                <div class="form-group row">
                                    <label class="control-label col-md-4">Shipping to name</label>
                                    <div class="col-md-7">
                                        <b>${purchase.toName}</b>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-4">To Address</label>
                                    <div class="col-md-7">
                                        <b>${purchase.toAddress}</b>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-4">Phone</label>
                                    <div class="col-md-7">
                                        <b>${purchase.toPhone}</b>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-4">Payment</label>
                                    <div class="col-md-7">
                                        <b>${purchase.paymentMethod}</b>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-4">Note</label>
                                        <div class="col-md-7">
                                            <b>${purchase.note}</b>
                                        </div>
                                </div>
                             
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md"></div>
            <div class="col-md-12 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Order Details</h4>
                        <table class="table">
                            <thead>        
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">Product Name</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">&#36;Price</th>
                                    <th scope="col">&#36;Total</th>
                                    <th scope="col"></th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c"items="${purItem}" varStatus="index">
                                    <tr>
                                        <th scope="row">${index.index+1}</th>
                                        <td>${c.proID.proName}</td>
                                        <td>${c.quantity}</td>
                                        <td>${c.proID.proPrice}</td>
                                        <td>${c.proID.proPrice*c.quantity}</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><h3>Subtotal &nbsp; &#36;<b>${purchase.totalPrice}</b></h3></td>
                                </tr>     
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="clearix"></div>
            <div class="col-md"></div>
            <div class="d-print-none col-md-2">
                <div class="col-xs-12">
                    <a href="#" target="_blank" onclick="window.print();" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
                </div>
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
        $(function() {
            $('#example1').DataTable({
                "order": [[0, "desc"]],
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'excel', 'pdf', 'print'
                ]
            });
        });
    </script>

</body>
</html>
