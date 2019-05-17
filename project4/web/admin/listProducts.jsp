<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

                <table id="example" class="table table-striped table-bordered display">
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
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="s">
                        <tr>           
                            <td><img src="productImage/${s.imgID.imgName}" alt="pets" width="150px" height="150px"></td>
                            <td>${s.proID.proName}</td>
                            <td>${s.proID.proDetails}</td>
                            <td>${s.proID.proPrice}</td>
                            <td>${s.proID.quantity}</td>
                            <td> <fmt:formatDate value="${s.proID.dateRelease}" pattern="yyyy-MM-dd" /></td>
                            <td>${s.proID.proStatus}</td> 
                            <td>${s.proID.tags}</td>     
                            <td>${s.proID.catID.catName}</td>
                            <td>${s.proID.typeID.typeName}</td>
                            <td>
                            <a href="getDetailsProductServlet?code=${s.code}">Update</a>
                        </td>
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
