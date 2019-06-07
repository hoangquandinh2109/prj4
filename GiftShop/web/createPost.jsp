<%-- 
    Document   : Quills
    Created on : May 28, 2019, 2:52:01 PM
    Author     : bemap
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <c:import url="templates/postHead.jsp"></c:import>
         <link rel="stylesheet" href="assets/css/index.css"/>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <style>
            li {
    list-style-type: none;
}
        </style>
        </head>
      
        <body ng-app="cangcucot"  ng-controller="cart">
            <div class="content-n-cart clearfix">
                <div class="content">
                    <div class="clickdetrove"></div>
                <c:import url="templates/header.jsp"></c:import>
                    <div class="web-body">
                        <div class="container-fluid">
                            <div style="text-align: center">
                                <h3 class="text-primary font-weight-bold" >Create your Post/How to use</h3>
                                <ul>
                                    <li><span style="color:red">*</span>Writing the title, other people can search your post</li>
                                    <li><span style="color:red">*</span>Writing tags ,more tag more useful</li>
                                    <li><span style="color:red">*</span>Design your post, and wait people react about it!!</li>
                                </ul>
                            </div>
                            <div class="row">

                                <div class="col-md-12">
                                    <br>
                                    <form action="Home" method="GET" id="myForm">
                                        <div id="contentHere">

                                        </div>
                                        <div class="tags">
                                            <select name="gg" id="mySelect2" style="width: 100%"  multiple="multiple">
                                                <option>One</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>

                                            </select>
                                        </div>
                                        <br>
                                        <div id="editor" >
                                            <p>dit me</p>
                                        </div>
                                        <br>
                                        <button type="submit" id="btn1" class="btn btn-primary btn-block">Upload Post</button>

                                    </form>
                                    <div>
                                        blabla
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                <c:import url="templates/footer.jsp"></c:import>
                </div>
            </div>
        <c:import url="templates/postScript.jsp"></c:import>

        <!-- Include the Quill library -->

        <!-- Initialize Quill editor -->
        <script>
                    console.log("");
                    $(document).ready(function() {
            $("#myForm").submit(function() {
            var myOP = [];
                    var string = "";
                    myOP = $('form').serializeArray();
                    $.each(myOP, function(index, value) {
                    console.log(value.value.toString());
                            string = string.concat(";", value.value.toString());
                            console.log(string);
                    });
                    // var a=$('.gg').val();
                    string = string.slice(1);
                    var title = quills.getText();
                    var contentPost = JSON.stringify(quill.getContents());
                    //    var ss = JSON.parse(strins);
                    var infor = quill.getText();
                    //   console.log("JSON.stringiFY"+strins);
                    //   console.log("JSON.parse"+ss);
                    //   console.log();
                    $.ajax({
                    type: 'POST',
                            url: 'createPostServlet',
                            dataType: 'json',
                            data: {content: contentPost, tag:string, infor:infor, title:title},
                            success: function(data) {


                            }
                    });
                    alert("THANH CONG nHE");
                    return true;
            });
                    $('#mySelect2').select2({
            tags: true
            });
                    var IMGUR_CLIENT_ID = 'bcab3ce060640ba';
                    var IMGUR_API_URL = 'https://api.imgur.com/3/image';
                    var toolbarOptions = {
                    container: [
                            [{'header': [1, 2, false, 4]}],
                            ['bold', 'italic', 'underline'],
                            [{'color': []}, {'background': []}],
                            [{'list': 'ordered'}, {'list': 'bullet'}],
                            [{'script': 'sub'}, {'script': 'super'}],
                            [{'indent': '-1'}, {'indent': '+1'}],
                            [{'align': []}],
                            ['blockquote', 'code', 'link', 'image', 'video']
                    ],
                            handlers: {
                            // handlers object will be merged with default handlers object

                            'image': function image() {
                            var _this3 = this;
                                    var fileInput = this.container.querySelector('input.ql-image[type=file]');
                                    if (fileInput == null) {
                            fileInput = document.createElement('input');
                                    fileInput.setAttribute('type', 'file');
                                    fileInput.setAttribute('accept', 'image/png, image/gif, image/jpeg, image/bmp, image/x-icon');
                                    fileInput.classList.add('ql-image');
                                    fileInput.addEventListener('change', function() {
                                    console.log(fileInput.files[0]);
                                            console.log(fileInput.files[0].type);
                                            var data = new FormData();
                                            data.append('image', fileInput.files[0]);
                                            var xhr = new XMLHttpRequest();
                                            xhr.open('POST', IMGUR_API_URL, true);
                                            xhr.setRequestHeader('Authorization', 'Client-ID ' + IMGUR_CLIENT_ID);
                                            xhr.onreadystatechange = function() {
                                            if (xhr.readyState === 4) {
                                            var response = JSON.parse(xhr.responseText);
                                                    if (response.status === 200 && response.success) {
                                            quill.insertEmbed(10, 'image', response.data.link);
                                            } else {
                                            var reader = new FileReader();
                                                    reader.onload = function(e) {
                                                    console.log("cannot insert hinh``");
                                                    };
                                                    reader.readAsDataURL(image);
                                            }
                                            }
                                            }
                                    xhr.send(data);
                                            console.log(data);
                                            /*if (fileInput.files != null && fileInput.files[0] != null) {
                                             var reader = new FileReader();
                                             reader.onload = function(e) {
                                             var range = _this3.quill.getSelection(true);
                                             _this3.quill.updateContents(new _quillDelta2.default().retain(range.index).delete(range.length).insert({image: e.target.result}), _emitter2.default.sources.USER);
                                             _this3.quill.setSelection(range.index + 1, _emitter2.default.sources.SILENT);
                                             fileInput.value = "";
                                             };
                                             reader.readAsDataURL(fileInput.files[0]);
                                             }*/
                                    });
                                    this.container.appendChild(fileInput);
                            }
                            fileInput.click();
                            },
                                    'link': function(value) {
                                    if (value) {
                                    var href = prompt('Enter the LInk');
                                            this.quill.format('link', href);
                                    } else {
                                    this.quill.format('link', false);
                                    }
                                    }
                            }
                    }

            var quill = new Quill('#editor', {
            modules: {
            toolbar: toolbarOptions
            },
                    placeholder: 'Insert an image...',
                    theme: 'snow',
            });
                    var quills = new Quill('#contentHere', {
                    });
                    quills.focus();
                    quills.on('text-change', function() {
                    if (quills.getLength() === 51) {
                    alert("MAX IS 50 char");
                    }
                    if (quills.getText().length >= 50) {
                    quills.deleteText(50, 3);
                    }
                    var x = quills.getContents().ops[2].insert.toString();
                            var str2 = "";
                            var n = x.localeCompare(str2);
                            if (n === 1) {
                    alert("cannot press enter in title");
                            quills.setContents({
                            ops: [
                            {insert: 'YOUR TITLE'},
                            {insert: '\n', attributes: {header: 1}},
                            ]
                            });
                    }
                    });
                    quills.setContents({
                    ops: [
                    {insert: 'Title is here'},
                    {insert: '\n', attributes: {header: 1}},
                    ]
                    });
                    ///$('#btn1').click(function() {

                    /*     this.handlers.image;
                     console.log(quill.getContents());
                     var strins = JSON.stringify(quill.getContents());
                     var ss = JSON.parse(strins);
                     console.log(strins);
                     $.ajax({
                     type: 'POST',
                     url: 'getPost?action=create',
                     dataType: 'json',
                     data: {data: strins},
                     success: function(data) {
                     console.log("sever TOLS " + data);
                     //       var obj = JSON.parse(data);
                     //      quills.setContents(obj);
                     }
                     });*/
                    //      return false;
                    // });


            });




        </script>
    </body>
</html>