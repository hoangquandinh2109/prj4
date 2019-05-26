<%-- 
    Document   : insertPor
    Created on : Apr 28, 2019, 6:07:36 PM
    Author     : bemap
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
                            <form id="fileForm" class="form-horizontal" action="InsertProductServlet" method="post" enctype="multipart/form-data" onsubmit="return Validate(this);">
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Product Name<span class="required">*</span></label>
                                    <div class="col-md-8">
                                        <input class="form-control" required type="text" name="name" placeholder="Enter product name" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Product Details<span class="required">*</span></label>
                                    <div class="col-md-8">
                                        <textarea class="form-control" required rows="4" name="details" placeholder="Enter product details" autocomplete="off"></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Product Price<span class="required">*</span></label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="number" name="price" placeholder="Enter product price" min="0"  max="99999" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Quantity<span class="required">*</span></label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="number" name="quantity" data-error-msg="Must enter your name?" placeholder="Enter product quantity" min="0" max="99999" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Date Release<span class="required">*</span></label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" required="" name="datepicker" id="datepicker" placeholder="Enter product DateRelease" autocomplete="off">
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Product Tags<span class="required">*</span></label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" name="tags" placeholder="Enter product tags" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Category<span class="required">*</span></label>
                                    <div class="col-md-8">
                                        <select name="cboCategory"  required class="form-control">
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
                                    <select required name="cboType" class="form-control">
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
                                    <input required class="form-control" id="fileElem" style="display:none" onchange="handleFiles(this.files)" type="file" name="file" accept=".png,.jpg,.bmp" multiple="true" >
                                    <a href="#" id="fileSelect">Select some files</a> 
                                    <div id="fileList">
                                        <p>No files selected!</p>
                                    </div>            
                                </div>
                            </div>
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <input type="submit" class="btn btn-primary" value="Ok" />
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
    </main>
    <script>
                var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".png"];
                function Validate(oForm) {
                var arrInputs = oForm.getElementsByTagName("input");
                        for (var i = 0; i < arrInputs.length; i++) {
                var oInput = arrInputs[i];
                        if (oInput.type == "file") {
                var sFileName = oInput.value;
                        if (sFileName.length > 0) {
                var blnValid = false;
                        for (var j = 0; j < _validFileExtensions.length; j++) {
                var sCurExtension = _validFileExtensions[j];
                        if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                blnValid = true;
                        break;
                }
                }

                if (!blnValid) {
                alert("Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
                        return false;
                }
                }
                }
                }

                return true;
                }
    </script>
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
<!-- script imgae
        $("#fileElem").change(function() {

        var val = $(this).val();
                switch (val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
        case 'gif': case 'jpg': case 'png':
                alert("an image");
                break;
                default:
                $(this).val('');
                // error message here
                alert("not an image");
                $("#fileList").val('');
                break;
                }
        });
        <script>
            
                $("#elem1").validate({
        rules: {
                "txtID": {
                required: true,
                minlength: 2
        },
                "txtName": {
                required: true,
                        rangelength: [6, 30]
                }
                
        }
        });   
        </script>
-->