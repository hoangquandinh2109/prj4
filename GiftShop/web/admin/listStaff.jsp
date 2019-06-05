<%-- 
    Document   : insertStaff
    Created on : Apr 28, 2019, 11:51:23 PM
    Author     : bemap
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <html>
        <head>
            <c:import url="../templates/adminHead.jsp"></c:import>
            </head>
            <body>
            <c:import url="../templates/adminPage.jsp"></c:import>
            <main class="app-content">
                <div class="app-title">
                    <div>
                        <h1 style="size: A4">List Staff</h1>
                        
                    </div>
                    <ul class="app-breadcrumb breadcrumb">
                        <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                        <li class="breadcrumb-item">Forms</li>
                        <li class="breadcrumb-item"><a href="#">Sample Forms</a></li>
                    </ul>
                </div>
                <div class="row">
                <%-- <p>SOME THING CHANGE </p> --%>


                <div class="container">
                    <div class="row col-md-6 col-md-offset-2 custyle">
                        <form>
                            <table class="table table-striped custab">
                                <thead>
                                <a href="admin/insertStaff.jsp" class="btn btn-primary btn-xs pull-right"><b>+</b> Add new Staff</a>
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

                                
                                <%-- <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span> Edit</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td> --%>      
                                
                                <c:forEach items="${list}" var="p">
                                    <c:if test="${p.role == 2}">
                                    <tr>
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
                                            <td style="color: blue">${p.staffStatus}</td>
                                        </c:if>
                                        <c:if test="${p.staffStatus == false}">
                                            <td style="color: red">${p.staffStatus}</td>
                                        </c:if>
                                        
                                        <c:if test="${p.role == 2}">
                                            <td class="text-center"><a href="${pageContext.request.contextPath}/showStaffServlet?action=Block&id=${p.staffID}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Block</a></td>  
                                            <td class="text-center"><a href="${pageContext.request.contextPath}/showStaffServlet?action=Active&id=${p.staffID}" class="btn btn-danger btn-primary"><span class="glyphicon glyphicon-edit"></span> Active</a></td>
                                            <td class="text-center"><a href="${pageContext.request.contextPath}/showStaffServlet?action=Delete&code=${p.staffID}" class="btn btn-danger btn-primary"><span class="glyphicon-remove"></span> Delete</a></td>
                                        </c:if>

                                    </tr>
                                    </c:if>
                                </c:forEach>
                                
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <c:import url="../templates/adminScript.jsp"></c:import>
    </body>
</html>
