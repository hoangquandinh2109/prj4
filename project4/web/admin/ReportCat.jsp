<%-- 
    Document   : ReportCat
    Created on : May 26, 2019, 3:45:03 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    </head>
    <body>
        <div class="wrapper wrapper-content">
            <div class="col-md-6 grid-margin stretch-card">

                <div class="col-lg-12 animated fadeInRightBig">  
                    <div class="col-md-10"><h1 class="text-center">Income report by Brands</h1></div>
                    <table border="1" id="reportData" class="table table-striped table-bordered table-hover">
                        <tr>
                            <th>No.</th>
                            <th>Brand</th>
                            <th>Income</th>
                        </tr>                                
                        <c:forEach var="data" items="${list}" varStatus="index" >
                            <tr>
                                <td>${index.index + 1}</td>
                                <td>${data.category}</td>
                                <td>${data.income}</td>
                            </tr>  
                        </c:forEach>              
                    </table>

                    <div>Total Income: <%=request.getAttribute("total")%></div>

                </div>

                <div class="col-lg-7 animated fadeInDown">
                    <div id="chart1"></div>
                </div>


            </div>
        </div>
    </body>
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
            dataTable.addRows([ < c:forEach items = "${list}" var = "data" > ['${data.category}',${data.income} ], < /c:forEach>]);

                    //instantiate our chart object
                    var chart1 = new google.visualization.ColumnChart(document.getElementById('chart1'));

            //define options for visualization
            var options = {width: 520, height: 300, is3D: true, title: 'Category Income'};

            //draw our chart
            chart1.draw(dataTable, options);

        }
    </script>

</html>
