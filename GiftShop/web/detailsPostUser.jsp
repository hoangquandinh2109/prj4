<%-- 
    Document   : detailsUserPost
    Created on : Jun 3, 2019, 2:30:27 PM
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
                          
                        <div class="top">
                            <div class="row">

                                <div class="col-md-3">
                                    <h3 class="text-secondary font-weight-bold">Details User's Post</h3>
                                    <div class="card">
                                    <div class="card-body"><img  class="avt shadow-sm p-2 mb-2 bg-white" src="https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png "></div>
                                    <div class="card-body"><p class="font-weight-bold">${c.cusName}</p></div> 
                                <div class="card-footer">
                                    <span class="border1 border-bottom-0 border-top-0 border-left-0">
                                       <span id="getTTLikeRT">${totalLike}</span> <i style="color:blue" class="far fa-thumbs-up"></i>

                                    </span>
                                    <span class="border1 border-bottom-0 border-top-0 border-left-0">
                                       <span>${totalComment} </span><i class="far fa-comment"></i>

                                    </span>

                                </div>
                            </div>
                                </div>
                                <div class="col-md-9">
                                 <c:forEach varStatus="loop" items="${p}" var="p">
                                        '<div class="shadow-sm p-4 mb-4 bg-white postList"> <div class="media p-1">
                                                <div class="left-content">
                                                    <div class="p-4 ml-3">
                                                        <img src="https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png" class="rounded-circle avt2" alt="Cinque Terre"/>
                                                    </div>
                                                    <a href="#" class="text-decoration-none text-info"><p class="pr-4 text-break text-center font-weight-bold">${p.cusID.cusName}</p></a>
                                                </div>
                                                <div class="media-body content-Same">
                                                    <div class="post-title">
                                                        <a href="postDetailsServlet?pid=' + result.POST[index].postID + '" class="text-decoration-none title-text"><h3  style="margin:0px;padding:0px" class="tx font-weight-bold"> ${p.titlePost}</h3></a>
                                                        <a href="#" data-toggle="tooltip" class="text-time text-secondary" id=""><small>${p.dateRealease}</small></a> 
                                                    </div>
                                                    <div class="post-body"> <p>
                                                            ${post.infontContent}
                                                        </p> </div>
                                                        <br>
                                                    <div class="post-footer">
                                                        <div class="tag col1" id="tag">
                                                          <c:forTokens items="${p.postTag}" delims=";" var="tag">
                                                        <a href="searchForwardPage?data=${tag}" class="text-decoration-none"><span class="label text-tags">${tag}</span></a>
                                                        </c:forTokens>
                                                        </div>
                                                        
                                                        </div> </div>  </div></div>
                                                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <br>
                        <hr>
                        <div class="bottom">

                        </div>
                        <!-- The Modal -->
                        <!-- Modal -->
                        <div id="myModal" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Modal Header</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>Some text in the modal.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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



    </body>
</html>
