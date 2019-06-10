<%-- 
    Document   : ReportCat
    Created on : May 26, 2019, 3:45:03 PM
    Author     : Asus
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <c:import url="../templates/adminHead.jsp"></c:import>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" ></script>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        </head>
        <body class="app sidebar-mini rtl">
        <c:import url="../templates/adminPage.jsp"></c:import>
        <c:import url="../templates/scriptPrint.jsp"></c:import>
        <%--<c:import url="../templates/datatablecss.jsp"></c:import>--%>
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-edit"></i>Chart by Category</h1>
                <p>Chart</p>
            </div>
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a></li>
            </ul>
        </div>
        <div class="wrapper">
            <!-- Main content -->
            <div class="wrapper">
                <!-- Main content -->
                <section class="content d-none d-print-block">
                    <!-- title row -->
                    <div class="row">
                        <div class="col-xs-12">
                            <h2 class="page-header">
                                &nbsp; &nbsp;<i class="fa fa-globe"></i> Cangcucotv2, Group 4.&nbsp; &nbsp;

                                &nbsp;&nbsp;<small class="pull-right">Date:<i id="date"></i></small>
                            </h2>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- info row -->
                    <div class="row invoice-info d-none d-print-block">
                        <div class="col-sm-4 invoice-col">
                            &nbsp; Addess
                            <address>
                                <strong> &nbsp; &nbsp;  Admin, Inc.</strong><br>
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
                <div class="wrap">
                    <div class="col-md-6 grid-margin stretch-card">

                        <div class="col-lg-12 animated fadeInRightBig">  
                            <div class="col-md-10"><h1 class="text-center">Income report by Category</h1></div>
                            <div class="d-print-none col-md-2">
                                <div class="col-xs-12">
                                    <a href="#" target="_blank" onclick="window.print();" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
                                </div>
                            </div>
                            <table border="1" id="example" class="table table-striped table-bordered table-hover">
                                <tr>
                                    <th>No.</th>
                                    <th>Brand</th>
                                    <th>Income</th>
                                </tr>                                
                                <c:forEach var="data" items="${list}" varStatus="index">
                                    <tr>
                                        <td>${index.index + 1}</td>
                                        <td>${data.category}</td>
                                        <td>${data.income}</td>
                                    </tr>  
                                </c:forEach>              
                            </table>
                            <div><b>Total Income: <%=request.getAttribute("total")%></b></div>
                        </div>

                    </div>
                </div>
                <div class="col-lg-6 animated fadeInDown d-print-none">
                    <div id="chart1"></div>
                </div>
                <div class="clearix"></div>
                <div class="col-md"></div>
            </div>
        </div>
    </main>
</body>

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
</script>
<script type="text/javascript">
    //load the Google Visualization API and the chart
    google.load('visualization', '1', {'packages': ['columnchart']});

    //set callback
    google.setOnLoadCallback(createChart);

    //callback function
    function createChart() {

        //create data table object
        var dataTable = new google.visualization.DataTable();

        //define columns
        dataTable.addColumn('string', 'Quarters 2009');
        dataTable.addColumn('number', 'Income');


        //define rows of data
        dataTable.addRows([<c:forEach items = "${list}" var = "data" > ['${data.category}',${data.income} ], </c:forEach>]);

        //instantiate our chart object
        var chart1 = new google.visualization.ColumnChart(document.getElementById('chart1'));

        //define options for visualization
        var options = {width: 520, height: 300, is3D: true, title: 'Category Income'};

        //draw our chart
        chart1.draw(dataTable, options);

    }
</script>

</html>
