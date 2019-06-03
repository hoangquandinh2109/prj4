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
                        <p>Sample forms </p>
                    </div>
                    <ul class="app-breadcrumb breadcrumb">
                        <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                        <li class="breadcrumb-item">Forms</li>
                        <li class="breadcrumb-item"><a href="#">Forms List FeedBack</a></li>
                    </ul>
                </div>
                <div class="row">
                <%-- <p>SOME THING CHANGE </p> --%>

                
                <div class="container">
                    <div class="row col-md-6 col-md-offset-2 custyle">
                        <form>
                            <table class="table table-striped custab">
                                <thead>
<!--                                <a href="#" class="btn btn-primary btn-xs pull-right"><b>+</b> Add new categories</a>-->
                                <tr>
                                    <th>FeedId</th>
                                    <th>Subject</th>
                                    <th>Message</th>
                                    <th>ReceivedDate</th>
                                    <th>Sender</th>                                  
                                    <th class="text-center">Action</th>
                                </tr>
                                </thead>

                                <%-- <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span> Edit</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td> --%>      
                                <c:forEach items="${list}" var="p">
                                    <tr>
                                        <td>${p.feedId}</td>
                                        <td>${p.subject}</td>
                                        <td>${p.message}</td>
                                        <td>${p.receivedDate}</td>
                                        <td>${p.sender}</td>                                                                           
<!--                                        <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span> Edit</a> 
                                        <td class="text-center"><a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Block</a></td>     -->
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
