<%-- 
    Document   : listFeature
    Created on : Jun 5, 2019, 3:08:01 PM
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
                    <h1><i class="fa fa-edit"></i> List Feature</h1>
                    <p>Feature</p>
                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a></li>
            </ul>
        </div>   
        <div id="wrap">
            <table id="example" class="table table-striped table-bordered display">
                <center>   <span style="color: #00635a;font-size: 200%;font-weight: bold;"> List Feature</span>    </center>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Feature</th>
                        <th>Feature Desception</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listFea}" var="s">
                        <tr>               
                            <td>${s.featureID}</td>
                            <td>${s.fname}</td>
                            <td>${s.fdescription}</td>
                            <td><c:choose>
                                    <c:when test="${s.statusFeature==true}">
                                        <input type="checkbox" checked onclick="return false;" />
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" onclick="return false;" />
                                    </c:otherwise>
                                </c:choose></td>
                            <td>
                                <a class="btn btn-sm" href="getDetailsCatServlet?feaID=${s.featureID}">Update</a>
                                <br/>
                                <br/>
                                <input type="hidden" value="${s.featureID}" name="id1"/>     
                                <c:if test="${s.statusFeature==true}">
                                    <a class="btn btn-danger btn-sm" onclick="disable('disableFeaServlet', '${s.featureID}', '${s.statusFeature}')">Disable</a>
                                </c:if>
                                <c:if test="${s.statusFeature==false}">
                                    <a class="btn btn-primary btn-sm" onclick="disable('disableFeaServlet', '${s.featureID}', '${s.statusFeature}')">Activate</a>
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
