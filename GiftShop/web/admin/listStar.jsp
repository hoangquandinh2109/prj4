

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
                    <h1><i class="fa fa-edit"></i>List Top Star DESC</h1>
                   
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
                        
                    
                        <th>Review Title</th>

                        <th>Review Content</th>
                        <th>Star</th>

                        <th>Customer ID</th>
                        <th>Product ID</th>
                        
                    </tr>
                </thead>
                <tbody> 
                   
                    <c:forEach items="${list}" var="p">
                        <c:if test="${p.star >=4}">
                             <tr>
                            
                            
                            <td>${p.reviewTitle}</td>
                            <td>${p.reviewContent}</td>

                            <td>${p.star}</td>
                            
                            <td>${p.cusID.cusID}</td>

                            <td>${p.proID.proID}</td>                                      

                                      
                        </tr>
                        </c:if>
                       
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
    $('#example').DataTable( {
        dom: 'Bfrtip',
        buttons: [
             'excel', 'pdf', 'print'
        ]
    } );
} );</script>
</body>
</html>
