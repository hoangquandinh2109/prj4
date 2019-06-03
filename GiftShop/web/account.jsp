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
    <title>${pagename} - ${username}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/library/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/account.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/fav.png">
</head>

<body>
    <input type="hidden" id="tabname" value="${tabname}">
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
                <div class="block-product">
                    <h2>Products purchased</h2>
                    <div class="r list-product">
                        <div class="c-05 ">
                            <div class="product-item">
                                <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-6_160x140.png"
                                    alt="">
                                <a href="" class="pname">Samsung A8</a>
                                <span class="pdate">Order date: <span>27-09-2019</span></span>
                            </div>
                        </div>
                        <div class="c-05 ">
                            <div class="product-item">
                                <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-25_160x140.png"
                                    alt="">
                                <a href="" class="pname">Samsung Galaxy S7</a>
                                <span class="pdate">Order date: <span>27-09-2019</span></span>
                            </div>
                        </div>
                    </div>
                    <div class="r list-product">
                        <div class="c-05 ">
                            <div class="product-item">
                                <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-13_979e1434-012b-483d-b3b4-29841771141b_160x140.png"
                                    alt="">
                                <a href="" class="pname">Samsung A8</a>
                                <span class="pdate">Order date: <span>27-09-2019</span></span>
                            </div>
                        </div>
                        <div class="c-05 ">
                            <div class="product-item">
                                <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-25_160x140.png"
                                    alt="">
                                <a href="" class="pname">Samsung Galaxy S7</a>
                                <span class="pdate">Order date: <span>27-09-2019</span></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="block-product">
                    <h2>Your wishlist</h2>
                    <div class="r list-product">
                        <div class="c-05 ">
                            <div class="product-item">
                                <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-12_5676fcc2-14d3-4280-b5dd-9396d2e2b5c1_160x140.png"
                                    alt="">
                                <a href="" class="pname">Samsung A8</a>
                                <button class="pbutton-wishlist button-remove">Remove from wishlist</button>
                            </div>
                        </div>
                        <div class="c-05 ">
                            <div class="product-item">
                                <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-25_160x140.png"
                                    alt="">
                                <a href="" class="pname">Samsung Galaxy S7</a>
                                <button class="pbutton-wishlist button-remove">Remove from wishlist</button>
                            </div>
                        </div>
                    </div>
                    <div class="r list-product">
                        <div class="c-05 ">
                            <div class="product-item">
                                <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-25_160x140.png"
                                    alt="">
                                <a href="" class="pname">Samsung A8</a>
                                <button class="pbutton-wishlist button-remove">Remove from wishlist</button>
                            </div>
                        </div>
                        <div class="c-05 ">
                            <div class="product-item">
                                <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-25_160x140.png"
                                    alt="">
                                <a href="" class="pname">Samsung Galaxy S7</a>
                                <button class="pbutton-wishlist button-remove">Remove from wishlist</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>







<!--////////////////////////////////////////////////////////////////////// account block -->


            <div style="display: none;" id="showaccount" class="everyblock form-account">
                <h2>Update Information</h2>
                <form>
                    <div class="label-account">Address</div>
                    <input id="address-need-fc" type="text">
                    <div class="label-account">Phone</div>
                    <input type="text">
                    <button class="btn">Update</button>
                </form>
                <h2>Change Password</h2>
                <form>
                <div class="label-account">Old password</div>
                <input type="password">
                <div class="label-account">New password</div>
                <input type="password">
                <div class="label-account">Re-enter new password</div>
                <input type="password">
                <button class="btn">Change</button>
                </form>

            </div>









<!--////////////////////////////////////////////////////////////////////// wishlist block -->

            <div  style="display: none" id="showwishlist" class="table-account everyblock">
                <h2>Your Wishlist</h2>
                <div class="list-product">
                    <c:set var="i" value="0" />
                    
                    <c:forEach items="${myWishlist}" var="lw">
                        
                    <c:if test="${i == 0}">
                    <div class="r"><!--row item-->  
                    </c:if>
                    
                    
                        <!------------------------------item--------------------------------------->
                        <div class="c-05">
                            <div class="product-item">
                                <a href="${pageContext.request.contextPath}/product/v/${lw.proID.proID}"><img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-4_f4c92dfe-1709-4406-bec4-21c707ea1b38_160x140.png"
                                    alt=""></a>
                                <a href="${pageContext.request.contextPath}/product/v/${lw.proID.proID}" class="pname">${lw.proID.proName}</a>
                                <div class="wishlist-price">&#36;${lw.proID.proPrice}</div>
                                <button class="button-remove pbutton-wishlist">Remove</button>
                            </div>
                        </div>
                        <c:set var="i" value="${i+1}" />
                        <!-----------------------/item----------------------------------------->
                        
                        
                        
                    <c:if test="${i == 2}">
                    </div><!--/row item-->  
                    <c:set var="i" value="0" />
                    </c:if>
                    
                    </c:forEach>
                </div>
            </div>









