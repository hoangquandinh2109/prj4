<%-- 
    Document   : post_details
    Created on : Jun 2, 2019, 3:26:20 PM
    Author     : bemap
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="templates/postHead.jsp"></c:import>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css"/>
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
                            <c:choose>
                                <c:when test="${p.postStatus eq true}">
                                    <div class="col-md-9">
                                        <br>
                                        <div class="shadow p-4 mb-4 bg-white">
                                            <div class="post-title" id="titleHere">
                                                <span style="font-size:36px"  class="edpostHide font-weight-bold">${p.titlePost}</span>
                                                <c:if test="${sessionid eq p.cusID.cusID}">
                                                    <button style="float:right" id="deletePost" onclick='deletePostFunction(${p.postID})' class="edpostHide btn btn-outline-danger"><i class="fal fa-trash-alt"></i></button>
                                                    <button style="float:right" class="edpostHide btn btn-outline-primary edit-Post" style="cursor: pointer"  onClick="settingEditPost(false)">
                                                        <i class="fal fa-edit"></i></button>
                                                    </c:if>
                                                <input type="text" value='${p.titlePost}' id='edTitlePost' class="edpostShow form-control form-control-lg" style="display:none">
                                            </div>
                                            <hr>
                                            <div class="contentPost">
                                                <div class="content-head">
                                                    <img  class="avt2" src="https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png ">
                                                    <a href="#" data-toggle="tooltip" class="text-time text-secondary text-decoration-none" title="February 19, 2016!">${p.cusID.cusName} <small>1 day ago</small></a>  
                                                    <br>
                                                </div>
                                                <div class="content-body" id="content-body">
                                                    <img src="https://raw.githubusercontent.com/wiki/ocornut/imgui/web/v149/gallery_TheDragonsTrap-01-thumb.jpg" width="100%"/>
                                                    <hr>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="content-footer">
                                                <div class="tag col1 edpostHide">
                                                    <c:forTokens items="${p.postTag}" delims=";" var="tag">
                                                        <a href="#" class="text-decoration-none"><span class="label text-tags">${tag}</span></a>
                                                        </c:forTokens>
                                                </div>
                                                <form action='#' id='myForm'>
                                                    <div class="tag col1 tags edpostShow" style="display:none">
                                                        <select name="gg" id="mySelect2" style="width: 100%"  multiple="multiple">
                                                            <c:forTokens items="${p.postTag}" delims=";" var="tag">
                                                                <option value="${tag}">${tag}</option>
                                                            </c:forTokens>
                                                        </select>
                                                        <br>
                                                    </div>
                                                    <!--LIKE COMMENT ICON HERE-->
                                                    <div class="col2 pl-4 edpostHide">
                                                        <c:choose>
                                                            <c:when test="${checkLike eq true}">
                                                                <span id="resetLike">${totalLike} <i style="color:blue" class="far fa-thumbs-up"></i></span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <span id="resetLike">${totalLike} <i id="likeCount" class="far fa-thumbs-up"></i></span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        <span id="sTotal">${totalComment}</span><i class="far fa-comment"></i>
                                                        <a  href="#" data-toggle="tooltip" class="text-time text-secondary" title="Report this post!"><span class="button"><i class="far fa-flag pl-1"></i></span></a>
                                                    </div>

                                                    <div class="col1 edpostShow" style='display:none;float: left;'>
                                                        <br>
                                                        <button type="submit" class="edpostShow btn btn-primary" >Update</button>
                                                        <button type="submit" onclick='deletePostFunction(${p.postID})' class="edpostShow btn btn-danger" >Delete</button>

                                                    </div>
                                                </form>

                                            </div>
                                            <hr>

                                            <div class="comment mw-100">
                                                <div class="pl-10">
                                                    <c:choose>
                                                        <c:when test="${checkLike eq true}">
                                                            <button type="button" id="hitLike" class="btn btn-outline-primary"> <span><i class="far fa-thumbs-up"></i> Liked</span></button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button type="button" id="hitLike" class="btn btn-outline-secondary"> <span><i class="far fa-thumbs-up"></i> Like</span></button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <button type="button" class="btn btn-outline-secondary"  data-toggle="collapse" data-target="#cmtContent"><span><i class="far fa-comment"></i></span>Comment</button>
                                                </div>
                                                <div id="cmtContent" class="collapse show">

                                                    <hr>
                                                    <c:forEach items="${cmt}" var="cmt">
                                                        <div class="media" id='cmtRepID${cmt.commentID}'>
                                                            <img src="https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">
                                                            <div class="media-body config" id="cainay${cmt.commentID}">
                                                                <c:choose>
                                                                    <c:when test="${cmt.cusID.cusID eq p.cusID.cusID}">
                                                                        <h4 class="text-dark font-weight-bold" title="Author's Post">${cmt.cusID.cusName}</h4>
                                                                        <a href="#" data-toggle="tooltip" class="text-time text-secondary" title="${cmt.dateComment}"><small>${cmt.dateComment}</small></a> 
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                        <h4>${cmt.cusID.cusName}</h4>
                                                                        <a href="#" data-toggle="tooltip" class="text-time text-secondary" title="${cmt.dateComment}"><small>${cmt.dateComment}</small></a> 
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                <div class="p-2">
                                                                    <span id="edCmtValue${cmt.commentID}" class="text-dark editCmt pt-2 pl-3 pb-2 pr-3">${cmt.commentContent}</span>
                                                                    <input type="text" id="editCmtInput${cmt.commentID}" at='${cmt.commentID}'  value="${cmt.commentContent}"  name="editCmt" class="form-control pull-right"  placeholder="Edit a reply... if this field is blank this comment will be deleted" style="display:none;"/>
                                                                    <br>
                                                                    <span class="btn reply text-primary" id='haha${cmt.commentID}' onClick="$('#cmt${cmt.commentID}').show();"><i class="fal fa-reply"></i>Reply</span> 

                                                                    <c:if test="${sessionid eq cmt.cusID.cusID}">
                                                                        <button class="btn btn-outline-primary edit-cmt" style="cursor: pointer"  onClick="$('#editCmtInput${cmt.commentID}').show();
                                                                            $('#edCmtValue${cmt.commentID}').hide();"><i class="fal fa-edit"></i></button>
                                                                        <button class="btn btn-outline-danger" onclick="deleteCommentFunction(${cmt.commentID})"><i class="fal fa-trash-alt"></i></button>
                                                                        </c:if>
                                                                </div>
                                                                <c:forEach items="${rep}" var="rep">
                                                                    <c:if test="${rep.commentID.commentID eq cmt.commentID}">
                                                                        <div class="media p-2" id='zz${rep.repID}'>
                                                                            <img src="https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png" alt="Jane Doe" class="mr-3 mt-3 rounded-circle" style="width:45px;">
                                                                            <div class="media-body">
                                                                                <c:choose>
                                                                                    <c:when test="${rep.cusID.cusID eq p.cusID.cusID}">
                                                                                        <h4  class="text-dark font-weight-bold" title="Author's Post">${cmt.cusID.cusName}</h4>
                                                                                        <a href="#" data-toggle="tooltip" class="text-time text-secondary" title="${cmt.dateComment}"><small>${cmt.dateComment}</small></a> 
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                        <h4>${rep.cusID.cusName}</h4><a href="#" data-toggle="tooltip" class="text-time text-secondary" title="${cmt.dateComment}"><small>${cmt.dateComment}</small></a> 
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                <div class="p-2">
                                                                                    <span id='rep${rep.repID}' class="text-dark editCmt pt-2 pl-3 pb-2 pr-3">${rep.replyContent}</span>
                                                                                    <input type="text" id="edit${rep.repID}" at='${rep.repID}'  value="${rep.replyContent}"  name="editReply" class="form-control pull-right"  placeholder="Edit a reply... if this field is blank this comment will be deleted" style="display:none;"/>

                                                                                    <br>
                                                                                    <span class="btn reply text-primary" id='haha${rep.repID}'  onClick="$('#cmt${cmt.commentID}').show();"><i class="fal fa-reply"></i>Reply</span> 
                                                                                    <c:if test="${sessionid eq rep.cusID.cusID}">
                                                                                        <button class="btn btn-outline-primary edit-cmt" style="cursor: pointer"  onClick="$('#edit${rep.repID}').show();
                                                                                            $('#rep${rep.repID}').hide();"><i class="fal fa-edit"></i></button>
                                                                                        <button id="delete${rep.repID}}" onClick=" deleteReplyFunction(${rep.repID});" class="btn btn-outline-danger"><i class="fal fa-trash-alt"></i></button>
                                                                                        </c:if>

                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <input type="text" id="cmt${cmt.commentID}" at='${cmt.commentID}'  name="createReply" class="form-control pull-right"  placeholder="Write a reply..." style="display:none;"/>

                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                    <div id="chovaoday">

                                                    </div>

                                                    <hr>
                                                    <div class="input-group mb-3">
                                                        <input type="text" id="inputCmt"  placeholder="SUBMIT YOUR COMMENT HERE" class="form-control form-control">
                                                    </div>
                                                </div>

                                            </div>
                                            <br>
                                            <div>
                                                <div class="d-md-flex">
                                                    <div class="p-2 bg-secondary text-white">Cung 1 tac GIa</div>

                                                </div>
                                                <div class="pl-3 hop">
                                                    <br>
                                                    <div class="media p-1">
                                                        <div class="left-content">
                                                            <div class="pl-4">
                                                                <img src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg" class="rounded-circle avt2" alt="Cinque Terre"/>
                                                            </div>

                                                            <a href="#" class="text-decoration-none text-info"><p class="text-break text-center font-weight-bold">NGUYEN HUU THANG</p></a> 
                                                        </div>
                                                        <div class="media-body content-Same">
                                                            <div class="post-title">
                                                                <a href="#" class="text-decoration-none title-text"><span class="tx font-weight-bold">Toi da ngu nhu the nao trong hoan canh nay</span></a>
                                                                <a href="#" data-toggle="tooltip" class="text-time text-secondary" title="February 19, 2016!"><small>1 day ago</small></a> 
                                                            </div>
                                                            <div class="post-body">
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>      
                                                            </div>
                                                            <div class="post-footer">
                                                                <div class="tag col1">
                                                                    <a href="#" class="text-decoration-none"><span class="label text-tags">Success</span></a>
                                                                    <a href="#" class="text-decoration-none"><span class="label text-tags">dep trai roi</span></a>
                                                                    <a href="#" class="text-decoration-none"><span class="label text-tags">Success</span></a>
                                                                    <a href="#" class="text-decoration-none"><span class="label text-tags">Success</span></a>
                                                                </div>
                                                                <div class="col2 pl-3">
                                                                    <span>1<i class="far fa-thumbs-up"></i></span></a>
                                                                    <span>1<i class="far fa-comment"></i></span></a>
                                                                    <a href="#" class="text-decoration-none"><span><i class="far fa-flag"></i></span></a>

                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div></c:when>
                                <c:otherwise>
                                   
                                    <div class="col-md-9 col-sm-12">
                                         <br>
                                        <div class="jumbotron">
                                            <h1>CANNOT NOT FOUND</h1>      
                                            <p>THIS POST IS NOT AVALIABLE</p>
                                        </div>
                                            
                                    </div>
                                </c:otherwise>
                            </c:choose>

                            <div class="col-md-3">

                                <br>
                                <div class="card ml-4">
                                    <div class="card-body"><img  class="avt shadow-sm p-2 mb-2 bg-white" src="https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png "></div>
                                    <div class="card-body">
                                        <p><u>Author INFOR</u></p>
                                        <p>    ${p.cusID.cusName}</p>
                                    </div> 
                                    <div class="card-footer">
                                        <span class="border1 border-bottom-0 border-top-0 border-left-0">
                                            <p>LUOT THICH</p>
                                            <p>2</p>
                                        </span>
                                        <span class="border1 border-bottom-0 border-top-0 border-left-0">
                                            <p>SO BAI VIET</p>
                                            <p>3</p>
                                        </span>
                                        <span class="border1 border-0">
                                            <p>ICON</p>
                                            <p>4</p>
                                        </span>
                                    </div>
                                </div>
                                <hr>
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
                                    <div class="p-2 bg-secondary text-white">Cung 1 tac GIa</div>

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

        <c:import url="JSSscript.jsp"></c:import>
        <script>
                $(document).ready(function() {
                    $(".edit-cmt").click(function() {

                        $(".o-hide").toggle();
                    });
                    $('#mySelect2').select2({
                        tags: true
                    });
                });
        </script>
    </body>

</html>
