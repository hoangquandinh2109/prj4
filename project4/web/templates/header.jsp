<%-- 
    Document   : header
    Created on : Apr 13, 2019, 11:02:58 AM
    Author     : johnn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="top-nav">
    <div class="container">
        <div class="top-nav-welcome">
            <div>Welcome visitor you can <a class="login-link" href="">Login</a> and <a class="create-acc-link" href="">create an account</a> </div>
        </div>
        <div class="top-nav-tools">
            <ul>
                <li><a href=""><i class="far fa-list-alt"></i> Wishlist</a></li>
                <li><a href=""><i class="fas fa-user-alt"></i> My Account</a></li>
                <li><a href=""><i class="fas fa-share"></i> Checkout</a></li>
                <li><div id="tools-setting"><i class="fas fa-cog"></i> Setting <i class="fas fa-caret-down"></i></div></li>
            </ul>
        </div>
    </div>
</div>
<div class="header-main">
    <div class="container">
        <div class="header-logo">
            <img class="wow bounceIn" src="https://cdn.shopify.com/s/files/1/2334/1307/files/logo_190x30.png" alt="">
        </div>
        <div class="header-service">
            <div class="clearfix">
                <div class="wow fadeInDown pull-left clearfix">
                    <div class="box-icon">
                        <i class="fas fa-truck"></i>
                        <!-- <i class="fal fa-truck"></i> -->
                    </div>
                    <div class="media-body">
                        <h4>Free Shipping</h4>
                        <p><em>on order over $100.00</em></p>
                    </div>
                </div>
                <div style="animation-delay: .5s;" class="wow fadeInDown pull-left clearfix">
                    <div class="box-icon">
                            <i class="fas fa-undo-alt"></i>
                    </div>
                    <div class="media-body">
                        <h4>Free Return</h4>
                        <p><em>free 90 days return policy</em></p>
                    </div>
                </div>
                <div style="animation-delay: 1s;" class="wow fadeInDown  pull-left clearfix">
                    <div class="box-icon">
                        <i class="far fa-money-bill-alt"></i>
                    </div>
                    <div class="media-body">
                        <h4>Member discount</h4>
                        <p><em>free register</em></p>
                    </div>
                </div>
            </div>
        </div>
        <div style="animation-delay: 1.5s;" class="wow fadeInDown header-cart">
            <div class="title-cart">
                <i class="fas fa-shopping-cart"></i>
            </div>
            <div class="cart-inner">
                <span class="cart-title">Shopping cart</span>
                <span id="CartCount">0</span> <span>items</span>
                <span id="CartCost"> - <span class="money">$0.00</span></span>
            </div>
        </div>
    </div>
</div>
<nav class="navigation">
    <div class="container">
        <ul class="row">
            <li><a href="">Home</a></li>
            <li><a href="">About</a></li>
            <li><a href="">Contact</a></li>
            <li><a href="">Product</a></li>
            <li><a href="">News</a></li>
        </ul>
        <form method="post">
            <input type="text"><button><i class="fas fa-search"></i></button>
        </form>
    </div>
</nav>
