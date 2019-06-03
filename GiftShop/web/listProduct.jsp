<%-- 
    Document   : listProduct
    Created on : Apr 25, 2019, 8:58:00 AM
    Author     : bemap
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="templates/head.jsp"></c:import>
        <link rel="stylesheet" href="assets/css/listProduct.css">
        </head>
        <body>
            <div class="content-n-cart clearfix">
                <div class="content">
                    <div class="clickdetrove"></div>
                <c:import url="templates/header.jsp"></c:import>

                    <!--web body-->
                    <div class="web-body">
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
                                                        <p>${ssd}</p>
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
                                            <div class="event">
                                            <img src="https://cdn.shopify.com/s/files/1/2334/1307/collections/list_collection_default_2f07e954-6fe9-4cde-9d52-4c2ce7fa7d58_1024x1024.png?v=1508136156">

                                            </div>
                                            <div class="cat-des">
                                                <div class="deText">
                                                    <span>THIS IS YOUR MOMENT Prove YOUR SEFT AND RISE!!</span>
                                                </div>
                                            </div>
                                            <div class="title-row">
                                                YOUR<span>MOMENT</span>
                                            </div>
                                            <div class="product-block">
                                                
                                            </div>
                                        </div>
                        </div>
                          
                    </div>
                                          <c:import url="templates/footer.jsp"></c:import>
                </div>

            </div>
        </div>
        <c:import url="templates/script.jsp"></c:import>
    </body>
</html>
