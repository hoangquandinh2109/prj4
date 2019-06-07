<%-- 
    Document   : searchPage
    Created on : Jun 5, 2019, 11:03:12 AM
    Author     : bemap
--%>

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
        </head>
        <body ng-app="cangcucot"  ng-controller="cart">
            <div class="content-n-cart clearfix">
                <div class="content">
                    <div class="clickdetrove"></div>
                <c:import url="templates/header.jsp"></c:import>
                    <div class="web-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-9">
                                    <br>
                                    <div class="form-ss">
                                        <form class="form">
                                            <input type="text"  title="please write" placeholder="Enter Text" style="width: 50%" class="form-control mb-2 mr-sm-2" id="searchInput">
                                            <div class="form-check mr-2 form-inline">

                                                <div class="mr-2">
                                                    <label>Search By:</label>
                                                </div>

                                                <div class="custom-control custom-radio mr-4">
                                                    <input type="radio" class="custom-control-input" checked="check" value="searchByTitle" id="customRadio" name="search">
                                                    <label class="custom-control-label" for="customRadio">Title</label>

                                                </div>    
                                                <div class="custom-control custom-radio mr-4">
                                                    <input type="radio" class="custom-control-input" id="customRadio1" value="searchByContent" name="search">
                                                    <label class="custom-control-label" for="customRadio1">Content post</label>

                                                </div>   
                                                <div class="custom-control custom-radio mr-4">
                                                    <input type="radio" class="custom-control-input" id="customRadio2" value="searchByTag" name="search">
                                                    <label class="custom-control-label" for="customRadio2">Tag</label>

                                                </div>  
                                                <div class="custom-control custom-radio mr-4">
                                                    <input type="radio" class="custom-control-input" id="customRadio3" value="author" name="search">
                                                    <label class="custom-control-label" for="customRadio3">Author</label>

                                                </div>  
                                            </div>

                                        </form>
                                    </div>
                                    <br>
                                  
                                    <div  class="jumbotron hop">
                                        <div id="home" class="container tab-pane active"><br>
                                            <div id="getContent">

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <c:import url="templates/footer.jsp"></c:import>
                </div>

            </div>
        <c:import url="templates/postScript.jsp"></c:import>


        <script>

                $(document).ready(function() {
                    var data;
                    var action;

                    $("#searchInput").keyup(function(e) {
                        if (e.keyCode === 13) {

                            //get Data
                            data = $("#searchInput").val();
                            //get Action
                            action = $("input[type=radio]:checked").val();
                            var x = "";
                            //valid data
                            var y = x.localeCompare(data);
                            if (y === 0) {

                                return;
                            }
                            //check data
                            $.ajax({
                                type: 'GET',
                                url: 'getPost',
                                headers: {
                                    Accept: 'application/json ,chartset=utf-8',
                                    'Content-Type': 'Apllication/json;chartset=utf-8',
                                },
                                data: {action: action, data: data},
                                success: function(result) {
                                    if (result.POST[0].status === false) {
                                        alert("KO TIM THAY :(");
                                        return;
                                    }

                                    $("#getContent").text("");
                                    $.each(result.POST, function(index) {
                                        var arrayTag = result.POST[index].postTag.split(";");
                                        var template = '<div class="shadow-sm p-4 mb-4 bg-white postList"> <div class="media p-1">' +
                                                ' <div class="left-content">' +
                                                ' <div class="p-4 ml-3">' +
                                                '<img src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg" class="rounded-circle avt2" alt="Cinque Terre"/>' +
                                                '</div>' +
                                                ' <a href="#" class="text-decoration-none text-info"><p class="pr-4 text-break text-center font-weight-bold">' + result.POST[index].userName + '</p></a>' +
                                                '</div>' +
                                                ' <div class="media-body content-Same">' +
                                                ' <div class="post-title">' +
                                                ' <a href="postDetailsServlet/' + result.POST[index].postID + '" class="text-decoration-none title-text"><h3  style="margin:0px;padding:0px" class="tx font-weight-bold">' + result.POST[index].postTitle + '</h3></a>' +
                                                ' <a href="#" data-toggle="tooltip" class="text-time text-secondary" id="' + index + '"><small>1 day ago</small></a> ' +
                                                ' </div>' +
                                                '   <div class="post-body"> <p>' +
                                                result.POST[index].postContent +
                                                '</p> </div>' +
                                                '<div class="post-footer">' +
                                                ' <div class="tag col1" id="tag' + index + '">' +
                                                '  </div><div class="col2 pl-3"><span>1' +
                                                '<i class="far fa-thumbs-up"></i></span></a> <span>' +
                                                '1<i class="far fa-comment"></i></span></a>' +
                                                '<a href="#" class="text-decoration-none"><span><i class="far fa-flag"></i></span></a> </div> </div> </div>  </div></div>';



                                        $("#getContent").append(template);
                                        for (var i = 0; i < arrayTag.length; i++) {
                                            var tagTemplate = '<a href="#" class="text-decoration-none"><span class="label text-tags">' + arrayTag[i] + '</span></a>';
                                            $("#tag" + index).append(tagTemplate);
                                        }

                                        document.getElementById(index).title = result.POST[index].dateTime;
                                        $('[data-toggle="tooltip"]').tooltip();



                                    });
                                }
                            });
                            //send request

                            return false;
                        }

                    });
                    $("input[type=radio][name=search]").change(function() {
                        data = $("#searchInput").val();
                        var x = "";
                        var y = x.localeCompare($("#searchInput").val());
                        if (y === 0) {

                            return;
                        }
                        action = $("input[type=radio]:checked").val();
                        $.ajax({
                            type: 'GET',
                            url: 'getPost',
                            headers: {
                                Accept: 'application/json ,chartset=utf-8',
                                'Content-Type': 'Apllication/json;chartset=utf-8',
                            },
                            data: {action: action, data: data},
                            success: function(result) {
                                if (result.POST[0].status === false) {
                                    alert("KO TIM THAY :(");
                                    return;
                                }
                                $("#getContent").text("");
                                $.each(result.POST, function(index) {

                                    var arrayTag = result.POST[index].postTag.split(";");
                                    var template = '<div class="shadow-sm p-4 mb-4 bg-white postList"> <div class="media p-1">' +
                                            ' <div class="left-content">' +
                                            ' <div class="p-4 ml-3">' +
                                            '<img src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg" class="rounded-circle avt2" alt="Cinque Terre"/>' +
                                            '</div>' +
                                            ' <a href="#" class="text-decoration-none text-info"><p class="pr-4 text-break text-center font-weight-bold">' + result.POST[index].userName + '</p></a>' +
                                            '</div>' +
                                            ' <div class="media-body content">' +
                                            ' <div class="post-title">' +
                                            ' <a href="postDetailsServlet/' + result.POST[index].postID + '" class="text-decoration-none title-text"><h3  style="margin:0px;padding:0px" class="tx font-weight-bold">' + result.POST[index].postTitle + '</h3></a>' +
                                            ' <a href="#" data-toggle="tooltip" class="text-time text-secondary" id="' + index + '"><small>1 day ago</small></a> ' +
                                            ' </div>' +
                                            '   <div class="post-body"> <p>' +
                                            result.POST[index].postContent +
                                            '</p> </div>' +
                                            '<div class="post-footer">' +
                                            ' <div class="tag col1" id="tag' + index + '">' +
                                            '  </div><div class="col2 pl-3"><span>1' +
                                            '<i class="far fa-thumbs-up"></i></span></a> <span>' +
                                            '1<i class="far fa-comment"></i></span></a>' +
                                            '<a href="#" class="text-decoration-none"><span><i class="far fa-flag"></i></span></a> </div> </div> </div>  </div></div>';




                                    $("#getContent").append(template);
                                    for (var i = 0; i < arrayTag.length; i++) {
                                        var tagTemplate = '<a href="#" class="text-decoration-none"><span class="label text-tags">' + arrayTag[i] + '</span></a>';
                                        $("#tag" + index).append(tagTemplate);
                                    }
                                    document.getElementById(index).title = result.POST[index].dateTime;
                                    $('[data-toggle="tooltip"]').tooltip();



                                });
                            }
                        });
                    });

                    $(".menu1").on("click", function() {

                    });

                });
        </script>
    </body>
</html>
