<%-- 
    Document   : testIn
    Created on : May 27, 2019, 2:59:46 PM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
        <c:import url="../templates/adminHead.jsp"></c:import>
            <style type="text/css">
                .required {
                    color: red;
                }
            </style>
        </head>
        <body class="app sidebar-mini rtl">


            <form id="fileForm" class="form-horizontal" action="InsertProductServlet" method="post" enctype="multipart/form-data" onsubmit="return Validate(this);">
                <div class="form-group row">
                    <label class="control-label col-md-3">Product Name<span class="required">*</span></label>
                    <div class="col-md-8">
                        <input class="form-control" required type="text" name="0"  placeholder="Enter product name" autocomplete="off">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-md-3">Product Details<span class="required">*</span></label>
                    <div class="col-md-8">
                        <textarea class="form-control" required rows="4" name="1" id="1" placeholder="Enter product details" autocomplete="off"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-md-3">Product Price (VND)<span class="required">*</span></label>
                    <div class="col-md-8">
                        <input class="form-control" type="number" required name="2" placeholder="Enter product price" min="0"  max="99999" autocomplete="off">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-md-3">Quantity<span class="required">*</span></label>
                    <div class="col-md-8">
                        <input class="form-control" type="number" required name="3"  placeholder="Enter product quantity" min="0" max="99999" autocomplete="off">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-md-3">Date Release<span class="required">*</span></label>
                    <div class="col-md-8">
                        <input class="form-control" type="text" required name="4" id="datepicker" placeholder="Enter product DateRelease" autocomplete="off">
                    </div>
                </div> 
                <div class="form-group row">
                    <label class="control-label col-md-3">Product Tags<span class="required">*</span></label>
                    <div class="col-md-8">
                        <input class="form-control" type="text" required name="5" placeholder="Enter product tags" autocomplete="off">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-md-3">Category<span class="required">*</span></label>
                    <div class="col-md-8">
                        <select name="6"  required class="form-control">
                            <option value="">Select Category</option>
                        <c:forEach var="c" items="${listCat}">
                            <option value="${c.catID}">${c.catName}</option>
                        </c:forEach>
                    </select>    
                </div>
            </div>
            <div class="form-group row">
                <label class="control-label col-md-3">Type<span class="required">*</span></label>
                <div class="col-md-8">
                    <select required name="7" class="form-control">
                        <option value="">Select Type</option>
                        <c:forEach var="c" items="${listType}">
                            <option value="${c.typeID}">${c.typeName}</option>
                        </c:forEach>
                    </select>    
                </div>
            </div>
            <div class="form-group row">
                <label class="control-label col-md-3">Image Product<span class="required">*</span></label>
                <div class="col-md-8">
                    <input  class="form-control" required type="file" name="file" accept=".png,.jpg,.bmp" multiple="true" >
                </div>
            </div>
            <div class="form-group row">
                <input type="submit" class="btn btn-primary" value="Ok" />
                <input type="reset" class="btn btn-secondary" value="Cancel" /> 
            </div>
            <div class="tile-footer">
                <div class="row">
                    <div class="col-md-8 col-md-offset-3">

                        <!--   <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>Ok</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>-->
                    </div>
                </div>
            </div>
        </form>
        <h1>${message}</h1>
    </body>
    <script>
        $('#datepicker').datepicker({
            uiLibrary: 'bootstrap4', maxDate: new Date, minDate: new Date(2018, 10, 12)});
    </script>
    <c:import url="../templates/adminScript.jsp"></c:import>
</html>
