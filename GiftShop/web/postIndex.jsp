<%-- 
    Document   : testAnn
    Created on : Jun 5, 2019, 12:33:11 PM
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

                                <div class="col-md-9 col-sm-12">
                                    <br>
                                    <q style='font-style: italic;font-size: 14px;text-align: center'>A thing cannot buy with the money, It's your gifts!!</q>

                                    <br>
                                    <br>
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link home active"  onclick="lazy()" data-toggle="tab" href="#home"><strong>New</strong></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link menu1"  onclick="lazy()" data-toggle="tab" href="#home"><strong>Hot</strong></a>
                                        </li>
                                    <c:if test="${sessionid ne null}">
                                        <li class="nav-item">
                                            <a class="nav-link menu2" id="menu2e" onclick="lazy()" data-toggle="tab" href="#home"><strong>Liked</strong></a>
                                        </li>
                                    </c:if>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content hop">
                                    <div id="home" class="tab-pane active"><br>
                                        <div  id="getContent" class="wow fadeIn">
                                            <div class="spinner-border text-primary"></div>

                                        </div>
                                    </div>

                                </div>

                            </div><!--LEFT-->

                            <!--RIIGHT-->
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
                                                <a href="#" class="text-decoration-none"><span class="label text-tags">BirthDay</span></a>                              
                                                <a href="#" class="text-decoration-none"><span class="label text-tags">weddingGift</span></a>
                                                <a href="#" class="text-decoration-none"><span class="label text-tags">8/3</span></a>
                                                <a href="#" class="text-decoration-none"><span class="label text-tags">ForWife</span></a>

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
                                <div class="toast mt-3">
                                    <div class="toast-header">
                                        Toast Header
                                    </div>
                                    <div class="toast-body">
                                        Some text inside the toast body
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
                function lazy() {
                    $("#getContent").removeClass("wow fadeIn animated");
                    $("#getContent").addClass("wow fadeIn animated");
                    new WOW().init();
                    $.ajax({
                        type: 'GET',
                        url: "notiServlet",
                        headers: {
                            Accept: 'application/json ,chartset=utf-8',
                            'Content-Type': 'Apllication/json;chartset=utf-8'
                        },
                        success: function(resutlt) {
                            console.log(resutlt);
                            var s=JSON.parse(resutlt);
                            if(s.status[0].status===true){
                                $('.toast').toast('show');
                                console.log("hahah")
                            }
                        }
                    });

                }
                new WOW().init();
                $(document).ready(function() {
                    $("#getContent").text("");
                    $.ajax({
                        type: 'GET',
                        url: 'getPost?action=showAll',
                        headers: {
                            Accept: 'application/json ,chartset=utf-8',
                            'Content-Type': 'Apllication/json;chartset=utf-8'
                        },
                        success: function(result) {
                            $.each(result.POST, function(index) {
                                var arrayTag = result.POST[index].postTag.split(";");
                                var after = new Date(result.POST[index].beforFormatTime);
                                var now = new Date();
                                var distance = (now - after);
                                var time = Math.floor(((distance / 1000) / 60) / 60);
                                var timeText = time + " hour ago";
                                if (time < 1) {
                                    time = Math.floor(((distance / 1000) / 60));
                                    if (time < 1) {
                                        timeText = "Just now!"
                                    }
                                    timeText = time + " minutes ago";
                                }
                                else if (time >= 24) {
                                    time = Math.floor(time / 24);
                                    timeText = time + " Days Ago";
                                }

                                if (result.POST[index].status === false) {
                                    return;
                                }
                                else {
                                    var template = '<div class="shadow-sm p-4 mb-4 bg-white postList"> <div class="media p-1">' +
                                            ' <div class="left-content">' +
                                            ' <div class="p-4 ml-3">' +
                                            '<img src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg" class="rounded-circle avt2" alt="Cinque Terre"/>' +
                                            '</div>' +
                                            ' <a href="#" class="text-decoration-none text-info"><p class="pr-4 text-break text-center font-weight-bold">' + result.POST[index].userName + '</p></a>' +
                                            '</div>' +
                                            ' <div class="media-body content-Same">' +
                                            ' <div class="post-title">' +
                                            ' <a href="postDetailsServlet?pid=' + result.POST[index].postID + '" class="text-decoration-none title-text"><h3  style="margin:0px;padding:0px" class="tx font-weight-bold">' + result.POST[index].postTitle + '</h3></a>' +
                                            ' <a href="#" data-toggle="tooltip" class="text-time text-secondary" id="' + index + '"><small>' + timeText + '</small></a> ' +
                                            ' </div>' +
                                            '   <div class="post-body"> <p>' +
                                            result.POST[index].postContent +
                                            '</p> </div>' +
                                            '<div class="post-footer">' +
                                            ' <div class="tag col1" id="tag' + index + '">' +
                                            '  </div><div class="col2 pl-3"><span>' +
                                            result.POST[index].totalLike + '<i class="far fa-thumbs-up"></i></span></a> <span>' +
                                            result.POST[index].sTotal + '<i class="far fa-comment"></i></span></a>' +
                                            '<a href="#" class="text-decoration-none"><span><i class="far fa-flag"></i></span></a> </div> </div> </div>  </div></div>';
                                    $("#getContent").append(template);
                                    for (var i = 0; i < arrayTag.length; i++) {
                                        var tagTemplate = '<a href="#" class="text-decoration-none"><span class="label text-tags">' + arrayTag[i] + '</span></a>';
                                        $("#tag" + index).append(tagTemplate);
                                    }
                                    document.getElementById(index).title = result.POST[index].dateTime;
                                    $('[data-toggle="tooltip"]').tooltip();
                                }

                            });
                        }
                    });
                    $(".home").on("click", function() {
                        $("#getContent").html('<div class="spinner-border text-primary"></div>');

                        $.ajax({
                            type: 'GET',
                            url: 'getPost?action=showAll',
                            headers: {
                                Accept: 'application/json ,chartset=utf-8',
                                'Content-Type': 'Apllication/json;chartset=utf-8'
                            },
                            success: function(result) {
                                let ax = 0;
                                var arr = [];
                                $("#getContent").text("");
                                $.each(result.POST, function(index) {
                                    var arrayTag = result.POST[index].postTag.split(";");
                                    var after = new Date(result.POST[index].beforFormatTime);
                                    var now = new Date();
                                    var distance = (now - after);
                                    var time = Math.floor(((distance / 1000) / 60) / 60);
                                    var timeText = time + " hour ago";
                                    if (time < 1) {
                                        time = Math.floor(((distance / 1000) / 60));
                                        if (time < 1) {
                                            timeText = "Just now!"
                                        }
                                        timeText = time + " minutes ago";
                                    }
                                    else if (time >= 24) {
                                        time = Math.floor(time / 24);
                                        timeText = time + " Days Ago";
                                    }


                                    if (result.POST[index].status === false) {
                                        return;
                                    }
                                    else {
                                        ax++;
                                        ;
                                        if (ax > 3) {

                                            ax = 1;
                                        }
                                        arr.push(ax)
                                        console.log(arr);
                                        var template = '<div class="shadow-sm p-4 mb-4 bg-white postList"> <div class="media p-1">' +
                                                ' <div class="left-content">' +
                                                ' <div class="p-4 ml-3">' +
                                                '<img src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg" class="rounded-circle avt2" alt="Cinque Terre"/>' +
                                                '</div>' +
                                                ' <a href="#" class="text-decoration-none text-info"><p class="pr-4 text-break text-center font-weight-bold">' + result.POST[index].userName + '</p></a>' +
                                                '</div>' +
                                                ' <div class="media-body content-Same">' +
                                                ' <div class="post-title">' +
                                                ' <a href="postDetailsServlet?pid=' + result.POST[index].postID + '" class="text-decoration-none title-text"><h3  style="margin:0px;padding:0px" class="tx font-weight-bold">' + result.POST[index].postTitle + '</h3></a>' +
                                                ' <a href="#" data-toggle="tooltip" class="text-time text-secondary" id="' + index + '"><small>' + timeText + '</small></a> ' +
                                                ' </div>' +
                                                '   <div class="post-body"> <p>' +
                                                result.POST[index].postContent +
                                                '</p> </div>' +
                                                '<div class="post-footer">' +
                                                ' <div class="tag col1" id="tag' + index + '">' +
                                                '  </div><div class="col2 pl-3"><span>' +
                                                result.POST[index].totalLike + '<i class="far fa-thumbs-up"></i></span></a> <span>' +
                                                result.POST[index].sTotal + '<i class="far fa-comment"></i></span></a>' +
                                                '<a href="#" class="text-decoration-none"><span><i class="far fa-flag"></i></span></a> </div> </div> </div>  </div></div>';
                                        $("#getContent").append(template);
                                        for (var i = 0; i < arrayTag.length; i++) {
                                            var tagTemplate = '<a href="#" class="text-decoration-none"><span class="label text-tags">' + arrayTag[i] + '</span></a>';
                                            $("#tag" + index).append(tagTemplate);
                                        }
                                        document.getElementById(index).title = result.POST[index].dateTime;
                                        $('[data-toggle="tooltip"]').tooltip();
                                    }

                                });
                            }

                        });
                    });
                    $(".menu2").on("click", function() {
                        $("#getContent").text("");
                        $.ajax({
                            type: 'GET',
                            url: 'getPost?action=Liked',
                            headers: {
                                Accept: 'application/json ,chartset=utf-8',
                                'Content-Type': 'Apllication/json;chartset=utf-8'
                            },
                            success: function(result) {
                                console.log(result);
                                $.each(result.POSTLiked, function(index) {
                                    var arrayTag = result.POSTLiked[index].postTag.split(";");
                                    var after = new Date(result.POSTLiked[index].beforFormatTime);
                                    var now = new Date();
                                    var distance = (now - after);
                                    var time = Math.floor(((distance / 1000) / 60) / 60);
                                    var timeText = time + " hour ago";
                                    if (time < 1) {
                                        time = Math.floor(((distance / 1000) / 60));
                                        if (time < 1) {
                                            timeText = "Just now!"
                                        }
                                        timeText = time + " minutes ago";
                                    }
                                    else if (time >= 24) {
                                        time = Math.floor(time / 24);
                                        timeText = time + " Days Ago";
                                    }

                                    if (result.POSTLiked[index].status === false) {
                                        return;
                                    }
                                    else {
                                        var template = '<div class="shadow-sm p-4 mb-4 bg-white postList"> <div class="media p-1">' +
                                                ' <div class="left-content">' +
                                                ' <div class="p-4 ml-3">' +
                                                '<img src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg" class="rounded-circle avt2" alt="Cinque Terre"/>' +
                                                '</div>' +
                                                ' <a href="#" class="text-decoration-none text-info"><p class="pr-4 text-break text-center font-weight-bold">' + result.POSTLiked[index].userName + '</p></a>' +
                                                '</div>' +
                                                ' <div class="media-body content-Same">' +
                                                ' <div class="post-title">' +
                                                ' <a href="postDetailsServlet?pid=' + result.POSTLiked[index].postID + '" class="text-decoration-none title-text"><h3  style="margin:0px;padding:0px" class="tx font-weight-bold">' + result.POSTLiked[index].postTitle + '</h3></a>' +
                                                ' <a href="#" data-toggle="tooltip" class="text-time text-secondary" id="' + index + '"><small>' + timeText + '</small></a> ' +
                                                ' </div>' +
                                                '   <div class="post-body"> <p>' +
                                                result.POSTLiked[index].postContent +
                                                '</p> </div>' +
                                                '<div class="post-footer">' +
                                                '<div class="tag col1" id="tag' + index + '">' +
                                                '</div><div class="col2 pl-3"><span>' +
                                                result.POSTLiked[index].totalLike + '<i class="far fa-thumbs-up"></i></span></a><span>' +
                                                result.POSTLiked[index].sTotal + '<i class="far fa-comment"></i></span></a>' +
                                                '<a href="#" class="text-decoration-none"><span><i class="far fa-flag"></i></span></a> </div> </div> </div>  </div></div>';
                                        $("#getContent").append(template);
                                        for (var i = 0; i < arrayTag.length; i++) {
                                            var tagTemplate = '<a href="#" class="text-decoration-none"><span class="label text-tags">' + arrayTag[i] + '</span></a>';
                                            $("#tag" + index).append(tagTemplate);
                                        }
                                        document.getElementById(index).title = result.POSTLiked[index].dateTime;
                                        $('[data-toggle="tooltip"]').tooltip();
                                    }

                                });
                            }
                        });
                    });
                });
        </script>
    </body>
</html>
