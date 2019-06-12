<%-- 
    Document   : updateProduct
    Created on : May 14, 2019, 10:27:33 PM
    Author     : Asus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .inputfile {
                width: 0.1px;
                height: 0.1px;
                opacity: 0;
                overflow: hidden;
                position: absolute;
                z-index: -1;
            }

        </style>
        <style>
            .select2-results__option[aria-selected=true] {
                display: none;
            }
        </style>
        <style type="text/css">
            .required {
                color: red;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />   
        <c:import url="../templates/adminHead.jsp"></c:import>
        </head>
        <body class="app sidebar-mini rtl">
        <c:import url="../templates/adminPage.jsp"></c:import>
        <main class="app-content">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-edit"></i> Form Samples</h1>
                    <p>Sample forms</p>
                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a></li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md">
                <div class="tile">
                    <h3 class="tile-title">Product's Information</h3>
                    <div class="tile-body">
                        <form id="fileForm" class="form-horizontal" action="updateProductServlet" method="post" enctype="multipart/form-data">
                            <div class="form-group row">

                                <label class="control-label col-md-3">Product ID </label>
                                <div class="col-md-8">
                                    <input readonly value="${product.proID}" class="form-control" type="text" name="0" placeholder="Enter product ID">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Product Name </label>
                                <div class="col-md-8">
                                    <input value="${product.proName}" class="form-control" type="text" name="1" placeholder="Enter product name">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Product Details</label>
                                <div class="col-md-8">
                                    <textarea  class="form-control" rows="4" name="2" placeholder="Enter product details">${product.proDetails}</textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Product Price </label>
                                <div class="col-md-8">
                                    <input class="form-control" value="${product.proPrice}" type="number" name="3" placeholder="Enter product price">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Quantity</label>
                                <div class="col-md-8">
                                    <input class="form-control" value="${product.quantity}" type="number" name="4" placeholder="Enter product quantity">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Date Release </label>
                                <div class="col-md-8">
                                    <input class="form-control" value="<fmt:formatDate value="${product.dateRelease}" pattern="MM/dd/yyyy"/>" type="text" name="5" id="datepicker" placeholder="Enter product DateRelease">
                                </div>
                            </div>  
                            <input type="hidden" value="${product.proStatus}" name="6">
                            <div class="form-group row">
                                <label class="control-label col-md-3">Category</label>
                                <div class="col-md-8">
                                    <select name="7" class="form-control" id="cate">
                                        <c:forEach var="c1" items="${listCat}">
                                            <c:choose>
                                                <c:when test="${product.catID.catID eq c1.catID}">
                                                    <option value="${c1.catID}" selected="true">${c1.catName}</option> 
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${c1.catID}">${c1.catName}</option> 
                                                </c:otherwise>
                                            </c:choose>   
                                        </c:forEach>
                                    </select>    
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Type</label>
                                <div class="col-md-8">
                                    <select name="8" id="type" class="form-control">
                                        <c:forEach var="c" items="${listType}">
                                            <c:choose>
                                                <c:when test="${product.typeID.typeID eq c.typeID}">
                                                    <option value="${c.typeID}" selected="true">${c.typeName}</option> 
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${c.typeID}">${c.typeName}</option> 
                                                </c:otherwise>
                                            </c:choose>   
                                        </c:forEach>
                                    </select>    
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Feature</label>
                                <div class="col-md-8">
                                    <select name="9" class="form-control">
                                        <c:forEach var="c" items="${listF}">
                                            <c:choose>
                                                <c:when test="${product.featureID.featureID eq c.featureID}">
                                                    <option value="${c.featureID}" selected="true">${c.fname}</option> 
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${c.featureID}">${c.fname}</option> 
                                                </c:otherwise>
                                            </c:choose>   
                                        </c:forEach>
                                    </select>    
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Tags<span class="required">*</span></label>
                                <div class="col-md-8">
                                    <select required name="tagInput" id="mySelect2" class="form-control" multiple="multiple"> 
                                        <c:set var="a" value="product"></c:set>
                                        <c:forEach items="${tags}" var="tagE">
                                            <c:if  test="${tagE.tagType eq a}">
                                                <option value="${tagE.tag}">${tagE.tag}</option> 
                                            </c:if>   
                                        </c:forEach> 
                                        <c:forTokens items="${product.tags}" delims=":" var="tag">
                                            <option value="${tag}" selected="selected">${tag}</option>
                                            <%--  --%>
                                        </c:forTokens>
                                    </select>            
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">           
                                    <c:forEach items="${imgg}" var="i">
                                        <c:if test="${i.proID.proID == product.proID}">
                                            <input type="file" name="${i.imgID}" id="file" accept=".png,.jpg,.bmp,.jpeg">
                                            <!--<label for="file"   class="btn btn-secondary"><strong>Change image</strong></label>--> 
                                            <p><img src="productImage/${i.imgName}" alt="pets" width="70px" height="80px" ></p>
                                            </c:if>
                                        </c:forEach>  
                                </div>
                            </div>
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <input type="submit" class="btn btn-primary" value="Update" />
                                        <!--   <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>Ok</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>-->
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
    <script>
        $('#mySelect2').select2({
            tags: true
        });
        //Get type by Cat
        $(document).ready(function() {
            //    $("#type").text("");
            $("#cate").change(function() {
                console.log($(this).val());
                var cateID = $(this).val();
                // data = $("#searchInput").val();

                $.ajax({
                    type: 'GET',
                    url: 'filterByCate',
                    headers: {
                        Accept: 'application/json ,chartset=utf-8',
                        'Content-Type': 'Apllication/json;chartset=utf-8',
                    },
                    data: {data: cateID},
                    success: function(result) {
                        $("#type").text("");
                        // var x =JSON.parse(result);
                        // console.log();
                        $.each(result.type, function(index) {
                            //var arrayTag = result.POST[index].postTag.split(";");
                            var template = '<option value="' + result.type[index].typeID + '">' + result.type[index].typeName + '</option>';
                            $("#type").append(template);
                            console.log(template);





                        });
                    }
                });
            });
        });
        $('#datepicker').datepicker({
            uiLibrary: 'bootstrap4', maxDate: new Date, minDate: new Date(2018, 10, 12)});
    </script>
    <c:import url="../templates/adminScript.jsp"></c:import>
</body>

</html>