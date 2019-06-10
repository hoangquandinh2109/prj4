
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <style type="text/css">
                .required {
                    color: red;
                }
            </style>
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
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md"></div>
                <div class="col-md-6 col-sm-12">
                    <div class="tile">
                        <h3 class="tile-title">Insert new Category</h3>
                        <div class="tile-body">
                            <form id="fileForm" class="form-horizontal" action="${pageContext.request.contextPath}/insertCatTyServlet" method="post">
                            <div class="form-group row">
                                <label class="control-label col-md-3">Category Name </label>
                                <div class="col-md-8">
                                    <input class="form-control" required type="text" id="txtName" name="catName" placeholder="Enter Category name" autocomplete="off">
                                </div>
                            </div>     
                            <div class="form-group row">
                                <label class="control-label col-md-3">Category Desception </label>
                                <div class="col-md-8">
                                    <textarea class="form-control" required rows="4" name="catDes" placeholder="Enter Category Desception" autocomplete="off"></textarea>
                                </div>
                            </div>    
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <input type="submit" class="btn btn-primary" value="Insert Category" name="action" />
                                        <input type="reset" class="btn btn-secondary" value="Cancel" />
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
        <div class="row">
            <div class="col-md"></div>
            <div class="col-md-6 col-sm-12">
                <div class="tile">
                    <h3 class="tile-title">Insert new type</h3>
                    <div class="tile-body">
                        <form id="fileForm" class="form-horizontal" action="${pageContext.request.contextPath}/insertCatTyServlet" method="post">
                            <div class="form-group row">
                                <label class="control-label col-md-3">Type Name </label>
                                <div class="col-md-8">
                                    <input class="form-control" required type="text" name="typeName" placeholder="Enter type name" autocomplete="off">
                                </div>
                            </div>   
                               <div class="form-group row">
                                <label class="control-label col-md-3">Type Desception </label>
                                <div class="col-md-8">
                                    <textarea class="form-control" required rows="4" name="typeDes" placeholder="Enter Type Desception" autocomplete="off"></textarea>
                                </div>
                            </div>    
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <input type="submit" class="btn btn-primary" value="Insert Type" name="action"/>
                                        <input type="reset" class="btn btn-secondary" value="Cancel" />
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
