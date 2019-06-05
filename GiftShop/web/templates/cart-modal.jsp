<%-- 
    Document   : cart-modal
    Created on : May 07, 2019, 10:59:58 AM
    Author     : johnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="cart">
    <h2>YOUR CART</h2>
    <div class="cart-list-total">
        <div class="list-cart-items" >
            <div style="padding: 40px 0;
                 text-align: center; 
                 font-family: 'MerriweatherSans';
                 font-size: 21px; 
                 opacity: 0.5;" 
                 ng-if="numCart == 0">
                no item
            </div>
            <div class="cart-item clearfix" ng-repeat="ci in listCartItems">
                <div class="cart-photo">
                    <img src="${pageContext.request.contextPath}/productImage/{{ci.proImg}}"
                        alt="">
                </div>
                <div class="cart-info">
                    <h5 class="cart-proName">{{ci.proName}}</h5>
                    <div class="cart-tools">
                        <div class="cart-quantity" >
                            <!--$event de lay quantity validate-->
                            <input ng-keyup="ci.quantity = updateQuantity(ci.ID,$event)" ng-model="ci.quantity" type="number" min="1" max="50">
                            <button ng-click="ci.quantity = inc(ci.ID,ci.quantity)" class="cart-quan-plus"><span>+</span></button>
                            <button ng-click="ci.quantity = desc(ci.ID,ci.quantity)" class="cart-quan-minus"><span>-</span></button>
                        </div>
                        <button ng-click="deleteItem(ci.ID)" class="cart-items-remove"><i class="fal fa-trash-alt"></i></button>
                    </div>
                    <div class="cart-price">x {{"$"+ci.proPrice}} = {{"$"+(ci.proPrice*ci.quantity)}}</div>
                </div>
            </div>
        </div>
        <div class="total-price">
            <span id="t-title">SUBTOTAL</span>  
            <span id="t-price">{{"$"+subtotal}}</span>
        </div>
    </div>
    <a id="toCart" href="${pageContext.request.contextPath}/cart">Go to Cart</a>
    <a id="Checkout" href="${pageContext.request.contextPath}/checkout">Check out <i class="fal fa-long-arrow-right"></i></a>
</div>