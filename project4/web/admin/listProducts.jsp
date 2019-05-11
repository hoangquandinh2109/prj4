<%-- 
    Document   : trangMau
    Created on : Apr 28, 2019, 11:53:52 PM
    Author     : bemap
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
        <c:import url="../templates/adminHead.jsp"></c:import>
        </head>

        <body>
        <c:import url="../templates/adminPage.jsp"></c:import>

        <main class="app-content">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-edit"></i> Form Samples</h1>
                    <p>Sample forms</p>
                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item">Forms</li>
                    <li class="breadcrumb-item"><a href="#">Sample Forms</a></li>
                </ul>
            </div>   
            <div id="wrap">
                <div class="container">
                    <div class="row col-md-12 col-md-offset-2 custyle">
                        <table id="example" class="datatable table table-striped table-bordered display">
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Product Name</th>
                                    <th>Product Details</th>
                                    <th>Product Price</th>
                                    <th>Quantity</th>
                                    <th>Date Release</th>
                                    <th>Status</th>
                                    <th>Tags</th>
                                    <th>Category</th>
                                    <th>Type</th>
                                </tr>
                            </thead>
                        <c:forEach items="${list}" var="s">
                            <tr>           
                                <td><img src="uploadDir/${s.imgID.imgName}" alt="pets" width="150px" height="150px"></td>
                                <td>${s.proID.proName}</td>
                                <td>${s.proID.proDetails}</td>
                                <td>${s.proID.proPrice}</td>
                                <td>${s.proID.quantity}</td>
                                <td> <fmt:formatDate value="${s.proID.dateRelease}" pattern="yyyy-MM-dd" /></td>
                                <td>${s.proID.proStatus}</td> 
                                <td>${s.proID.tags}</td>     
                                <td>${s.proID.catID.catName}</td>
                                <td>${s.proID.typeID.typeName}</td> 
                            </tr>
                        </c:forEach>
                    </table>  
                </div>
                <div class="clearix"></div>
                <div class="col-md"></div>
            </div>
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
