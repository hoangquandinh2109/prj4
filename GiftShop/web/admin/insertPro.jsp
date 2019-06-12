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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
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
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a></li>
            </ul>
        </div>
        <div class="row">        
            <div class="col-md"></div>
            <div class="col-md-6 col-sm-12">
                <div class="tile">
                    <h3 class="tile-title">Insert new product</h3>
                    <div class="tile-body">
                        <form class="form-horizontal" action="InsertProductServlet" method="post" enctype="multipart/form-data" onsubmit="return Validate(this);">
                            <div class="form-group row">
                                <label class="control-label col-md-3">Product Name<span class="required">*</span></label>
                                <div class="col-md-8">
                                    <input class="form-control" required type="text" name="0"  placeholder="Enter product name" maxlength="100" autocomplete="off">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Product Details<span class="required">*</span></label>
                                <div class="col-md-8">
                                    <textarea class="form-control" required rows="4" name="1" id="1" placeholder="Enter product details" autocomplete="off"></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Product Price ($)<span class="required">*</span></label>
                                <div class="col-md-8">
                                    <input class="form-control" type="number" required name="2" placeholder="Enter product price" min="0"  max="9999" autocomplete="off">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Quantity<span class="required">*</span></label>
                                <div class="col-md-8">
                                    <input class="form-control" type="number" required name="3"  placeholder="Enter product quantity" min="0" max="99" autocomplete="off">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Date Release<span class="required">*</span></label>
                                <div class="col-md-8">
                                    <input class="form-control" type="text" pattern="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d" required name="4" id="datepicker" placeholder="Enter product DateRelease" autocomplete="off">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Category<span class="required">*</span></label>
                                <div class="col-md-8">
                                    <select name="5" id="cate" required class="form-control">
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
                                    <select required name="6" id="type" class="form-control">
                                        <option value="" >Select Type</option>

                                    </select>    
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="control-label col-md-3">Feature<span class="required">*</span></label>
                                <div class="col-md-8">
                                    <select required name="7" class="form-control">
                                        <option value="">Select Feature</option>
                                        <c:forEach var="f" items="${listFea}">
                                            <option value="${f.featureID}">${f.fname}</option>
                                        </c:forEach>
                                    </select>    
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Tags<span class="required">*</span></label>
                                <div class="col-md-8">
                                    <select required name="tagInput" id="mySelect2" class="form-control" multiple="multiple">          
                                        <c:set var="a" value="product"></c:set>
                                        <c:forEach   items="${tags}" var="tag">
                                            <c:if  test="${tag.tagType eq a}">
                                                <option value="${tag.tag}">${tag.tag}</option> 
                                            </c:if>    
                                        </c:forEach>
                                    </select>    
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="control-label col-md-3">Image Product<span class="required">*</span></label>
                                <div class="col-md-8">
                                    <input class="form-control" id="fileElem" style="display:none" onchange="handleFiles(this.files)" type="file" name="file" accept=".png,.jpg,.bmp,.jpeg" multiple="true" >
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
    <script>
                                                var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];
                                                function Validate(oForm) {
                                                var arrInputs = oForm.getElementsByTagName("input");
                                                        for (var i = 0; i < arrInputs.length; i++) {
                                                var oInput = arrInputs[i];
                                                        if (oInput.type == "file") {
                                                var sFileName = oInput.value;
                                                        if (sFileName.length == 0){
                                                alert("Please select 4 images ");
                                                        return false;
                                                }
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
                                                alert("Sorry,your file is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
                                                        return false;
                                                }
                                                if (arrInputs[i].files.length <= 3) {
                                                alert("Please select at least 4 images");
                                                        return false;
                                                }
                                                if (arrInputs[i].files.length >= 5){
                                                alert("Please select only 4 images");
                                                        return false;
                                                }

                                                }
                                                }
                                                }
                                                alert("Success");
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
        $('#mySelect2').select2({
        tags: true
        });
                $(document).ready(function(){
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
        uiLibrary: 'bootstrap4', maxDate: new Date, minDate: new Date(2019, 05, 05)});
    </script>
    <c:import url="../templates/adminScript.jsp"></c:import>
</body>

</html>
