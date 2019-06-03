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
                            <th>Category Desception</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listCat}" var="s">
                        <tr>               
                            <td>${s.catID}</td>
                            <td>${s.catName}</td>
                            <td>${s.cateDescription}</td>
                            <td><c:choose>
                                    <c:when test="${s.statusCategory==true}">
                                        <input type="checkbox" checked onclick="return false;" />
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" onclick="return false;" />
                                    </c:otherwise>
                                </c:choose></td>
                            <td>
                                <a class="btn btn-sm" href="getDetailsCatServlet?catID=${s.catID}">Update</a>
                                <br/>
                                <br/>
                                <input type="hidden" value="${s.catID}" name="id"/>     
                                <c:if test="${s.statusCategory==true}">
                                    <a class="btn btn-danger btn-sm" onclick="disable('disableCatServlet', '${s.catID}', '${s.statusCategory}')">Disable</a>
                                </c:if>
                                <c:if test="${s.statusCategory==false}">
                                    <a class="btn btn-primary btn-sm" onclick="disable('disableCatServlet', '${s.catID}', '${s.statusCategory}')">Activate</a>
                                </c:if>
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
                            <th>Type name</th>
                            <th>Type Desception</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listType}" var="c">
                            <tr>               
                                <td>${c.typeID}</td>
                                <td>${c.typeName}</td>
                                <td>${c.typeDescription}</td>
                                <td><c:choose>
                                        <c:when test="${c.statusType==true}">
                                            <input type="checkbox" checked onclick="return false;" />
                                        </c:when>
                                        <c:otherwise>
                                            <input type="checkbox" onclick="return false;" />
                                        </c:otherwise>
                                    </c:choose></td>
                                <td>
                                    <a class="btn btn-sm" href="getDetailsTypeServlet?typeID=${c.typeID}">Update</a>
                                    <br/>     <br/>
                                    <input type="hidden" value="${c.typeID}" name="id1"/>      
                                    <c:if test="${c.statusType==true}">
                                        <a class="btn btn-danger btn-sm" onclick="disable('disableTypeServlet', '${c.typeID}', '${c.statusType}')">Disable</a>
                                    </c:if>
                                    <c:if test="${c.statusType==false}">
                                        <a class="btn btn-primary btn-sm" onclick="disable('disableTypeServlet', '${c.typeID}', '${c.statusType}')">Activate</a>
                                    </c:if>
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
    <script type="text/javascript">
        function disable(pageName, id, status) {
            swal({
                title: "Are you sure?",
                text: "This will be disabled if you click on [Yes] button",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, let do it!",
                cancelButtonText: "No, cancel pls!",
                closeOnConfirm: false,
                closeOnCancel: false},
            function(isConfirm) {
                if (isConfirm) {
                    window.location = pageName + "?action=disable&id=" + id + "&status=" + status;
                } else {
                    swal("Cancelled", "You cancel the action", "error");
                }
            });
        }
    </script>

</body>
</html>
