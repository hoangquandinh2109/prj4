<%-- 
    Document   : updateFeature
    Created on : Jun 5, 2019, 3:31:50 PM
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
                    <h1><i class="fa fa-edit"></i>Feature</h1>
                    <p>Insert new Feature</p>
                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a></li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md"></div>
            <div class="col-md-6 col-sm-12">
                <div class="tile">
                    <h3 class="tile-title">Update Feature</h3>
                    <div class="tile-body">
                        <form id="fileForm" class="form-horizontal" action="${pageContext.request.contextPath}/updateFeatureServlet" method="post">
                            <div class="form-group row">
                                <label class="control-label col-md-3">Feature ID </label>
                                <div class="col-md-8">
                                    <input class="form-control" type="text" name="feaID" readonly value="${fea.featureID}">
                                    <input class="form-control" type="hidden" name="status" value="${fea.statusFeature}">
                                </div>
                            </div>   
                            <div class="form-group row">
                                <label class="control-label col-md-3">Feature Name </label>
                                <div class="col-md-8">
                                    <input class="form-control" required type="text" name="name" placeholder="Enter category name" value="${fea.fname}" autocomplete="off">
                                </div>
                            </div>   
                            <div class="form-group row">
                                <label class="control-label col-md-3">Feature Description </label>
                                <div class="col-md-8">
                                    <input class="form-control" required type="text" name="feaDes" placeholder="Enter category name" value="${fea.fdescription}" autocomplete="off">
                                </div>
                            </div>   
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <input type="submit" class="btn btn-primary" value="Update Feature" />
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
