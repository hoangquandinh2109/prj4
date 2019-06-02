<%-- 
    Document   : proDetails
    Created on : Apr 23, 2019, 9:49:26 AM
    Author     : bemap
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
    <input type="hidden" value="${thisP.proID}" id="proID">
    <div class="content-n-cart clearfix">
        <div class="content">
            <div class="clickdetrove"></div>
            <c:import url="templates/header.jsp"></c:import>
            <div class="web-body">
                <div id="fb-root"></div>
                <script async defer crossorigin="anonymous" src="https://connect.facebook.net/fr_FR/sdk.js#xfbml=1&version=v3.3"></script>
                <div class="container">
                    <div class="row details">
                        <div class="col-md-5">
                            <div class="img">
                                <img src="/project4/productImage/${thisImg}"
                                    alt="">
                                <div class="small-img">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-7 pro-details">
                            <div class="details-block">
                                <h1>${thisP.proName}</h1>
                                <div class="review-tu clearfix">
                                    <div class="star-review">
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <div style="width: ${(thisP.starAVG / 5)*100}%" class="star-reviewed">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                    </div>
                                    <c:if test="${thisP.starAVG == 0 || thisP.starAVG == null}">
                                    <span class="quantity-review">No review</span>
                                    </c:if>        
                                    <c:if test="${thisP.starAVG != 0.0 && thisP.starAVG != null}">
                                    <span class="numrv quantity-review">(${thisP.reviewCollection.size()})</span>
                                    </c:if>        
                                </div>
                                <p>Vendor:Women's shirts</p>
                                <p>THIS IS YOUR FIRST TIME</p>
                                <hr>
                                <p class="availability">AVAILABLE</p>
                                <p><span class="price">${thisP.proPrice}.00</span> <span
                                        class="old-price">$400.00</span></p>
                                <hr>
                                <div class="cart-quantity">
                                    <input ng-model="proQuan" type="number" min="1" max="50">
                                    <button ng-click="incQuanP()" class="cart-quan-plus"><span>+</span></button>
                                    <button ng-click="descQuanP()" class="cart-quan-minus"><span>-</span></button>
                                </div><br>
                                <div style="padding-top: 20px">
                                    <a ng-click="addThisToCart('${thisP.proID}')" href=""
                                        class="button-dhq-mk"><i class="fal fa-cart-plus"></i> Add to cart</a>
                                    <a href="" id="wishlist" class="button-dhq-mk btn-love"><i
                                            class="far fa-heart-square"></i> Add to Wishlist</a>
                                </div>
                                <hr>

                            </div>
                            <div class="tab-for-somthing">
                                <ul class="button-tab">
                                    <li class="active"><a href="" id="info">More Details</a></li>
                                    <li><a href="" id="faq">FAQs</a></li>
                                    <li><a href="" id="review">Reviews</a></li>
                                    <li><a href="" id="comment">Comment</a></li>
                                </ul>
                                <div class="tab-things">
                                    <div id="infoTab" class="tabs">
                                        ${thisP.proDetails}
                                    </div>
                                    <div style="display: none;" id="faqTab" class="tabs">
                                        <h4>vip</h4>
                                        <input  placeholder="Give your review a title" class="review-input"/>    
                                        <input  placeholder="Give your review a title" class="review-input"/>    
                                        <input  placeholder="Give your review a title" class="review-input"/>    
                                        <textarea class="review-input" placeholder="Write your comment here"></textarea>     
                                        <button id="btn-faq">SUBMIT REVIEW</button>                                          
                                    </div>
                                    <div style="display: none;" id="reviewTab" class="tabs">
                                        <h3 class="review-h3">Customer Reviews</h3>  
                                        <div id="toThank" class="clearfix">
                                            <span style="float: left">
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
                                                            <span class="span-info quantity-review"> Based on 1 review</span>
                                                        </div>
                                            </span>
                                            <c:if test="${allowRV == 1}">
                                                <a style="float: right" id="write-review">Write a review</a>
                                            </c:if>
                                        </div>
                                        <div id="review-form" class="hide">
                                            <label for="title-r" class="review-label">Review Title</label>
                                            <form>
                                            <input id="title-r" placeholder="Give your review a title" class="review-input"/>    
                                                                                        
                                            <label class="review-label">Rating</label>
                                            <div id="input-star">
                                                <div>
                                                    <a data-numstar="5" href=""></a>
                                                    <a data-numstar="4" href=""></a>
                                                    <a data-numstar="3" href=""></a>
                                                    <a data-numstar="2" href=""></a>
                                                    <a data-numstar="1" href=""></a>
                                                </div>
                                            </div>
                                            <label for="content-r" class="review-label">Body of Review (1500) characters remaining</label>
                                            <textarea id="content-r" class="review-input" placeholder="Write your comment here"></textarea>                                               
                                            <button type="submit" id="btn-review">SUBMIT REVIEW</button>
                                            </form>
                                        </div>
                                        <div id="listReviews" style="max-height: 320px; overflow-y: auto;">
                                        </div>                     
                                    </div>
                                    <div style="display: none;" id="commentTab" class="tabs">
                                        <div class="fb-comments" data-href="http://${url}" data-width="" data-numposts="5"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row more-product">
                        <div class="event col-lg-3">
                            <a href="#"> <img
                                    src="https://cdn.shopify.com/s/files/1/2334/1307/files/sidebar_bannerone_ca2af4fd-b671-4db7-aadd-836632d18971_278x338.png?v=1508984142"
                                    alt="">
                            </a>
                        </div>
                        <div class="col-lg-9">
                            <div class="col-lg-6">
                                <div class="title-row">FOR <span>HER</span></div>
                                <div class="owl-carousel product-slide quanvippro">
                                    <c:forEach items="${list}" var="ssd">
                                        <div class="product-item wow fadeIn">
                                            <div class="image-product">
                                                <a href=""><img
                                                        src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-4_f4c92dfe-1709-4406-bec4-21c707ea1b38_160x140.png"
                                                        alt=""></a>
                                            </div>
                                            <div class="product-info">
                                                <a href="">${ssd}</a>
                                                <!-- <span class="price">$234.32</span> -->
                                                <span class="old-price">$2349.00</span> <span
                                                    class="new-price">$2349.00</span>
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
                                                        <span class="icon-btn"><i
                                                                class="fas fa-shopping-cart"></i></span>
                                                        <span class="tool-title">Addtocart</span>
                                                    </div>
                                                    <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="title-row">FOR <span>HER</span></div>
                                <div class="owl-carousel product-slide quanvippro">
                                    <c:forEach items="${list}" var="ssd">
                                        <div class="product-item wow fadeIn">
                                            <div class="image-product">
                                                <a href=""><img
                                                        src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-4_f4c92dfe-1709-4406-bec4-21c707ea1b38_160x140.png"
                                                        alt=""></a>
                                            </div>
                                            <div class="product-info">
                                                <a href="">${ssd}</a>
                                                <!-- <span class="price">$234.32</span> -->
                                                <span class="old-price">$2349.00</span> <span
                                                    class="new-price">$2349.00</span>
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
                                                        <span class="icon-btn"><i
                                                                class="fas fa-shopping-cart"></i></span>
                                                        <span class="tool-title">Addtocart</span>
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
    <script src="${pageContext.request.contextPath}/assets/js/ajax/reviewajax.js"></script>
    </body>