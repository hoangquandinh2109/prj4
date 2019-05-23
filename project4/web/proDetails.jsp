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
    <body>
        <div class="content-n-cart clearfix">
            <div class="content">
                <div class="clickdetrove"></div>
                <c:import url="templates/header.jsp"></c:import>
                    <div class="web-body">
                        <div class="container"  >
                            <div class="path">
                                <span>Home</span>
                                <span>New product</span>
                                <span>YOUR NAME</span>

                            </div>
                            <div class="row details">
                                <div class="col-md-5" >
                                    <div class="img">
                                        <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-14_5179a0ce-9afc-43e1-908a-94081cf070cc.png?v=1504667513" alt="">
                                        <div class="small-img">

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-7 pro-details" >
                                    <div class="details-block">
                                        <h1>CANON F1S</h1>
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
                                        <p>Vendor:Women's shirts</p>
                                        <p>THIS IS YOUR FIRST TIME</p>
                                        <hr>
                                        <p class="availability">AVAILABLE</p>
                                        <p><span class="price">$250.00</span> <span class="old-price">$400.00</span></p>
                                        <hr>
                                        <div class="cart-quantity">
                                            <input type="number" min="1" max="50">
                                            <button class="cart-quan-plus"><span>+</span></button>
                                            <button class="cart-quan-minus"><span>-</span></button>
                                        </div><br>
                                        <div style="padding-top: 20px">
                                            <a href="" class="button-dhq-mk addtocart"><i class="fal fa-cart-plus"></i> Add to cart</a>
                                            <a href="" id="wishlist" class="button-dhq-mk btn-love"><i class="far fa-heart-square"></i> Add to Wishlist</a>
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
                                                info
                                            </div>
                                            <div style="display: none;" id="faqTab" class="tabs">
                                                faq
                                            </div>
                                            <div style="display: none;" id="reviewTab" class="tabs">
                                                review<br>
                                                review<br>
                                                review<br>
                                                review<br>
                                                review<br>
                                                review<br>
                                            </div>
                                            <div style="display: none;" id="commentTab" class="tabs">
                                                comment
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row more-product">
                                <div class="event col-lg-3">
                                    <a href="#"> <img src="https://cdn.shopify.com/s/files/1/2334/1307/files/sidebar_bannerone_ca2af4fd-b671-4db7-aadd-836632d18971_278x338.png?v=1508984142" alt="">
                                    </a>
                                </div>
                                <div class="col-lg-9">
                                    <div class="col-lg-6">
                                        <div class="title-row">FOR <span>HER</span></div>
                                        <div class="owl-carousel product-slide quanvippro" >
                                        <c:forEach items="${list}" var="ssd">
                                            <div class="product-item wow fadeIn">
                                                <div class="image-product">
                                                    <a href=""><img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-4_f4c92dfe-1709-4406-bec4-21c707ea1b38_160x140.png" alt=""></a>
                                                </div>
                                                <div class="product-info">
                                                    <p>${ssd}</p>
                                                    <!-- <span class="price">$234.32</span> -->
                                                    <span class="old-price">$2349.00</span> <span class="new-price">$2349.00</span>
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
                                    <div class="owl-carousel product-slide quanvippro" >
                                        <c:forEach items="${list}" var="ssd">
                                            <div class="product-item wow fadeIn">
                                                <div class="image-product">
                                                    <a href=""><img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-4_f4c92dfe-1709-4406-bec4-21c707ea1b38_160x140.png" alt=""></a>
                                                </div>
                                                <div class="product-info">
                                                    <p>${ssd}</p>
                                                    <!-- <span class="price">$234.32</span> -->
                                                    <span class="old-price">$2349.00</span> <span class="new-price">$2349.00</span>
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
                                                        <div class="btn-addtocart clearfix">
                                                            <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
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
              <script src="${pageContext.request.contextPath}/assets/library/angularjs/angular.min.js"></script>
              <script src="${pageContext.request.contextPath}/assets/js/product.js"></script>
    </body>
</html>
