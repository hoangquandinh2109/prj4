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
                        <h1><i class="fa fa-edit"></i> Form Samples</h1>
                        <p>Sample forms ${dit}</p>
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
                        <form action="listUserServlet" method="POST">
                            <table class="table table-striped custab">
                                <thead>
                                <a href="#" class="btn btn-primary btn-xs pull-right"><b>+</b> Add new categories</a>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Password</th>
                                    <th>Address</th>
                                    <th>Phone</th>
                                    <th>Avatar</th>
                                    <th>Status</th>
                                    <th class="text-center">Action</th>
                                </tr>
                                </thead>

                                <%-- <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span> Edit</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td> --%>      
                                <c:forEach items="${list}" var="p">
                                    <tr>
                                        <td>${p.cusID}</td>
                                        <td>${p.cusName}</td>
                                        <td>${p.cusEmail}</td>
                                        <td>${p.cusPassword}</td>
                                        <td>${p.cusAddress}</td>
                                        <td>${p.cusPhone}</td>
                                        <td><img src="image/userAvatar/${p.cusAvatar}" width="150" height="150"/></td>
                                        <td>${p.cusStatus}</td>                                      
                                        <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span> Edit</a> 
                                        <td class="text-center"><a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Block</a></td>     
                                    </tr>
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
