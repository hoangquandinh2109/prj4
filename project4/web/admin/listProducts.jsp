<%-- 
    Document   : trangMau
    Created on : Apr 28, 2019, 11:53:52 PM
    Author     : bemap
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                    <p>Sample forms</p>
                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item">Forms</li>
                    <li class="breadcrumb-item"><a href="#">Sample Forms</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md"></div>
                <div class="col-md-12 col-sm-12">
                    <div class="tile">
                        <h3 class="tile-title">Show List</h3>
                        <div class="tile-body">
                            <form class="form-horizontal">
                                <table class="table" border="1">
                                    <tr>
                                        <th>img id||</th>
                                        <th>img des||</th>
                                        <th>image||</th>
                                        <th>pro id||</th>
                                        <th>pro name||</th>
                                        <th>pro details||</th>
                                        <th>pro price||</th>
                                        <th>pro DateRelease||</th>
                                        <th>pro Status||</th>
                                        <th>Actions</th>
                                    </tr>
                                <c:forEach items="${list}" var="s">
                                    <tr> 
                                        <td>${s.imgID}</td>                      
                                        <td><img src="uploadDir/${s.imgName}" width="200px"></td>
                                             <td>${s.proID}</td>
                                         <!--      <td>$/{s.productCollection.proName}</td>
                                              <td>$/{s.productCollection.proDetails}</td>
                                              <td>$/{s.productCollection.proPrice}</td>
                                              <td> <fmt:formatDate value="$/{s.productCollection.dateRelease}" pattern="yyyy-MM-dd" /></td>
                                          <td>$/{s.productCollection.proStatus}</td>-->
                                    </tr>
                                </c:forEach>
                            </table>
                        </form>
                    </div>

                </div>
            </div>
            <div class="clearix"></div>
            <div class="col-md"></div>
        </div>

    </main>
    <c:import url="../templates/adminScript.jsp"></c:import>
</body>
</html>
