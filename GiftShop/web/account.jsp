<%-- 
    Document   : account
    Created on : Jun 3, 2019, 7:46:28 AM
    Author     : johnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>&#35;${pagename} - ${username}</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/library/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/account.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/fav.png">
    </head>

    <body class="square content" onload="hidedangcap();">
        <div class="clickdetrove"></div>
        <div id="dangcap">
            <div class="lds-ring">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
        <input type="hidden" id="tabname" value="${tabname}">
        <input type="hidden" id="pagename" value="${pagename}">
        <input type="hidden" id="usernamess" value="${username}">
        <div class="ui clearfix">
            <div id="switcher">
                <div id="dashboard" class="active"><i class="fas fa-tachometer-alt-fastest"></i></div>
                <div id="account"><i class="fas fa-user"></i></div>
                <div id="wishlist"><i class="fas fa-heart-square"></i></div>
                <div id="orders"><i class="fal fa-clipboard-list"></i></div>
            </div>
            <div class="left-part">















                <!--////////////////////////////////////////////////////////////////////// dashboard block -->
                <div  style="display: none;" id="showdashboard" class="everyblock">
                    <div class="block-product" id="bindTopPurchaseDashboard">
                        <h2>Recently purchased <a id="atago" href>See more</a></h2>
                    </div>
                    <div class="block-product" id="bindTopWishlistDashboard" >
                        <h2 >You haven't bought these <a id="atagw" href>See more</a> </h2>
                    </div>
                </div>







                <!--////////////////////////////////////////////////////////////////////// account block -->


                <div style="display: none;" id="showaccount" class="everyblock form-account">
                    <h2>Update Information</h2>
                    <form>
                        <div class="label-account">Name</div>
                        <input id="name-need-fc" type="text">
                        <div class="label-account">Email</div>
                        <input id="email-need-fc" type="text">
                        <div class="label-account">Address</div>
                        <input id="address-need-fc" type="text">
                        <div class="label-account">Phone</div>
                        <input id="phone-need-fc" type="text">
                        <button class="btn">Update</button>
                    </form>
                    <h2>Change Password</h2>
                    <form>
                        <div class="label-account">Old password</div>
                        <input id="oldpass" type="password">
                        <div class="label-account">New password</div>
                        <input id="newpass" type="password">
                        <div class="label-account">Re-enter new password</div>
                        <input id="renewpass" type="password">
                        <button style="margin-bottom: 20px" class="btn">Change</button>
                    </form>

                </div>









                <!--////////////////////////////////////////////////////////////////////// wishlist block -->

                <div  style="display: none" id="showwishlist" class="table-account everyblock">
                    <h2>Your Wishlist</h2>
                    <div class="list-product" id="bindproductwl">
                    </div>
                </div>









                    <!--////////////////////////////////////////////////////////////////////// order block -->

                    <div style="display: none" id="showorders" class="everyblock">
                        <!--////////////////////////////////////////////////////////////////////// order list -->
                        <div id="orderslist">
                            <div  class="table-account">
                                <h2>Your Order</h2>
                                <table id="table-orders">
                                    <tr>
                                        <td>Order ID</td>
                                        <td>Date</td>
                                        <td>Items</td>
                                        <td>Total Price</td>
                                        <td>Status</td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>                    
                            <div class="block-product" id="bindTopPurchaseOrders">
                                <h2>Last purchased</h2>
                            </div>
                        </div>


                        <!--////////////////////////////////////////////////////////////////////// order detail -->
                        <div style="display: none;" id="order-detail">
                            <h2 class="h2f">Order <span id="bindcode"></span><span><a onclick="window.print();" href="" id="btnprint" class="fr fz13 dib button-remove">Print</a></span></h2>
                            <div class="mt70 ml100">
                                <div class="r mr60i">
                                    <div class="c-05">
                                        <div class="od-box hb">
                                            <h3>Shipping Information</h3>
                                            <span>Receiver: <strong id="bindreceiver"></strong> </span>
                                            <span id="bindaddress"></span>
                                            <span id="bindphone"></span>
                                            <span id="binddate"></span>
                                            <span id="bindnote"></span>
                                        </div>
                                    </div>
                                    <div class="c-05">
                                        <div class="od-box hb">
                                            <h3>Payment Method</h3>
                                            <span>By: <strong id="bindpayment"></strong> </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="bindproductodd" class="block-product">
                                <h2 class="mr60i">Products <span class="dib fr fz13">Total:<span id="bindtotal" class="pl20 color-pink"></span></span></h2>
                                
                            </div>
                        </div>
                    </div>













                </div>
                <div class="right-part">
                    <a id="backtoshop" href="${pageContext.request.contextPath}" >Back to Shopping <i class="fal fa-long-arrow-right"></i></a>
                    <div id="myaccount">
                        <div class="avatar">
                            <c:if test="${avatar == null}">
                            <img src="https://2sao.vietnamnetjsc.vn/images/2018/09/01/11/13/shark-Hung-02.jpg" alt="">
                            </c:if>
                            <c:if test="${avatar != null}">
                            <img src="${pageContext.request.contextPath}/avatar/${avatar}" alt="">
                            </c:if>
                            <a id="uploadclick" href=""><i class="fal fa-camera"></i>Upload an avatar</a>
                        </div>
                        <div class="profile">
                            <p class="profile-name"><span id="myname" >${myname}</span> <a id="pen-edit" href=""><i class="fal fa-pencil"></i></a></p>
                            <div class="profile-info">
                                <span><i class="far fa-map-marker-alt"></i> <span id="myaddress" >${myaddress}</span></span>
                                <span><i class="fal fa-phone"></i> <span id="myphone" >${myphone}</span></span>
                                <span><i class="fal fa-envelope"></i> <span id="myemail" >${myemail}</span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fadeInDownMsg filecontainer">
                <form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/account" >
                    <input class="form-control" id="fileElem" style="display:none" onchange="handleFiles(this.files)" type="file" name="file" accept=".png,.jpg,.bmp,.jpeg" >
                    <input type="hidden" name="action" value="upavatar">
                    <h5>Are you sure to upload this picture to avatar?</h5>
                    <div id="fileList"></div>
                    <button class="btn-yes" type="submit">Yes</button>
                    <button id="cancelfile" type="button" class="btn-no">Cancel</button>
                </form>
            </div>
            <script src="${pageContext.request.contextPath}/assets/library/jquery/js/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/library/wowjs/wow.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/account.js"></script>
        </body>

    </html>