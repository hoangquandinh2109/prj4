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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    <li class="breadcrumb-item">Forms</li>
                    <li class="breadcrumb-item"><a href="#">Sample Forms</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md"></div>
                <div class="col-md-6 col-sm-12">
                    <div class="tile">
                        <h3 class="tile-title">Insert new product</h3>
                        <div class="tile-body">
                            <form id="fileForm" class="form-horizontal" action="updateProductServlet" method="post" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Product ID </label>
                                    <div class="col-md-8">
                                        <input readonly value="${product.proID.proID}" id="txtID" class="form-control" type="text" name="id" required data-error-msg="Must enter ID?" placeholder="Enter product ID">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="control-label col-md-3">Product Name </label>
                                <div class="col-md-8">
                                    <input value="${product.proID.proName}" class="form-control" type="text" id="txtName" name="name" placeholder="Enter product name">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Product Details</label>
                                <div class="col-md-8">
                                    <textarea  class="form-control" rows="4" name="details" placeholder="Enter product details">${product.proID.proDetails}</textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Product Price </label>
                                <div class="col-md-8">
                                    <input class="form-control" value="${product.proID.proPrice}" type="number" name="price" placeholder="Enter product price">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Quantity</label>
                                <div class="col-md-8">
                                    <input class="form-control" value="${product.proID.quantity}" type="number" name="quantity" placeholder="Enter product quantity">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Date Release </label>
                                <div class="col-md-8">
                                    <input class="form-control" value="<fmt:formatDate value="${product.proID.dateRelease}" pattern="MM/dd/yyyy"/>" type="text" name="datepicker" id="datepicker" placeholder="Enter product DateRelease">

                                </div>
                            </div> 
                            <div class="form-group row">
                                <label class="control-label col-md-3">Product Tags </label>
                                <div class="col-md-8">
                                    <input class="form-control" value="${product.proID.tags}" type="text" name="tags" placeholder="Enter product tags">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Category</label>
                                <div class="col-md-8">
                                    <select name="cboCategory" class="form-control">
                                        
                                        <c:forEach var="c1" items="${listCat}">
                                            <option value="${c1.catID}">${c1.catName}</option>
                                        </c:forEach>
                                    </select>    
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Type</label>
                                <div class="col-md-8">
                                    <select name="cboType" class="form-control">
                                        
                                        <c:forEach var="c" items="${listType}">
                                            <option value="${c.typeID}">${c.typeName}</option>
                                        </c:forEach>
                                    </select>    
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Image Product</label>
                                <div class="col-md-8">
                                    <input type="hidden" value="${product.imgID.imgID}" name="imgID"/>
                                    <input  class="form-control" id="fileElem" style="display:none" onchange="handleFiles(this.files)" type="file" name="file" accept=".png,.jpg,.bmp" multiple="true" >
                                    <a href="#" id="fileSelect">Change image</a> 
                                    <div id="fileList">
                                        <p><img src="productImage/${product.imgID.imgName}" alt="pets" width="150px" height="150px" ></p>
                                    </div>            
                                </div>
                            </div>
                            <div class="form-group row"> 
                                <label class="control-label col-md-3">Status</label>
                                <div class="col-md-8 custom-radio">
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input class="custom-control-input" type="radio" name="status" id="status" 
                                               value="Active" ${product.proID.proStatus=='true'?'checked':''}>
                                        <label class="custom-control-label" for="status">Active</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input class="custom-control-input" type="radio" name="status" id="status1"
                                               value="Disable" ${product.proID.proStatus=='false'?'checked':''}>
                                        <label class="custom-control-label" for="status1">Disable</label>
                                    </div>
                                </div> 
                            </div>
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <input type="submit" class="btn btn-primary" value="Ok" />
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
    <script>
                //SHOW IMAGE
                window.URL = window.URL || window.webkitURL;
                const fileSelect = document.getElementById("fileSelect"),
                fileElem = document.getElementById("fileElem"),
                fileList = document.getElementById("fileList");
                fileSelect.addEventListener("click", function (e) {
                if (fileElem) {
                fileElem.click();
                }
                e.preventDefault(); // prevent navigation to "#"
                }, false);
                function handleFiles(files) {
                if (!files.length) {
                fileList.innerHTML = "<p>No files selected!</p>";
                } else {
                fileList.innerHTML = "";
                        const list = document.createElement("ul");
                        fileList.appendChild(list);
                        for (let i = 0; i < files.length; i++) {
                const li = document.createElement("li");
                        list.appendChild(li);
                              const img = document.createElement("img");
                              img.src = window.URL.createObjectURL(files[i]);
                              img.height = 60;
                              img.onload = function() {
                        window.URL.revokeObjectURL(this.src);
                              }
                      li.appendChild(img);
                              const info = document.createElement("span");
                              info.innerHTML = files[i].name + ": " + files[i].size + " bytes";
                              li.appendChild(info);
                    }
                  }
                }
    </script>

    <script>
        $('#datepicker').datepicker({
        uiLibrary: 'bootstrap4', maxDate: new Date, minDate: new Date(2018, 10, 12)});
    </script>
    <c:import url="../templates/adminScript.jsp"></c:import>
</body>

</html>