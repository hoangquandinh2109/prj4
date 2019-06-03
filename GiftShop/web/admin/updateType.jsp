<%-- 
    Document   : updateType
    Created on : May 26, 2019, 2:31:02 PM
    Author     : Asus
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="../templates/adminHead.jsp"></c:import>
        </head>
        <body class="app sidebar-mini rtl">
        <c:import url="../templates/adminPage.jsp"></c:import>
        <main class="app-content">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-edit"></i>Category & Type</h1>
                    <p>Insert new category & type</p>
                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item">Forms</li>
                    <li class="breadcrumb-item"><a href="#">Sample Forms</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md"></div>
                <div class="col-md-6 col-sm-12">
                    <div class="tile">
                        <h3 class="tile-title">Update Type</h3>
                        <div class="tile-body">
                            <form id="fileForm" class="form-horizontal" action="${pageContext.request.contextPath}/updateTypeServlet" method="post">
                            <div class="form-group row">
                                <label class="control-label col-md-3">Type ID </label>
                                <div class="col-md-8">
                                    <input class="form-control" type="text" name="typeID" readonly value="${type.typeID}">
                                    <input class="form-control" type="hidden" name="status" value="${type.statusType}">
                                </div>
                            </div>   
                            <div class="form-group row">
                                <label class="control-label col-md-3">Type Name </label>
                                <div class="col-md-8">
                                    <input class="form-control" required type="text" name="typeName" placeholder="Enter category name" value="${type.typeName}" autocomplete="off">
                                </div>
                            </div>   
                            <div class="form-group row">
                                <label class="control-label col-md-3">Type Description </label>
                                <div class="col-md-8">
                                    <input class="form-control" required type="text" name="typeDes" placeholder="Enter category name" value="${type.typeDescription}" autocomplete="off">
                                </div>
                            </div>   
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <input type="submit" class="btn btn-primary" value="Update Type" />

                                        <!--   <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>Ok</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>-->
                                    </div>
                                </div>
                            </div>
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