<!--////////////////////////////////////////////////////////////////////// order block -->

            <div style="display: none" id="showorders" class="everyblock">
                <!--////////////////////////////////////////////////////////////////////// order list -->
                <div id="orderslist">
                    <div  class="table-account">
                        <h2>Your Order</h2>
                        <table>
                            <tr>
                                <td>Order ID</td>
                                <td>Date</td>
                                <td>Items</td>
                                <td>Total Price</td>
                                <td>Status</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>20190525029</td>
                                <td>25/05/2019</td>
                                <td>2</td>
                                <td>$230</td>
                                <td>Processing</td>
                                <td><a href="" class="button-remove">View</a></td>
                            </tr>
                            <tr>
                                <td>20190324036</td>
                                <td>24/03/2019</td>
                                <td>1</td>
                                <td>$234</td>
                                <td>Complete</td>
                                <td><a href="" class="button-remove">View</a></td>
                            </tr>
                            <tr>
                                <td>2018091243</td>
                                <td>12/09/2018</td>
                                <td>1</td>
                                <td>$143</td>
                                <td>Processing</td>
                                <td><a href="" class="button-remove">View</a></td>
                            </tr>
                        </table>
                    </div>                    
                    <div class="block-product">
                        <h2>Last purchased</h2>
                        <div class="r list-product">
                            <div class="c-05 ">
                                <div class="product-item">
                                    <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-6_160x140.png"
                                        alt="">
                                    <a href="" class="pname">Samsung A8</a>
                                    <span class="pdate">Order date: <span>27-09-2019</span></span>
                                </div>
                            </div>
                            <div class="c-05 ">
                                <div class="product-item">
                                    <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-18_160x140.png"
                                        alt="">
                                    <a href="" class="pname">Samsung A8</a>
                                    <span class="pdate">Order date: <span>27-09-2019</span></span>
                                </div>
                            </div>
                        </div>
                        <div class="r list-product">
                            <div class="c-05 ">
                                <div class="product-item">
                                    <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-10_aed5aef2-1985-474e-9f24-a7deb10b70ab_160x140.png"
                                        alt="">
                                    <a href="" class="pname">Samsung A8</a>
                                    <span class="pdate">Order date: <span>27-09-2019</span></span>
                                </div>
                            </div>
                            <div class="c-05 ">
                                <div class="product-item">
                                    <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-21_160x140.png"
                                        alt="">
                                    <a href="" class="pname">Samsung A8</a>
                                    <span class="pdate">Order date: <span>27-09-2019</span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!--////////////////////////////////////////////////////////////////////// order detail -->
                <div style="display: none;" id="order-detail">
                    <h2 class="h2f">Order #20182603472<span><a href="" class="fr fz13 dib button-remove">Print</a></span></h2>
                    <div class="mt70 ml100">
                        <div class="r mr60i">
                            <div class="c-05">
                                <div class="od-box hb">
                                    <h3>Shipping Information</h3>
                                    <span>Receiver: <strong>Johnny</strong> </span>
                                    <span>Address: 123 Cach Mang Thang 8, p10, q4, Tp.HCM</span>
                                    <span>Phone: 0978382929</span>
                                    <span>Date: 28/03/2019</span>
                                    <span>Notes: </span>
                                </div>
                            </div>
                            <div class="c-05">
                                <div class="od-box hb">
                                    <h3>Payment Method</h3>
                                    <span>By: <strong>Paypal</strong> </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="block-product">
                        <h2 class="mr60i">Products <span class="dib fr fz13">Total:<span class="pl20 color-pink">$932</span></span></h2>
                        <div class="r list-product">
                            <div class="c-05 ">
                                <div class="product-item">
                                    <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-6_160x140.png"
                                        alt="">
                                    <a href="" class="pname">Samsung A8</a>
                                    <span class="price-io">$233</span>
                                </div>
                            </div>
                            <div class="c-05 ">
                                <div class="product-item">
                                    <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-18_160x140.png"
                                        alt="">
                                    <a href="" class="pname">Samsung A8</a>
                                    <span class="price-io">$233</span>
                                </div>
                            </div>
                        </div>
                        <div class="r list-product">
                            <div class="c-05 ">
                                <div class="product-item">
                                    <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-10_aed5aef2-1985-474e-9f24-a7deb10b70ab_160x140.png"
                                        alt="">
                                    <a href="" class="pname">Samsung A8</a>
                                    <span class="price-io">$233</span>
                                </div>
                            </div>
                            <div class="c-05 ">
                                <div class="product-item">
                                    <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-21_160x140.png"
                                        alt="">
                                    <a href="" class="pname">Samsung A8</a>
                                    <span class="price-io">$233</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>













        </div>
        <div class="right-part">
            <div id="myaccount">
                <div class="avatar">
                    <img src="https://2sao.vietnamnetjsc.vn/images/2018/09/01/11/13/shark-Hung-02.jpg" alt="">
                    <a href=""><i class="fal fa-camera"></i>Upload an avatar</a>
                </div>
                <div class="profile">
                    <p class="profile-name">${myname} <a id="pen-edit" href=""><i class="fal fa-pencil"></i></a></p>
                    <div class="profile-info">
                        <span><i class="far fa-map-marker-alt"></i> ${myaddress}</span>
                        <span><i class="fal fa-phone"></i> ${myphone}</span>
                        <span><i class="fal fa-envelope"></i> ${myemail}</span>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/assets/library/jquery/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>

</html>