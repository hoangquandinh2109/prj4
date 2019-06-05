<%-- 
    Document   : cart
    Created on : May 7, 2019, 10:42:34 AM
    Author     : johnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="templates/head.jsp"></c:import>
        <style>
            body .content-n-cart .content.kovao{
                left: 0!important;
            }
            body .content-n-cart .content.kovao .clickdetrove{
                display:none!important;
            }
        </style>
    </head>
    <body ng-app="cangcucot" ng-controller="cart">
        <div class="content-n-cart clearfix">
            <div class="content kovao">
                <div class="clickdetrove"></div>
                <c:import url="templates/header.jsp"></c:import>
                <div class="web-body">
                    <div class="container">
                        <div ng-if="numCart == 0" id="empty-cart">
                            <p class="text-center">Your cart is currently empty.</p> 
                            <a href="${pageContext.request.contextPath}" class="button-in-cart-page">CONTINUE SHOPPING <i class="fal fa-long-arrow-right"></i></a> 
                        </div>
                        <h2 ng-if="numCart != 0" class="text-center" id="h2yourcart">Your cart</h2>
                        <div class="cart-block" ng-if="numCart != 0">
                            <table class="cart-table">
                                <tr class="cart-table-title">
                                    <td colspan="2" class="r1">Product</td>
                                    <td class="r2">Price</td>
                                    <td class="r3">Quantity</td>
                                    <td class="r4">Total</td>
                                    <td class="r5">Remove</td>
                                </tr>
                                <!-- foreach -->
                                <tr class="cart-table-item"  ng-repeat="ci in listCartItems">
                                    <td class="r1 r11">
                                        <a href=""></a><img src="${pageContext.request.contextPath}/productImage/{{ci.proImg}}" width="75" height="75"></a>
                                    </td>
                                    <td class="r1">
                                        <a href="">{{ci.proName}}</a>
                                    </td>
                                    <td class="r2 fz13">{{"$"+ci.proPrice}}</td>
                                    <td class="r3">
                                       <div class="cart-quantity" id="asdkkfjasfd">
                                            <!--$event de lay quantity validate-->
                                            <input ng-keyup="ci.quantity = updateQuantity(ci.ID,$event)" ng-model="ci.quantity" type="number" min="1" max="50">
                                            <button ng-click="ci.quantity = inc(ci.ID,ci.quantity)" class="cart-quan-plus"><span>+</span></button>
                                            <button ng-click="ci.quantity = desc(ci.ID,ci.quantity)" class="cart-quan-minus"><span>-</span></button>
                                        </div>
                                    </td>
                                    <td class="r4 fz13">{{"$"+(ci.proPrice*ci.quantity)}}</td>
                                    <td class="r5"><a href="" ng-click="deleteItem(ci.ID)" class="button-in-cart-page fz13" id="btn-remove-cart">Remove</a></td>
                                </tr>
                                <!-- end foreach -->
                            </table>
                            <div class="cart-footer">
                                <div class="text-right">
                                    <span class="fz15">Subtotal</span><span id="cf-subtotal" class="fz13">{{"$"+subtotal}}</span>
                                </div>
                                <div class="pt20 pb20 text-right fz11"><i>Shipping & taxes calculated at checkout</i></div>
                                <div class="text-right"><a href="${pageContext.request.contextPath}/checkout" class="button-in-cart-page fz13">CHECK OUT</a></div>
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
