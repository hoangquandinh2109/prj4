<%-- 
    Document   : product
    Created on : May 20, 2019, 1:18:28 PM
    Author     : johnn
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="templates/head.jsp"></c:import>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/product.css">
    </head>
    <body ng-app="cangcucot" ng-controller="cart">
       <input type="hidden" value="${sessionScope.sessionid}" id="sessionid">
        <div class="content-n-cart clearfix">
            <div class="content">
                <div class="clickdetrove"></div>
                <c:import url="templates/header.jsp"></c:import>
                <div class="web-body" >
                    <div class="container">
                        <div class="row">
                            <div class="left-column">
                                <div class="categories">
                                    <h4 class="title-bar-categories"><i class="far fa-list"></i>Categories</h4>
                                    <ul>
                                        <li>
                                            <a href="">
                                                <span class="categories-title"><i class="fa fa-gamepad"></i>Game &amp; Software</span>
                                                <span class="categories-desc">Proin gravida nibh vel velit auctor aliquet</span></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span class="categories-title"><i class="far fa-robot"></i>Mobile &amp; Computers</span>
                                                <span class="categories-desc">Aenean sollicitudin, lorem quis bibendum auctor</span></span><i class="fas fa-caret-left"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span class="categories-title"><i class="fa fa-male"></i>Fashion</span>
                                                <span class="categories-desc">Duis sed odio sit amet nibh vulputate</span></span><i class="fas fa-caret-left"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span class="categories-title"><i class="fa fa-book"></i>Books &amp; Audio</span>
                                                <span class="categories-desc">Morbi accumsan ipsum velit. Nam nec tellus</span></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span class="categories-title"><i class="fa fa-trophy"></i>Kids &amp; Toy</span>
                                                <span class="categories-desc">Sed non  mauris vitae erat consequat auctor eu in elit</span></span><i class="fas fa-caret-left"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span class="categories-title"><i class="far fa-tennis-ball"></i>Sports</span>
                                                <span class="categories-desc">Class aptent taciti sociosqu ad litora</span></span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="title-row">PRICE <span>FILTER</span></div>
                                    <div id="refine-by">
                                        <div id="filter-by-price">
                                            <div id="price-filter"></div>
                                            <div id="button-n-number">
                                                <button>FILTER</button>
                                                <div>Price: $<span id="min"></span> - $<span id="max"></span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="title-row">REFINE BY <span>TYPE</span></div>
                                    <div id="filt-type">
                                        <ul>
                                            <li><a href="sdf"><span class="tick"></span>Clock</a> <span class="quantity">3</span></li>
                                            <li><a href=""><span class="tick"></span>PC</a> <span class="quantity">2</span></li>
                                            <li><a href=""><span class="tick"></span>Desktop</a> <span class="quantity">7</span></li>
                                            <li><a href=""><span class="tick"></span>Laptop</a> <span class="quantity">11</span></li>
                                            <li><a href=""><span class="tick"></span>Tablet</a> <span class="quantity">8</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="event">
                                    <a href=""><img class="wow fadeIn" src="https://cdn.shopify.com/s/files/1/2334/1307/files/sidebar_bannertwo_278x189.png?v=1507087021"  alt=""></a>
                                </div>
                                <div class="event">
                                    <a href=""><img class="wow fadeIn" src="https://cdn.shopify.com/s/files/1/2334/1307/files/sidebar_bannerone_278x338.png?v=1507087009" alt=""></a>
                                </div>
                            </div>


                            <div class="right-column">
                                <div class="event">
                                    <a href=""><img class="wow fadeIn" src="https://cdn.shopify.com/s/files/1/2334/1307/files/home_bannertop_8cd761c7-55bc-49a8-8fe5-552c5466d5ee_873x160.png?v=1509421734" alt=""></a>
                                </div>
                                <div class="title-row" id="product-filter-element" data-thistext="${pagename}"></div>
                                <div class="product-block"  ng-controller="proPagination">
                                    <div ng-if="listPro.length == 0" style="padding: 67px 0; text-align: center; opacity: 0.5;">No result</div>
                                    <div class="row" ng-repeat="row in range(1,numrow)">
                                        <div class="product-item wow fadeIn" ng-repeat="item in productRow(row)" >
                                            <div class="image-product">
                                                <a href="${pageContext.request.contextPath}/product/v/{{item.proID}}"><img src="${pageContext.request.contextPath}/productImage/{{item.proImg}}" alt=""></a>
                                            </div>
                                            <div class="product-info">
                                                <a href="${pageContext.request.contextPath}/product/v/{{item.proID}}">{{item.proName}}</a>
                                                <!-- <span class="price">$234.32</span> -->
                                                <span class="old-price">$2349</span> <span class="new-price">{{'$'+item.proPrice}}</span>
                                            </div>
                                            <div class="review-n-button-tu">
                                                <div class="review-tu clearfix">
                                                    <div class="star-review">
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <div class="star-reviewed" ng-style="star(item.starAVG)">
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                        </div>
                                                    </div>
                                                    <span ng-class="classnumRev(item.numReview)" class="quantity-review">{{numRV(item.numReview)}}</span>
                                                </div>
                                                <div class="button-tu clearfix">
                                                    <div ng-click="addThisToCart(item.proID)" class="btn-addtocart clearfix">
                                                        <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                        <span class="tool-title">Add to cart</span>
                                                    </div>
                                                    <div ng-class="addedClass(item.onWishlist)" class="btn-love" ng-click="item.onWishlist = btnWishlist(item.proID,item.onWishlist)"><span ><i class="fa fa-heart"></i></span></div>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                    <div class="row text-center" ng-if="numpage > 1">
                                        <div id="pagination" class="clearfix">
                                            <ul class="pagination">
                                                <li ng-if='!disableleft()'>
                                                    <a ng-click="switchpage(currPage-1)" title="« Previous">
                                                        <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li ng-repeat="n in range(1,numpage)" ng-class="active(n)">
                                                    <a ng-click="switchpage(n)" ng-if="active(n) != 'active'" href="">{{n}}</a>
                                                    <span ng-if="active(n) == 'active'" >{{n}}</span>
                                                </li>
                                                <li ng-if='!disableright()'>
                                                    <a ng-click="switchpage(currPage+1)" title="« Previous">
                                                        <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="event">
                                    <a href=""><img class="wow fadeIn" src="https://cdn.shopify.com/s/files/1/2334/1307/files/home_bannercenter_873x160.png?v=1507088526" alt=""></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:import url="templates/footer.jsp"></c:import>
                <span class="hide" id="collVal">${collVal}</span>
                <span class="hide" id="nameColl">${nameColl}</span>
            </div>
            <c:import url="templates/cart-modal.jsp"></c:import>
        </div>
        <span id="maxPrice" class="hide">${maxPrice}</span>
        <c:import url="templates/script.jsp"></c:import>
              <script src="${pageContext.request.contextPath}/assets/library/jquery/js/jquery-ui.js"></script>
    </body>

</html>
