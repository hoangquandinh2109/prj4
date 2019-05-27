<%-- 
    Document   : listCat
    Created on : May 26, 2019, 1:34:03 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h1><i class="fa fa-edit"></i> List Categories And Type</h1>
                    <p>Category and Type</p>
                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item">Forms</li>
                    <li class="breadcrumb-item"><a href="#">Sample Forms</a></li>
                </ul>
            </div>   
            <div id="wrap">
                <table id="example" class="table table-striped table-bordered display">
                    <center>   <span style="color: #00635a;font-size: 200%;font-weight: bold;"> List Categories</span>    </center>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>CategoryName</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listCat}" var="s">
                        <tr>               
                            <td>${s.catID}</td>
                            <td>${s.catName}</td>
                            <td>
                                <a href="getDetailsCatServlet?catID=${s.catID}">Update</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table> 
                <hr/>
                <br/>
            <table id="example1" class="table table-striped table-bordered display">
                  <center>   <span style="color: #00635a;font-size: 200%;font-weight: bold;"> List Type</span> 
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Type</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listType}" var="c">
                        <tr>               
                            <td>${c.typeID}</td>
                            <td>${c.typeName}</td>
                           
                            <td>
                                <a href=" getDetailsTypeServlet?typeID=${c.typeID}">Update</a>
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
          $(document).ready(function() {
            $('#example1').DataTable();
        });
    </script>

</body>
</html>
