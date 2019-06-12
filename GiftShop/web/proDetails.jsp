<%-- 
    Document   : proDetails
    Created on : Apr 23, 2019, 9:49:26 AM
    Author     : bemap
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <input type="hidden" value="${thisP.proID}" id="proID">
    <div class="content-n-cart clearfix">
        <div class="content">
            <div class="clickdetrove"></div>
            <c:import url="templates/header.jsp"></c:import>
            <div class="web-body">
                <div id="fb-root"></div>
                <script async defer crossorigin="anonymous" src="https://connect.facebook.net/fr_FR/sdk.js#xfbml=1&version=v3.3"></script>
                <div class="container" ng-controller="wishlist">
                    <div class="row details">
                        <div class="col-md-5">
                            <div class="img">
                                <img id="big-img" src="${pageContext.request.contextPath}/productImage/${thisImg}" alt="">
                            </div>
                            <div class="small-img">
                                <c:forEach items="${otherImgs}" var="oi">
                                    <div>
                                    <img class="sm-img-item" src="${pageContext.request.contextPath}/productImage/${oi}">
                                    </div>
                                </c:forEach>
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
                                <!--<p>Vendor:Women's shirts</p>-->
                                <!--<p>THIS IS YOUR FIRST TIME</p>-->
                                <hr>
                                <p class="availability">AVAILABLE</p>
                                <c:if test="${thisP.discout == 0}">
                                <p><span class="price">&#36;${thisP.proPrice}</span></p>
                                </c:if>
                                <c:if test="${thisP.discout > 0}">
                                    <p><span class="price">&#36;<fmt:formatNumber type="number" maxFractionDigits="2" value="${thisP.proPrice * (100-thisP.discout)/100}"/></span> <span
                                            class="old-price">&#36;${thisP.proPrice}</span></p>
                                </c:if>
                                <hr>
                                <div class="cart-quantity">
                                    <input readonly="" ng-model="proQuan" type="number" min="1" max="50">
                                    <button ng-click="incQuanP()" class="cart-quan-plus"><span>+</span></button>
                                    <button ng-click="descQuanP()" class="cart-quan-minus"><span>-</span></button>
                                </div><br>
                                <div style="padding-top: 20px">
                                    <a ng-click="addThisToCart('${thisP.proID}')" href=""
                                        class="button-dhq-mk"><i class="fal fa-cart-plus"></i> Add to cart</a>
                                        <span class="hide" id="onW">${onWishlist}</span>
                                    <a ng-class="addedClass(onW)" ng-click="onW = btnWishlist('${thisP.proID}', onW)" href="" id="wishlist-btn" class="button-dhq-mk btn-love"><i
                                            class="far fa-heart-square"></i> {{namingWBtn(onW)}}</a>
                                </div>
                                <hr>

                            </div>
                            <div class="tab-for-somthing">
                                <ul class="button-tab">
                                    <li class="active"><a href="" id="info">More Details</a></li>
                                    <li><a href="" id="review">Reviews</a></li>
                                    <li><a href="" id="comment">Comment</a></li>
                                </ul>
                                <div class="tab-things">
                                    <div id="infoTab" class="tabs">
                                        ${thisP.proDetails}
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
                        <c:if test="${ not empty sessionScope.sessionid}">
                        <div class="col-lg-9">
                            <div class="col-lg-6">
                                <div class="title-row">SAME <span>CATEGORY</span></div>
                                <div class="owl-carousel product-slide quanvippro">
                                    <c:forEach items="${samecat}" var="smc">
                                        <div class="product-item wow fadeIn">
                                            <div class="image-product">
                                                <a href="${smc[1]}"><img src="${smc[3]}" alt=""></a>
                                            </div>
                                            <div class="product-info">
                                                <a href="${smc[1]}">${smc[2]}</a>
                                                <c:if test="${smc[5] == '$0.0'}">
                                                    <span class="price">${smc[4]}</span> 
                                                </c:if>
                                                <c:if test="${smc[5] != '$0.0'}">
                                                    <span class="old-price">${smc[4]}</span> <span class="new-price">${smc[5]}</span>
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
                                                        <div style="width: ${smc[6]}}" class="star-reviewed">
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                        </div>
                                                    </div>
                                                    <c:if test="${smc[6] == '0.0%'}">
                                                    <span class="quantity-review">No review</span>
                                                    </c:if>        
                                                    <c:if test="${smc[6] != '0.0%'}">
                                                    <span class="numrv quantity-review">(${smc[7]})</span>
                                                    </c:if>
                                                </div>
                                                <div class="button-tu clearfix">
                                                    <div ng-click="addThisToCart('${smc[0]}')" class="btn-addtocart addtocart clearfix">
                                                        <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                        <span class="tool-title">Add to Cart</span>
                                                    </div>
                                                    <div ng-init="onWsmc${i} = ${smc[8]}" ng-class="addedClass(onWsmc${i})" class="btn-love" ng-click="onWsmc${i} = btnWishlist('${smc[0]}', onWsmc${i})"><span><i class="fa fa-heart"></i></span></div>
                                                </div>
                                            </div>
                                        </div>
                                                    <c:set var="i" value="${i+1}"/>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="title-row">YOU MAY <span>LIKE</span></div>
                                <div class="owl-carousel product-slide quanvippro">
                                    <c:forEach items="${youmaylike}" var="yml">
                                        <div class="product-item wow fadeIn">
                                            <div class="image-product">
                                                <a href="${yml[1]}"><img src="${yml[3]}" alt=""></a>
                                            </div>
                                            <div class="product-info">
                                                <a href="${yml[1]}">${yml[2]}</a>
                                                <c:if test="${yml[5] == '$0.0'}">
                                                    <span class="price">${yml[4]}</span> 
                                                </c:if>
                                                <c:if test="${yml[5] != '$0.0'}">
                                                    <span class="old-price">${yml[4]}</span> <span class="new-price">${yml[5]}</span>
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
                                                        <div style="width: ${yml[6]}}" class="star-reviewed">
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                        </div>
                                                    </div>
                                                    <c:if test="${yml[6] == '0.0%'}">
                                                    <span class="quantity-review">No review</span>
                                                    </c:if>        
                                                    <c:if test="${yml[6] != '0.0%'}">
                                                    <span class="numrv quantity-review">(${yml[7]})</span>
                                                    </c:if>
                                                </div>
                                                <div class="button-tu clearfix">
                                                    <div ng-click="addThisToCart('${yml[0]}')" class="btn-addtocart addtocart clearfix">
                                                        <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                        <span class="tool-title">Add to Cart</span>
                                                    </div>
                                                    <div ng-init="onWyml${i} = ${yml[8]}" ng-class="addedClass(onWyml${i})" class="btn-love" ng-click="onWyml${i} = btnWishlist('${yml[0]}', onWyml${i})"><span><i class="fa fa-heart"></i></span></div>
                                                </div>
                                            </div>
                                        </div>
                                                    <c:set var="i" value="${i+1}"/>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <c:import url="templates/footer.jsp"></c:import>
        </div>
        <c:import url="templates/cart-modal.jsp"></c:import>
    </div>
    <c:import url="templates/script.jsp"></c:import>
    <script src="${pageContext.request.contextPath}/assets/js/ajax/reviewajax.js"></script>
    <script>
        $(document).ready(function(){
            $(".small-img > div:first-child").addClass("active");
            $(".sm-img-item").click(function(){
                var newimg = $(this).attr("src");
                $("#big-img").remove();
                $(".img").append("<img id=\"big-img\" class=\"fadeIn animated\" src=\""+newimg+"\" />")
                $(".sm-img-item").parent().removeClass("active")
                $(this).parent().addClass("active")
            });
            
            
        });
    </script>
    </body>