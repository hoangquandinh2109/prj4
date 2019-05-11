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
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
                            <form class="form-horizontal" action="InsertProductServlet" method="post" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Product ID </label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text"  name="id" placeholder="Enter product ID">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="control-label col-md-3">Product Name </label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" name="name" placeholder="Enter product name">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Product Details</label>
                                    <div class="col-md-8">
                                        <textarea class="form-control" rows="4" name="details" placeholder="Enter product details"></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Product Price </label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" name="price" placeholder="Enter product price">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Quantity</label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" name="quantity" placeholder="Enter product quantity">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Date Release </label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" name="datepicker" id="datepicker" placeholder="Enter product DateRelease">
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Product Tags </label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" name="tags" placeholder="Enter product tags">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Category</label>
                                    <div class="col-md-8">
                                        <select name="cboCategory" class="form-control">
                                            <option>Select Category</option>
                                        <c:forEach var="c" items="${listCat}">
                                            <option value="${c.catID}">${c.catName}</option>
                                        </c:forEach>
                                    </select>
                                    <!--        
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" name="catID" placeholder="Enter product tags">
                                    </div>
                                    -->  
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Image Product</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="fileElem" type="file" name="file" accept=".png,.jpg,.bmp" multiple="true" style="display:none" onchange="handleFiles(this.files)">
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
