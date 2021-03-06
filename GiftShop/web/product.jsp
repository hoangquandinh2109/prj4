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
    <body class="square" onload="hidedangcap();" ng-app="cangcucot" ng-controller="cart">
        <input type="hidden" value="${sessionScope.sessionid}" id="sessionid">
        <div class="content-n-cart clearfix">
            <div class="content">
                <div class="clickdetrove"></div>
                <c:import url="templates/header.jsp"></c:import>
                    <div class="web-body" >
                        <div class="container" ng-controller="proPagination">
                            <div class="row"  ng-controller="wishlist">
                                <div class="left-column">
                                    <div class="categories">
                                        <h4 class="title-bar-categories"><i class="far fa-list"></i>CATEGORIES</h4>
                                        <ul>
                                            <c:forEach items="${listCat}" var="lC">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/product/category/${lC[0]}">
                                                    <span class="categories-title"><i class=" ${lC[3]}"></i>${lC[1]}</span>
                                                    <span class="categories-desc">${lC[2]}</span>
                                                </a>
                                            </li>
                                            </c:forEach>
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
                                    <c:if test="${nameColl == 'category'}">
                                    <div>
                                        <div class="title-row">REFINE BY <span>TYPE</span></div>
                                        <div id="filt-type">
                                            <ul>
                                                <li ng-repeat="lT in listType" ><a ng-click="check(lT, $event)" href=""><span class="tick"></span>{{lT}}</a> <span class="quantity"></span></li>
                                            </ul>
                                        </div>
                                    </div>
                                    </c:if>
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
                                <div class="product-block"  >
                                    <div ng-if="listPro.length == 0" style="padding: 67px 0; text-align: center; opacity: 0.5;">No result</div>
                                    <div class="row" style="overflow: hidden;" ng-repeat="row in range(1, numrow)">
                                        <div class="product-item wow fadeInUp" ng-repeat="item in productRow(row)" >
                                            <div class="image-product">
                                                <a href="${pageContext.request.contextPath}/product/v/{{item.proID}}"><img src="${pageContext.request.contextPath}/productImage/{{item.proImg}}" alt=""></a>
                                            </div>
                                            <div class="product-info">
                                                <a href="${pageContext.request.contextPath}/product/v/{{item.proID}}">{{item.proName}}</a>
                                                 <span ng-if="item.newprice == 0.0" class="price">{{'$'+item.proPrice}}</span> 
                                                 <span ng-if="item.newprice > 0" class="old-price">{{'$'+item.proPrice}}</span> <span ng-if="item.newprice > 0" class="new-price">{{'$'+item.newprice}}</span>
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
                                                    <div ng-class="addedClass(item.onWishlist)" class="btn-love" ng-click="item.onWishlist = btnWishlist(item.proID, item.onWishlist)"><span ><i class="fa fa-heart"></i></span></div>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                    <div class="row text-center" ng-if="numpage > 1">
                                        <div id="pagination" class="clearfix">
                                            <ul class="pagination">
                                                <li ng-if='!disableleft()'>
                                                    <a ng-click="switchpage(currPage - 1)" title="">
                                                        <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li ng-repeat="n in range(1, numpage)" ng-class="active(n)">
                                                    <a ng-click="switchpage(n)" ng-if="active(n) != 'active'" href="">{{n}}</a>
                                                    <span ng-if="active(n) == 'active'" >{{n}}</span>
                                                </li>
                                                <li ng-if='!disableright()'>
                                                    <a ng-click="switchpage(currPage + 1)" title="">
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
