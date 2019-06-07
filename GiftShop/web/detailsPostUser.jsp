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
                            <br>
                            <div class="top">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="card">
                                            <div class="card-body"><img  class="avt shadow-sm p-2 mb-2 bg-white" src="https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png "></div>
                                            <div class="card-body">${u.userName}</div> 
                                        <div class="card-footer">
                                            <span class="border1 border-bottom-0 border-top-0 border-left-0">
                                                <p>ICON</p>
                                                <p>2</p>
                                            </span>
                                            <span class="border1 border-bottom-0 border-top-0 border-left-0">
                                                <p>ICON</p>
                                                <p>3</p>
                                            </span>
                                            <span class="border1 border-0">
                                                <p>ICON</p>
                                                <p>4</p>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <h3 class="text-secondary font-weight-bold">POSTS</h3>
                                    <div class="shadow p-4 mb-4 bg-white">
                                        <div class="media">
                                            <img src="img_avatar1.png" class="align-self-start mr-3" style="width:60px">
                                            <div class="media-body">
                                                <h4><a data-toggle="modal" href="#" data-target="#myModal">firt lsts</a></h4>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="media">
                                            <img src="img_avatar1.png" class="align-self-start mr-3" style="width:60px">
                                            <div class="media-body">
                                                <h4>SECOND POST</h4>
                                                <p class="text-break">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                            </div>
                                        </div>
                                        <div class="media">
                                            <img src="img_avatar1.png" class="align-self-start mr-3" style="width:60px">
                                            <div class="media-body">
                                                <h4>4 POST</h4>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                            </div>
                                        </div>
                                        <div class="media">
                                            <img src="img_avatar1.png" class="align-self-start mr-3" style="width:60px">
                                            <div class="media-body">
                                                <h4>3 POST</h4>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                            </div>
                                        </div>
                                    </div>
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
