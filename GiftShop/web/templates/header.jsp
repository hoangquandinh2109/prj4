<%-- 
    Document   : header
    Created on : Apr 13, 2019, 11:02:58 AM
    Author     : johnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="dangcap">
    <div class="lds-ring">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>
<div class="top-nav">
    <div class="container">
        <div class="top-nav-welcome">
            <c:if test="${not empty sessionname}">
                <c:set var="signedIn" value="true"></c:set>
                <div>Welcome <a href="${pageContext.request.contextPath}/account" id="name">${sessionname}</a>, <a href="${pageContext.request.contextPath}/logout">logout</a></div>
            </c:if>
            <c:if test="${empty sessionname}">
                <c:set var="signedIn" value="false"></c:set>
                <div>Welcome visitor you can <a class="login-link" href="">Login</a> and <a class="create-acc-link" href="">create an account</a> </div>
            </c:if>
        </div>
        <div class="top-nav-tools">
            <ul>
                <li><a onclick="return filterwishlist(${signedIn});" href="${pageContext.request.contextPath}/account/wishlist"><i class="far fa-list-alt"></i> Wishlist</a></li>
                <li><a onclick="return filterwishlist(${signedIn});" href="${pageContext.request.contextPath}/account"><i class="fas fa-user-alt"></i> My Account</a></li>
                <li><a href="${pageContext.request.contextPath}/cart"><i class="fas fa-share"></i> Checkout</a></li>
                <li class="por unseen" id="btn-bell">
                    <a href="${pageContext.request.contextPath}/cart"><i class="fas fa-bell"></i></a>
                    <div id="hopvip" style="display: none;">
                        <div class="listhop">
                            <div class="hv-item">
                                <a href="">
                                    <span class="hv-title">Toi da ngu nhu the nao trong hoan canh nay</span>
                                    <span class="hv-info">
                                        by <strong>Nguyen Hoang Tu</strong> on <strong>21/09/2027</strong>
                                    </span>
                                </a>
                            </div>
                            <div class="hv-item">
                                <a href="">
                                    <span class="hv-title">Toi da ngu nhu the nao trong hoan canh nay</span>
                                    <span class="hv-info">
                                        by <strong>Nguyen Hoang Tu</strong> on <strong>21/09/2027</strong>
                                    </span>
                                </a>
                            </div>
                            <div class="hv-item">
                                <a href="">
                                    <span class="hv-title">Toi da ngu nhu the nao trong hoan canh nay</span>
                                    <span class="hv-info">
                                        by <strong>Nguyen Hoang Tu</strong> on <strong>21/09/2027</strong>
                                    </span>
                                </a>
                            </div>
                            <div class="hv-item">
                                <a href="">
                                    <span class="hv-title">Toi da ngu nhu the nao trong hoan canh nay</span>
                                    <span class="hv-info">
                                        by <strong>Nguyen Hoang Tu</strong> on <strong>21/09/2027</strong>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </li>
<!--                <li><div id="tools-setting"><i class="fas fa-cog"></i> Setting <i class="fas fa-caret-down"></i></div></li>-->
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
                        <p><em>on order over $100</em></p>
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
            <div class="showcartajax">
                <div class="title-cart">
                    <i class="fas fa-shopping-cart"></i>
                </div>
                <div class="cart-inner">
                    <span class="cart-title">Shopping cart</span>
                    <span id="CartCount">{{numCart}}</span> <span>items</span>
                    <span id="CartCost"> - <span class="money">{{"$"+subtotal}}</span></span>
                </div>
            </div>
        </div>
    </div>
</div>
<nav class="navigation">
    <div class="container">
        <ul class="row">
            <li><a href="${pageContext.request.contextPath}">Home</a></li>
            <li><a href="${pageContext.request.contextPath}">About</a></li>
            <li><a href="${pageContext.request.contextPath}">Contact</a></li>
            <li>
                <a href="#">Product</a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/product/category">Category</a></li>
                    <li><a href="${pageContext.request.contextPath}/product/type">Type</a></li>
                </ul>
            </li>
            <li><a href="${pageContext.request.contextPath}/postIndex.jsp">Blog</a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/createPostServlet">Create new Post</a></li>
                    <li><a href="${pageContext.request.contextPath}/searchForwardPage">Search Posts/Authors</a></li>
                     <li><a href="${pageContext.request.contextPath}/detailsPostUser.jsp">My Post</a></li>
                   
                </ul>
            </li>
        </ul>
        <div ng-controller="vippro as ctrl" id="form-autocomplete"  >
            <form method="post" ng-submit="$event.preventDefault()">
              <md-autocomplete
                  id="custom-template"
                  md-selected-item="ctrl.selectedItem"
                  md-search-text-change="ctrl.searchTextChange(ctrl.searchText)"
                  md-search-text="ctrl.searchText"
                  md-selected-item-change="ctrl.selectedItemChange(item)"
                  md-items="item in ctrl.querySearch(ctrl.searchText)"
                  md-item-text="item.proName"
                  md-min-length="0"
                  input-aria-label="Current Repository"
                  placeholder="Enter a name"
                  md-menu-class="autocomplete-custom-template"
                  md-menu-container-class="custom-container">
                <md-item-template>
                    <img class="imgClass" src="{{item.proImage}}"><span class="proNameClass" md-highlight-text="ctrl.searchText" md-highlight-flags="i">{{item.proName}}</span>
                </md-item-template>
              </md-autocomplete>
                <button id="search-button"><i class="fas fa-search"></i></button>
            </form>
        </div>
    </div>
</nav>
