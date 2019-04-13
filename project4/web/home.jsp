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
    <body>
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
                            <a href=""><img src="https://cdn.shopify.com/s/files/1/2334/1307/files/home_bannertop_8cd761c7-55bc-49a8-8fe5-552c5466d5ee_873x160.png?v=1509421734" alt=""></a>
                        </div>
                        <div class="title-row">News Product</div>
                        <div class="product-block">
                            <div class="row">
                                <div class="product-item">
                                    <div>
                                        <a href=""><img src="" alt=""></a>
                                    </div>
                                    <div>
                                        <p>Lorem Ipsum is simply dummy text of the printing industry</p>
                                        <span>$2349.00</span>
                                    </div>
                                    <div class="review-n-button-tu">
                                        <div class="review-tu">
                                            <div></div>
                                            <span>No reviews</span>
                                        </div>
                                        <div class="button-tu clearfix">
                                            <div class="btn-addtocart">
                                                <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                <span class="tool-title">Addtocart</span>
                                            </div>
                                            <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-item">
                                    <div>
                                        <a href=""><img src="" alt=""></a>
                                    </div>
                                    <div>
                                        <p>Lorem Ipsum is simply dummy text of the printing industry</p>
                                        <span>$2349.00</span>
                                    </div>
                                    <div class="review-n-button-tu">
                                        <div class="review-tu">
                                            <div></div>
                                            <span>No reviews</span>
                                        </div>
                                        <div class="button-tu clearfix">
                                            <div class="btn-addtocart">
                                                <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                <span class="tool-title">Addtocart</span>
                                            </div>
                                            <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-item">
                                    <div>
                                        <a href=""><img src="" alt=""></a>
                                    </div>
                                    <div>
                                        <p>Lorem Ipsum is simply dummy text of the printing industry</p>
                                        <span>$2349.00</span>
                                    </div>
                                    <div class="review-n-button-tu">
                                        <div class="review-tu">
                                            <div></div>
                                            <span>No reviews</span>
                                        </div>
                                        <div class="button-tu clearfix">
                                            <div class="btn-addtocart">
                                                <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                <span class="tool-title">Addtocart</span>
                                            </div>
                                            <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-item">
                                    <div>
                                        <a href=""><img src="" alt=""></a>
                                    </div>
                                    <div>
                                        <p>Lorem Ipsum is simply dummy text of the printing industry</p>
                                        <span>$2349.00</span>
                                    </div>
                                    <div class="review-n-button-tu">
                                        <div class="review-tu">
                                            <div></div>
                                            <span>No reviews</span>
                                        </div>
                                        <div class="button-tu clearfix">
                                            <div class="btn-addtocart">
                                                <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                <span class="tool-title">Addtocart</span>
                                            </div>
                                            <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="product-item">
                                    <div>
                                        <a href=""><img src="" alt=""></a>
                                    </div>
                                    <div>
                                        <p>Lorem Ipsum is simply dummy text of the printing industry</p>
                                        <span>$2349.00</span>
                                    </div>
                                    <div class="review-n-button-tu">
                                        <div class="review-tu">
                                            <div></div>
                                            <span>No reviews</span>
                                        </div>
                                        <div class="button-tu clearfix">
                                            <div class="btn-addtocart">
                                                <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                <span class="tool-title">Addtocart</span>
                                            </div>
                                            <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-item">
                                    <div>
                                        <a href=""><img src="" alt=""></a>
                                    </div>
                                    <div>
                                        <p>Lorem Ipsum is simply dummy text of the printing industry</p>
                                        <span>$2349.00</span>
                                    </div>
                                    <div class="review-n-button-tu">
                                        <div class="review-tu">
                                            <div></div>
                                            <span>No reviews</span>
                                        </div>
                                        <div class="button-tu clearfix">
                                            <div class="btn-addtocart">
                                                <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                <span class="tool-title">Addtocart</span>
                                            </div>
                                            <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-item">
                                    <div>
                                        <a href=""><img src="" alt=""></a>
                                    </div>
                                    <div>
                                        <p>Lorem Ipsum is simply dummy text of the printing industry</p>
                                        <span>$2349.00</span>
                                    </div>
                                    <div class="review-n-button-tu">
                                        <div class="review-tu">
                                            <div></div>
                                            <span>No reviews</span>
                                        </div>
                                        <div class="button-tu clearfix">
                                            <div class="btn-addtocart">
                                                <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                <span class="tool-title">Addtocart</span>
                                            </div>
                                            <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-item">
                                    <div>
                                        <a href=""><img src="" alt=""></a>
                                    </div>
                                    <div>
                                        <p>Lorem Ipsum is simply dummy text of the printing industry</p>
                                        <span>$2349.00</span>
                                    </div>
                                    <div class="review-n-button-tu">
                                        <div class="review-tu">
                                            <div></div>
                                            <span>No reviews</span>
                                        </div>
                                        <div class="button-tu clearfix">
                                            <div class="btn-addtocart">
                                                <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                <span class="tool-title">Addtocart</span>
                                            </div>
                                            <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="product-item">
                                    <div>
                                        <a href=""><img src="" alt=""></a>
                                    </div>
                                    <div>
                                        <p>Lorem Ipsum is simply dummy text of the printing industry</p>
                                        <span>$2349.00</span>
                                    </div>
                                    <div class="review-n-button-tu">
                                        <div class="review-tu">
                                            <div></div>
                                            <span>No reviews</span>
                                        </div>
                                        <div class="button-tu clearfix">
                                            <div class="btn-addtocart">
                                                <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                <span class="tool-title">Addtocart</span>
                                            </div>
                                            <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-item">
                                    <div>
                                        <a href=""><img src="" alt=""></a>
                                    </div>
                                    <div>
                                        <p>Lorem Ipsum is simply dummy text of the printing industry</p>
                                        <span>$2349.00</span>
                                    </div>
                                    <div class="review-n-button-tu">
                                        <div class="review-tu">
                                            <div></div>
                                            <span>No reviews</span>
                                        </div>
                                        <div class="button-tu clearfix">
                                            <div class="btn-addtocart">
                                                <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                <span class="tool-title">Addtocart</span>
                                            </div>
                                            <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-item">
                                    <div>
                                        <a href=""><img src="" alt=""></a>
                                    </div>
                                    <div>
                                        <p>Lorem Ipsum is simply dummy text of the printing industry</p>
                                        <span>$2349.00</span>
                                    </div>
                                    <div class="review-n-button-tu">
                                        <div class="review-tu">
                                            <div></div>
                                            <span>No reviews</span>
                                        </div>
                                        <div class="button-tu clearfix">
                                            <div class="btn-addtocart">
                                                <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                <span class="tool-title">Addtocart</span>
                                            </div>
                                            <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-item">
                                    <div>
                                        <a href=""><img src="" alt=""></a>
                                    </div>
                                    <div>
                                        <p>Lorem Ipsum is simply dummy text of the printing industry</p>
                                        <span>$2349.00</span>
                                    </div>
                                    <div class="review-n-button-tu">
                                        <div class="review-tu">
                                            <div></div>
                                            <span>No reviews</span>
                                        </div>
                                        <div class="button-tu clearfix">
                                            <div class="btn-addtocart">
                                                <span class="icon-btn"><i class="fas fa-shopping-cart"></i></span>
                                                <span class="tool-title">Addtocart</span>
                                            </div>
                                            <div class="btn-love"><span><i class="fa fa-heart"></i></span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="templates/footer.jsp"></c:import>
    </body>
</html>
