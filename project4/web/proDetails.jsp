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
                    <div class="container">
                        <div class="path">
                            <span>Home</span>
                            <span>New product</span>
                            <span>YOUR NAME</span>
                        
                        </div>
                        <div class="row details">
                            <div class="col-md-5" style="background-color: #fff;height: 500px">
                                <div class="img">
                                    <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-14_5179a0ce-9afc-43e1-908a-94081cf070cc.png?v=1504667513" alt="">
                                    <div class="small-img">

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7 pro-details" style="background-color:#fff;height: 500px">
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
                                <p style="color:green">AVAILABLE</p>
                                <p class="price">$250.00</p>
                                <hr>
                                <form>
                                    <label for="quantity">Quantity</label>
                                    <input type="text">
                                    <button>
                                        <i>dit</i>
                                        <span>dit</span>
                                    </button>
                                    <a href="#">
                                        <i>dit</i>
                                        <span>dit</span>
                                    </a>
                                </form>
                                <hr>
                                
                            </div>
                            <div class="more-block">
                                    <ul class="nav nav-tabs">
                                            <li class="active"><a data-toggle="tab" href="#home">More Details</a></li>
                                            <li><a data-toggle="tab" href="#menu1">FAQs</a></li>
                                            <li><a data-toggle="tab" href="#menu2">Reviews</a></li>
                                            <li><a data-toggle="tab" href="#menu3">Comment</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="home" class="tab-pane fade in active">
                                                <h3>This is new or no</h3>
                                                <p>This is no or nope</p>
                                        </div>
                                        <div id="menu1" class="tab-pane fade">
                                                <h3>This is new or no</h3>
                                                <p>This is no or nope</p>
                                        </div>
                                        <div id="menu2" class="tab-pane fade">
                                                <h3>This is new or no</h3>
                                                <p>This is no or nope</p>
                                        </div>
                                        <div id="menu3" class="tab-pane fade">
                                                <h3>This is new or no</h3>
                                                <p>This is no or nope</p>
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
        </div>
            
              <c:import url="templates/script.jsp"></c:import>
    </body>
</html>
