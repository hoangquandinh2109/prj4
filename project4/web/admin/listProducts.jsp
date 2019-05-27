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
                    <h1><i class="fa fa-edit"></i>List Products</h1>
                    <p>List products</p>
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
                            <th>Product ID</th>
                            <th>ImageOD</th>
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
                    <c:forEach items="${listPro}" var="s">
                        <tr>
                            <td>
                               
                             <c:forEach items="${list}" var="i">
                                  <c:if test="${i.proID ==s.proID}">
                                        ${i.imgID}
                                          </c:if>
                                  
                             </c:forEach>
                     
                               </td>
                          <!-- <td><img src="productImage/$.{s.imgID.imgName}" alt="pets" width="150px" height="150px"></td>--> 
                            <td>${s.proID}</td>
                            
                            <td>${s.proName}</td>
                            <td>${s.proPrice}</td>
                            <td>${s.quantity}</td>
                            <td> <fmt:formatDate value="${s.dateRelease}" pattern="yyyy-MM-dd" /></td>

                            <td><c:choose>
                                    <c:when test="${s.proStatus==true}">
                                        <input type="checkbox" checked onclick="return false;" />
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" onclick="return false;" />
                                    </c:otherwise>
                                </c:choose></td>
                            <td>${s.tags}</td>     
                            <td>${s.catID.catName}</td>
                            <td>${s.typeID.typeName}</td>
                            <td>
                                <a class="btn btn-primary btn-sm" href="getDetailsProductServlet?code=${s.proID}">Update</a>  
                   
                                 <br/>
                                 <br/>
                                <input type="hidden" value="${s.proID}" name="id"/>     
                                <c:if test="${s.proStatus==true}">
                                    <a class="btn btn-danger btn-sm" onclick="disable('disableProductServlet', '${s.proID}', '${s.proStatus}')">Disable</a>
                                </c:if>
                                <c:if test="${s.proStatus==false}">
                                    <a class="btn btn-primary btn-sm" onclick="disable('disableProductServlet', '${s.proID}', '${s.proStatus}')">Activate</a>
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
                cancelButtonText: "No, cancel plx!",
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
