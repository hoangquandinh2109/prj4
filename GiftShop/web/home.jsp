<%-- 
    Document   : home
    Created on : Apr 13, 2019, 10:52:19 AM
    Author     : johnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="templates/head.jsp"></c:import>
        </head>
        <body class="square" onload="hidedangcap();" ng-app="cangcucot"  ng-controller="cart">
            <input type="hidden" value="${sessionScope.sessionid}" id="sessionid">
            <div class="content-n-cart clearfix">
                <div class="content">
                    <div class="clickdetrove"></div>
                <c:import url="templates/header.jsp"></c:import>
                    <div class="web-body">
                        <div class="container">
                            <div class="row" ng-controller="wishlist">
                                <div class="left-column">
                                    <div class="categories">
                                        <h4 class="title-bar-categories"><i class="far fa-list"></i>For</h4>
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
                                        <div class="title-row">Types <span></span></div>
                                        <div id="list-types">
                                            <ul>
                                                <c:forEach items="${listType}" var="lT">
                                                <li><a href="${pageContext.request.contextPath}/product/type/${lT[0]}"><span class="tick"></span>${lT[1]}</a> <span class="quantity">${lT[2]}</span></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="event">
                                        <a href=""><img class="wow fadeIn" src="https://cdn.shopify.com/s/files/1/2334/1307/files/sidebar_bannertwo_278x189.png?v=1507087021"  alt=""></a>
                                    </div>
                                    <div class="event">
                                        <a href=""><img class="wow fadeIn" src="https://cdn.shopify.com/s/files/1/2334/1307/files/sidebar_bannerone_278x338.png?v=1507087009" alt=""></a>
                                    </div>
                                    <div class="block-title-n-slide-left">
                                        <div class="title-row" style="background-color: #db1952">News <span>Product</span></div>
                                        <div class="owl-carousel left-vertical-product-slide">
                                        <c:set var="i" value="0" />
                                        <c:set var="j" value="0" />
                                        <c:forEach items="${listn}" var="listnew">
                                            <c:if test="${i == 0}">
                                                <div>
                                                </c:if>
                                                <div class="product-item wow fadeIn">
                                                    <div class="image-product">
                                                        <a href="${pageContext.request.contextPath}/product/v/${listnew[0]}"><img src="${pageContext.request.contextPath}/productImage/${listnew[3]}" alt=""></a>
                                                    </div>
                                                    <div class="product-info">
                                                        <a href="${pageContext.request.contextPath}/product/v/${listnew[0]}">${listnew[1]}</a>
                                                        <c:if test="${listnew[6] == '$0.0'}">
                                                            <span class="price">${listnew[2]}</span> 
                                                        </c:if>
                                                        <c:if test="${listnew[6] != '$0.0'}">
                                                            <span class="old-price">${listnew[2]}</span> <span class="new-price">${listnew[6]}</span>
                                                        </c:if>
                                                    </div>
                                                    <div class="review-n-button-tu">
                                                        <div class="review-tu clearfix">
                                                            <div class="star-review">
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                                <div  style="width: ${(listnew[4] / 5)*100}%" class="star-reviewed">
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </div>
                                                            </div>
                                                            <c:if test="${listnew[4] == '0.0'}">
                                                            <span class="quantity-review">No review</span>
                                                            </c:if>        
                                                            <c:if test="${listnew[4] > '0.0'}">
                                                            <span class="numrv quantity-review">(${listnew[5]})</span>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:set var="i" value="${i+1}" />
                                                <c:set var="j" value="${j+1}" />
                                                <c:if test="${i == 2 || j == listn.size()}">
                                                </div>
                                                <c:set var="i" value="0" /> 
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>


                            </div>


                            <div class="right-column">
                                <div class="slide-banner-tu">
                                    <div class="owl-carousel">
                                        <div class="slide-banner-tu-item">
                                            <div class="image-slide-banner-tu"><img src="https://cdn.shopify.com/s/files/1/2334/1307/files/slideshow_image_1_89c664fb-9af7-4a2a-ad6d-7dd12524551d_1600x.jpg" alt=""></div>
                                            <div class="title-slide-banner-tu"></div>
                                        </div>
                                        <div class="slide-banner-tu-item">
                                            <div class="image-slide-banner-tu"><img src="https://cdn.shopify.com/s/files/1/2334/1307/files/slideshow_image_3_58f48138-fe7b-4263-ac5e-3577589da0b7_1600x.jpg" alt=""></div>
                                            <div class="title-slide-banner-tu"></div>
                                        </div>
                                        <div class="slide-banner-tu-item">
                                            <div class="image-slide-banner-tu"><img src="https://cdn.shopify.com/s/files/1/2334/1307/files/slideshow_image_2_1_1600x.jpg" alt=""></div>
                                            <div class="title-slide-banner-tu"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="event">
                                    <a href=""><img class="wow fadeIn" src="https://cdn.shopify.com/s/files/1/2334/1307/files/home_bannertop_8cd761c7-55bc-49a8-8fe5-552c5466d5ee_873x160.png?v=1509421734" alt=""></a>
                                </div>
                                <div id="featureproduct-title" class="title-row">Features <span>Product</span></div>
                                <div class="product-block" ng-controller="homepagination">
                                    <div class="row" ng-repeat="r in range(1,3)"  style="overflow: hidden;">
                                        <div ng-repeat="p in productRow(r)" class="product-item wow fadeInUp">
                                            <span class="box-ft-label"></span>
                                            <span class="ft-label">{{p.feature}}</span>
                                            <div class="image-product">
                                                <a href="{{p.url}}"><img src="{{p.img}}" alt=""></a>
                                            </div>
                                            <div class="product-info">
                                                <a href="{{p.url}}">{{p.name}}</a>
                                                 <span ng-if="p.newprice == 0.0" class="price">{{'$'+p.oldprice}}</span> 
                                                 <span ng-if="p.newprice > 0" class="old-price">{{'$'+p.oldprice}}</span> <span ng-if="p.newprice > 0" class="new-price">{{'$'+p.newprice}}</span>
                                            </div>
                                            <div class="review-n-button-tu">
                                                <div class="review-tu clearfix">
                                                    <div class="star-review">
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <div class="star-reviewed" ng-style="star(p.starAVG)">
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                        </div>
                                                    </div>
                                                    <span ng-class="classnumRev(p.numReview)" class="quantity-review">{{numRV(p.numReview)}}</span>
                                                </div>
                                                <div class="button-tu clearfix">
                                                    <div ng-click="addThisToCart(p.id)" class="btn-addtocart clearfix">
                                                        <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                        <span class="tool-title">Add to cart</span>
                                                    </div>
                                                    <div ng-class="addedClass(p.onW)" class="btn-love" ng-click="p.onW = btnWishlist(p.id, p.onW)"><span ><i class="fa fa-heart"></i></span></div>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                    <div ng-if="numpage>1" class="row text-center">
                                        <div id="pagination" class="clearfix">
                                            <ul class="pagination">
                                                <li ng-if="currpage > 1">
                                                    <a ng-click="switchpage(currpage-1)" title="« Previous">
                                                        <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li ng-repeat="n in range(1, numpage)" ng-class="active(n)">
                                                    <a ng-click="switchpage(n)" ng-if="active(n) != 'active'" href="">{{n}}</a>
                                                    <span ng-if="active(n) == 'active'">{{n}}</span>
                                                </li>
                                                <li ng-if="currpage < numpage">
                                                    <a ng-click="switchpage(currpage+1)" title="« Previous">
                                                        <i  class="fa fa-chevron-right" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="event">
                                    <a href=""><img class="wow fadeIn" src="https://cdn.shopify.com/s/files/1/2334/1307/files/home_bannercenter_873x160.png?v=1507088526" alt=""></a>
                                </div>
                                <div class="block-title-n-slide">
                                    <div class="title-row">FOR <span>HER</span></div>
                                    <div class="owl-carousel product-slide nothing" >
                                        <c:forEach items="${list}" var="ssd">
                                            <div class="product-item wow fadeIn">
                                                <div class="image-product">
                                                    <a href=""><img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-4_f4c92dfe-1709-4406-bec4-21c707ea1b38_160x140.png" alt=""></a>
                                                </div>
                                                <div class="product-info">
                                                    <a href="">${ssd}</a>
                                                    <!-- <span class="price">$234.32</span> -->
                                                    <span class="old-price">$2349</span> <span class="new-price">$2349</span>
                                                </div>
                                                <div class="review-n-button-tu">
                                                    <div class="review-tu clearfix">
                                                        <div class="star-review">
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>
                                                            <div class="star-reviewed">
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                            </div>
                                                        </div>
                                                        <span class="quantity-review">No reviews</span>
                                                    </div>
                                                    <div class="button-tu clearfix">
                                                        <div class="btn-addtocart addtocart clearfix">
                                                            <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                            <span class="tool-title">Add to Cart</span>
                                                        </div>
                                                        <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="block-title-n-slide">
                                    <div class="title-row">FOR <span>HIM</span></div>
                                    <div class="owl-carousel product-slide nothing" >
                                        <c:forEach items="${list}" var="ssd">
                                            <div class="product-item wow fadeIn">
                                                <div class="image-product">
                                                    <a href=""><img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-4_f4c92dfe-1709-4406-bec4-21c707ea1b38_160x140.png" alt=""></a>
                                                </div>
                                                <div class="product-info">
                                                    <a href="">${ssd}</a>
                                                    <!-- <span class="price">$234.32</span> -->
                                                    <span class="old-price">$2349</span> <span class="new-price">$2349</span>
                                                </div>
                                                <div class="review-n-button-tu">
                                                    <div class="review-tu clearfix">
                                                        <div class="star-review">
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>
                                                            <div class="star-reviewed">
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                            </div>
                                                        </div>
                                                        <span class="quantity-review">No reviews</span>
                                                    </div>
                                                    <div class="button-tu clearfix">
                                                        <div class="btn-addtocart addtocart clearfix">
                                                            <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                            <span class="tool-title">Add to Cart</span>
                                                        </div>
                                                        <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="block-title-n-slide">
                                    <div class="title-row">FOR <span>KIDS</span></div>
                                    <div class="owl-carousel product-slide nothing" >
                                        <c:forEach items="${list}" var="ssd">
                                            <div class="product-item wow fadeIn">
                                                <div class="image-product">
                                                    <a href=""><img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-4_f4c92dfe-1709-4406-bec4-21c707ea1b38_160x140.png" alt=""></a>
                                                </div>
                                                <div class="product-info">
                                                    <a href="">${ssd}</a>
                                                    <!-- <span class="price">$234.32</span> -->
                                                    <span class="old-price">$2349</span> <span class="new-price">$2349</span>
                                                </div>
                                                <div class="review-n-button-tu">
                                                    <div class="review-tu clearfix">
                                                        <div class="star-review">
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>
                                                            <div class="star-reviewed">
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                            </div>
                                                        </div>
                                                        <span class="quantity-review">No reviews</span>
                                                    </div>
                                                    <div class="button-tu clearfix">
                                                        <div class="btn-addtocart addtocart clearfix">
                                                            <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                            <span class="tool-title">Add to Cart</span>
                                                        </div>
                                                        <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:import url="templates/footer.jsp"></c:import>
                </div>
            <c:import url="templates/cart-modal.jsp"></c:import>
            </div>
        <c:import url="templates/script.jsp"></c:import>
    </body>

</html>
