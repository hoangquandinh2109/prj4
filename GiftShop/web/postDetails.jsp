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
                                <div class="col-md-9">
                                    <br>
                                    <div class="shadow p-4 mb-4 bg-white">
                                        <div class="post-title">
                                            <h1 class="font-weight-bold">${p.titlePost}</h1>

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
                                    <div class="content-footer">
                                        <div class="tag col1">
                                            <c:forTokens items="${p.postTag}" delims=";" var="tag">
                                                <a href="#" class="text-decoration-none"><span class="label text-tags">${tag}</span></a>
                                                </c:forTokens>
                                        </div>

                                        <!--LIKE COMMENT ICON HERE-->
                                        <div class="col2 pl-4">
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
                                        <div id="cmtContent" class="collapse">

                                            <hr>
                                            <c:forEach items="${cmt}" var="cmt">
                                                <div class="media">
                                                    <img src="https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">
                                                    <div class="media-body config">
                                                        <h4>${cmt.cusID.cusName}</h4><a href="#" data-toggle="tooltip" class="text-time text-secondary" title="February 19, 2016!"><small>1 day ago</small></a> 
                                                        <div class="p-2">
                                                            <span class="text-dark editCmt pt-2 pl-3 pb-2 pr-3">${cmt.commentContent}</span>
                                                            <br>
                                                            <span class="btn reply text-primary" id='haha${cmt.commentID}' onClick="$('#${cmt.commentID}').toggle();">Reply</span> 
                                                        </div>
                                                        <c:forEach items="${rep}" var="rep">
                                                            <c:if test="${rep.commentID.commentID eq cmt.commentID}">
                                                                <div class="media p-2">
                                                                    <img src="https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png" alt="Jane Doe" class="mr-3 mt-3 rounded-circle" style="width:45px;">
                                                                    <div class="media-body">
                                                                        <h4>${rep.cusID.cusName}</h4><a href="#" data-toggle="tooltip" class="text-time text-secondary myFakeID" title="February 19, 2016!"><small>1 day ago</small></a> 
                                                                        <div class="p-2">
                                                                            <span class="text-dark editCmt pt-2 pl-3 pb-2 pr-3">${rep.replyContent}</span>
                                                                            <br>
                                                                            <span class="btn reply text-primary" id='haha${rep.repID}'  onClick="$('#${cmt.commentID}').toggle();">Reply</span> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                        <input type="text" id="${cmt.commentID}"   name="dizz" class="form-control pull-right"  placeholder="Write a reply..." style="display:none;"/>

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
                            </div>

                            <div class="col-md-3">
                                <div class="card ml-4 sticky-top">
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
                            </div>
                        </div>
                    </div>
                </div>
                <c:import url="templates/footer.jsp"></c:import>
                </div>

            </div>
             <c:import url="templates/postScript.jsp"></c:import>
           
            <c:import url="JSSscript.jsp"></c:import>
   
    </body>

</html>
