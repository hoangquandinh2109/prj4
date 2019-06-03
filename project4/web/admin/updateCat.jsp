<%-- 
    Document   : updateCat
    Created on : May 26, 2019, 1:32:41 PM
    Author     : Asus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <h3 class="tile-title">Update Category</h3>
                        <div class="tile-body">
                            <form id="fileForm" class="form-horizontal" action="${pageContext.request.contextPath}/updateCatServlet" method="post">
                            <div class="form-group row">
                                <label class="control-label col-md-3">Category ID </label>
                                <div class="col-md-8">
                                    <input class="form-control" type="text" name="catID" readonly value="${cat.catID}">
                                    <input type="text" readonly name="status" value="${cat.statusCategory}">

                                </div>
                            </div>   
                            <div class="form-group row">
                                <label class="control-label col-md-3">Category Name </label>
                                <div class="col-md-8">
                                    <input class="form-control" required type="text" name="catName" placeholder="Enter category name" value="${cat.catName}" autocomplete="off">
                                </div>
                            </div>  
                            <div class="form-group row">
                                <label class="control-label col-md-3">Category Description </label>
                                <div class="col-md-8">
                                    <input class="form-control" required type="text" name="catDes" placeholder="Enter category description" value="${cat.cateDescription}" autocomplete="off">
                                </div>
                            </div>   

                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <input type="submit" class="btn btn-primary" value="Update Category" />
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
