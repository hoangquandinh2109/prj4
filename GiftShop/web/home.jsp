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
    <body ng-app="cangcucot"  ng-controller="cart">
        <div class="content-n-cart clearfix">
            <div class="content">
                <div class="clickdetrove"></div>
                <c:import url="templates/header.jsp"></c:import>
                <div class="web-body">
                    <div class="container">
                        <div class="row">
                            <div class="left-column">
                                <div class="categories">
                                    <h4 class="title-bar-categories"><i class="far fa-list"></i>Categories</h4>
                                    <ul>
                                        <li>
                                            <a href="">
                                                <span class="categories-title"><i class="fa fa-gamepad"></i>Boys</span>
                                                <span class="categories-desc">Proin gravida nibh vel velit auctor aliquet</span></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span class="categories-title"><i class="fal fa-diploma"></i></i>Girls</span>
                                                <span class="categories-desc">Aenean sollicitudin, lorem quis bibendum auctor</span></span>
                                            <!--<i class="fas fa-caret-left"></i>-->
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span class="categories-title"><i class="fa fa-female"></i>Women</span>
                                                <span class="categories-desc">Duis sed odio sit amet nibh vulputate</span></span>
                                            <!--<i class="fas fa-caret-left"></i>-->
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span class="categories-title"><i class="fa fa-male"></i>Men</span>
                                                <span class="categories-desc">Morbi accumsan ipsum velit. Nam nec tellus</span></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span class="categories-title"><i class="far fa-user-friends"></i></i>For All</span>
                                                <span class="categories-desc">Sed non  mauris vitae erat consequat auctor eu in elit</span></span>
                                            <!--<i class="fas fa-caret-left"></i>-->
                                            </a>
                                        </li>
<!--                                        <li>
                                            <a href="">
                                                <span class="categories-title"><i class="far fa-tennis-ball"></i>Sports</span>
                                                <span class="categories-desc">Class aptent taciti sociosqu ad litora</span></span>
                                            </a>
                                        </li>-->
                                    </ul>
                                </div>
                                <div>
                                    <div class="title-row">sdsd <span>ssdsd</span></div>
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
                                        <c:forEach items="${list}" var="ssd">
                                        <c:if test="${i == 0}">
                                        <div>
                                        </c:if>
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
                                                </div>
                                            </div>
                                            <c:set var="i" value="${i+1}" />
                                        <c:if test="${i == 2}">
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
                                <div class="title-row">Features <span>Product</span></div>
                                <div class="product-block">
                                    <c:set var="i" value="0" />
                                <c:forEach items="${list}" var="sd">
                                    <c:if test="${i == 0}">
                                    <div class="row">
                                    </c:if>
                                        <div class="product-item wow fadeInUp">
                                            <div class="image-product">
                                                <a href=""><img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-4_f4c92dfe-1709-4406-bec4-21c707ea1b38_160x140.png" alt=""></a>
                                            </div>
                                            <div class="product-info">
                                                <a href="">${sd}</a>
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
                                        </div> <c:set var="i" value="${i+1}" />
                                    <c:if test="${i == 4}">
                                    </div>
                                    <c:set var="i" value="0" />
                                    </c:if>
                                </c:forEach>
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