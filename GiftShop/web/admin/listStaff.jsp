

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
                    <h1><i class="fa fa-edit"></i>List Staff</h1>

                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a></li>
            </ul>
        </div>
        
                                        <form method="post" action="SearchStaffServlet">
                                            <a href="admin/insertStaff.jsp" class="btn btn-primary btn-xs pull-right"><b>+</b> Add new Staff</a>
                                            <ul class="app-nav">
                                                <li class="app-search">
                                                    <input class="app-search__input" type="search" placeholder="Search Name" id="inputsearch" name="name">
                                                    <button class="app-search__button" type="submit" value="Search" name="Search"><i class="fa fa-search"></i></button>
                                                </li>
                                            </ul>    
        <div id="wrap" class="table-responsive" >
            <table id="example" class="table table-striped table-bordered display">
                <thead>


                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Password</th>
                        <th>Role</th>                                   
                        <th>Status</th>
                        <th class="text-center">Action</th>
                    </tr>
                </thead>



                <tbody> 
                    <c:forEach items="${list}" var="p">
                        <c:if test="${p.role == 2}">
                            <tr id="tableview">
                                <td>${p.staffID}</td>
                                <td>${p.staffName}</td>
                                <td>${p.staffPhone}</td>
                                <td>${p.staffEmail}</td>
                                <td>${p.staffAddress}</td>
                                <td>${p.staffPassword}</td>

                                <c:if test="${p.role == 2}">
                                    <td style="color: blue">Employee</td>
                                </c:if> 

                                <c:if test="${p.staffStatus == true}">
                                    <td style="color: blue">Active</td>
                                </c:if>
                                <c:if test="${p.staffStatus == false}">
                                    <td style="color: red">Block</td>
                                </c:if>

                                <c:if test="${p.role == 2}">
                                    <td class="text-center"><a href="${pageContext.request.contextPath}/showStaffServlet?action=Block&id=${p.staffID}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Block</a></td>  
                                    <td class="text-center"><a href="${pageContext.request.contextPath}/showStaffServlet?action=Active&id=${p.staffID}" class="btn btn-danger btn-primary"><span class="glyphicon glyphicon-edit"></span> Active</a></td>
                                    <td class="text-center"><a href="${pageContext.request.contextPath}/showStaffServlet?action=Delete&code=${p.staffID}" class="btn btn-danger btn-primary"><span class="glyphicon-remove"></span> Delete</a></td>
                                </c:if>

                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>

        </div>
  
</main>

<c:import url="../templates/cripPrint2.jsp"></c:import>
<!--<script type="text/javascript">
    $(document).ready(function() {
        $('#example').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'excel', 'pdf', 'print'
            ]
        });
    });</script>-->
</body>
</html>
