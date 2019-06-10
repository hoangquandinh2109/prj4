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
            <style>
                .hopUser{
                    display:block;
                    width: 100%
                }
                .chua-user{
                    display:inline-block;
                    width: 100%
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
                            <div class="row">
                                <div class="col-md-9">
                                    <br>
                                    <div class="form-ss">
                                        <form class="form-inline">
                                            <input type="text"  title="please write" placeholder="Enter Text" style="width: 30%" class="form-control form-control-sm" id="searchInput">
                                            <div class="form-group">
                                                <select class="form-control" id="search">
                                                    <option value="SearchByTitle">Title</option>
                                                    <option value="SearchByContent">Content Post</option>
                                                    <option value="SearchByTag">Tag</option>
                                                    <option value="SearchByTitle">Author</option>
                                                </select>
                                            </div>



                                        </form>
                                    </div>

                                    <br>

                                    <div class="alert alert-danger alert-dismissible" id="404" style="display: none">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        <strong>No result!</strong> Please search again! or choose another option!.
                                    </div>
                                    <div  class="jumbotron hop">
                                        <div id="home" class="tab-pane active"><br>
                                            <div id="getContent" class="wow row">
                                                <div class="hopUser">
                                                    <div class="chua-user">
                                                          <div class="col-md-4">
                                                    <div class="card ml-4">
                                                    <div class="card-body"><img  class="avt shadow-sm p-2 mb-2 bg-white" src="https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png "></div>
                                                    <div class="card-body">
                                                        <p><u>Author information</u></p>
                                                        <a href="#"><h3 class="font-weight-bold">ahaha</h3></a>
                                                </div> 
                                                <div class="card-footer">
                                                    <span class="border1 border-bottom-0 border-top-0 border-left-0">
                                                        <span>Total Like 2</span>

                                                    </span>
                                                    <span class="border1 border-bottom-0 border-top-0 border-left-0">
                                                        <span>Total Post 3</span>

                                                    </span>

                                                </div>
                                            </div>
                                                </div>
                                                    </div>
                                                </div>
                                              
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm">

                                <br>

                                <c:if test="${sessionname ne null}">   
                                    <div class="right-top">
                                        <div class="cot">
                                            <img class="avt shadow-sm p-2 mb-2 bg-white" src="https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png">
                                        </div>

                                        <div class="cot">

                                            <p class="text-info font-weight-bold pt-2 text-center">${sessionname}</p>
                                            <div class="infor">
                                                <a href="#">0 </a>
                                                <span class="text-secondary">Posts</span>
                                                <br>
                                                <a href="#">0</a>
                                                <span class="text-secondary">Likes</span>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                </c:if>



                                <div class="chude">
                                    <div class="d-md-flex">
                                        <div class="p-2 bg-secondary text-white">Common tags</div>

                                    </div>

                                    <div class="shadow-sm p-4 mb-4 bg-white">
                                        <div class="hop">
                                            <div class="tag p-1">
                                                <c:set var="a" value="post"></c:set>
                                                <c:forEach   items="${tags}" var="tag">
                                                    <c:if  test="${tag.tagType eq a}">
                                                        <a href="#" class="text-decoration-none"><span class="label text-tags">${tag.tag}</span></a> 
                                                        </c:if>    
                                                    </c:forEach>
                                            </div>
                                        </div>


                                    </div>

                                </div>
                                <hr>
                                <div class="d-md-flex">
                                    <div class="p-2 bg-secondary text-white">Top author</div>

                                </div>
                                <div class="tacgia shadow-sm p-4 mb-4 bg-white">

                                    <div class="tg-box">
                                        <div class="left-box">
                                            <img  class="avt2" src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg" width="50px">
                                        </div>
                                        <div class="right-box">
                                            <a href="#" class="text-break text-center text-decoration-none text-info">Toomy</a>
                                        </div>
                                    </div>
                                    <div class="tg-box">
                                        <div class="left-box">
                                            <img  class="avt2" src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg" width="50px">
                                        </div>
                                        <div class="right-box">
                                            <a href="#" class="text-break text-center text-decoration-none text-info">Mr Johnny</a>
                                        </div>
                                    </div>
                                    <div class="tg-box">
                                        <div class="left-box">
                                            <img  class="avt2" src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg" width="50px">
                                        </div>
                                        <div class="right-box">
                                            <a href="#" class="text-break text-center text-decoration-none text-info">Kelvin</a>
                                        </div>
                                    </div>


                                </div>
                                <div class="d-md-flex">
                                    <div class="p-2 bg-secondary text-white">New product</div>

                                </div>
                                <div class="shadow-sm p-4 mb-4 bg-white">
                                    <p>New product Here</p>
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
                $('#select_2').select2();
                $(document).ready(function() {
                    var data;
                    var action;

                    $("#searchInput").keyup(function(e) {
                        var searchData = $("#search").val();
                        //get Data
                        data = $("#searchInput").val();
                        if (data === "") {
                            return;
                        }
                        $.ajax({
                            type: 'GET',
                            url: 'getPost',
                            headers: {
                                Accept: 'application/json ,chartset=utf-8',
                                'Content-Type': 'Apllication/json;chartset=utf-8',
                            },
                            data: {action: searchData, data: data},
                            success: function(result) {
                                // var x=JSON.stringify(result);
                                //  console.log(x);
                                //    console.log(result.POST[0].status);
                                if (result.POST[0].status === false) {
                                    $('#404').show();
                                    $("#getContent").text("");
                                    $("#404").delay(2000).fadeOut(400);

                                    return;
                                }
                                $("#getContent").text("");
                                $.each(result.POST, function(index) {
                                    var arrayTag = result.POST[index].postTag.split(";");
                                    var template = '<div class="shadow-sm p-4 mb-4 bg-white postList"> <div class="media p-1">' +
                                            ' <div class="left-content">' +
                                            ' <div class="p-4 ml-3">' +
                                            '<img src="https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png" class="rounded-circle avt2" alt="Cinque Terre"/>' +
                                            '</div>' +
                                            ' <a href="#" class="text-decoration-none text-info"><p class="pr-4 text-break text-center font-weight-bold">' + result.POST[index].userName + '</p></a>' +
                                            '</div>' +
                                            ' <div class="media-body content-Same">' +
                                            ' <div class="post-title">' +
                                            ' <a href="postDetailsServlet?pid=' + result.POST[index].postID + '" class="text-decoration-none title-text"><h3  style="margin:0px;padding:0px" class="tx font-weight-bold">' + result.POST[index].postTitle + '</h3></a>' +
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
                                    $("#getContent").removeClass("wow fadeIn animated");
                                    $("#getContent").addClass("wow fadeIn animated");

                                    new WOW().init();
                                    document.getElementById(index).title = result.POST[index].dateTime;
                                    $('[data-toggle="tooltip"]').tooltip();
                                });
                            }
                        });
                    });
                    $("#search").change(function() {
                        var searchData = $("#search").val();
                        data = $("#searchInput").val();
                        var x = "";
                        var y = x.localeCompare($("#searchInput").val());
                        if (y === 0) {
                            return;
                        }
                        $.ajax({
                            type: 'GET',
                            url: 'getPost',
                            headers: {
                                Accept: 'application/json ,chartset=utf-8',
                                'Content-Type': 'Apllication/json;chartset=utf-8',
                            },
                            data: {action: searchData, data: data},
                            success: function(result) {
                                if (result.POST[0].status === false) {
                                    $('#404').show();
                                    $("#404").delay(2000).fadeOut(400);
                                    $("#getContent").text("");
                                    return;
                                }
                                $("#getContent").text("");
                                $.each(result.POST, function(index) {

                                    var arrayTag = result.POST[index].postTag.split(";");
                                    var template = '<div class="shadow-sm p-4 mb-4 bg-white postList"> <div class="media p-1">' +
                                            ' <div class="left-content">' +
                                            ' <div class="p-4 ml-3">' +
                                            '<img src="https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png" class="rounded-circle avt2" alt="Cinque Terre"/>' +
                                            '</div>' +
                                            ' <a href="#" class="text-decoration-none text-info"><p class="pr-4 text-break text-center font-weight-bold">' + result.POST[index].userName + '</p></a>' +
                                            '</div>' +
                                            ' <div class="media-body content-Same">' +
                                            ' <div class="post-title">' +
                                            ' <a href="postDetailsServlet?pid=' + result.POST[index].postID + '" class="text-decoration-none title-text"><h3  style="margin:0px;padding:0px" class="tx font-weight-bold">' + result.POST[index].postTitle + '</h3></a>' +
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
                                    $("#getContent").removeClass("wow fadeIn animated")
                                    $("#getContent").addClass("wow fadeIn animated");
                                    new WOW().init();
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
