

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <head>
        <c:import url="../templates/adminHead.jsp"></c:import>
        <c:import url="../templates/datatablecss2.jsp"></c:import>
        </head>
        <body class="app sidebar-mini rtl">
        <c:import url="../templates/adminPage.jsp"></c:import>

        <main class="app-content">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-edit"></i>List User</h1>
                   
                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a></li>
            </ul>
        </div> 
        <div id="wrap" class="table-responsive" >
            <table id="example" class="table table-striped table-bordered display">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>

                        <th>Address</th>
                        <th>Phone</th>

                        <th>Status</th>
                        <td></td>
                    </tr>
                 </thead>

                <tbody> 
                    <c:forEach items="${list}" var="p">
                        <tr>
                            
                            <td>${p.cusID}</td>
                            <td>${p.cusName}</td>
                            <td>${p.cusEmail}</td>

                            <td>${p.cusAddress}</td>
                            <td>${p.cusPhone}</td>

                            <td>${p.cusStatus}</td>                                      

                             <td><a href="${pageContext.request.contextPath}/DeleteUserServlet?code=${p.cusID}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Delete</a></td>         
                        </tr>                       
                    </c:forEach> 
                
                </tbody>
                
            </table>

        </div>
    </div>
</div>
</main>

<c:import url="../templates/cripPrint2.jsp"></c:import>

<script type="text/javascript">
        $(document).ready(function() {
            $('#example').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    {extend: 'excel',
                        exportOptions: {
                            columns: [0,1, 2, 3, 4, 5]
                        }},
                    {extend: 'pdf', 
                        exportOptions: {
                            columns: [0,1, 2, 3, 4, 5]
                        }}, 
                    {extend: 'print', 
                        exportOptions: {
                            columns: [0,1, 2, 3, 4, 5]
                        }}, 
                    
                    
                        
                                          
                ]

            });
        });</script>

<!--<script type="text/javascript">
    $(document).ready(function() {
    $('#example').DataTable( {
        dom: 'Bfrtip',
        buttons: [
             'excel', 'pdf', 'print'
        ]
    } );
} );</script>-->
</body>
</html>
