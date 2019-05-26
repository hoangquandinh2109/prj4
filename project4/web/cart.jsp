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
    </head>
    <body ng-app="cangcucot">
        <div class="content-n-cart clearfix">
            <div class="content">
                <div class="clickdetrove"></div>
                <c:import url="templates/header.jsp"></c:import>
                <div class="web-body">
                    <div class="container">
                        <h2 class="text-center" id="h2yourcart">Your cart</h2>
                        <!-- CART EMPTY -->
                        <!-- <p class="text-center">Your cart is currently empty.</p> -->
                        <!-- <a href="" class="button-in-cart-page">CONTINUE SHOPING <i class="fal fa-long-arrow-right"></i></a> -->
                        <!-- CART EMPTY -->
                        <div class="cart-block">
                            <table class="cart-table">
                                <tr class="cart-table-title">
                                    <td colspan="2" class="r1">Product</td>
                                    <td class="r2">Price</td>
                                    <td class="r3">Quantity</td>
                                    <td class="r4">Total</td>
                                    <td class="r5">Remove</td>
                                </tr>
                                <!-- foreach -->
                                <tr class="cart-table-item">
                                    <td class="r1 r11">
                                        <a href=""></a><img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-4_f4c92dfe-1709-4406-bec4-21c707ea1b38_160x140.png" width="75" height="75"></a>
                                    </td>
                                    <td class="r1">
                                        <a href="">Name product vIp pro</a>
                                    </td>
                                    <td class="r2 fz13">$100.00</td>
                                    <td class="r3">
                                        <div class="cart-quantity">
                                            <input type="number" min="1" max="50">
                                            <button class="cart-quan-plus"><span>+</span></button>
                                            <button class="cart-quan-minus"><span>-</span></button>
                                        </div>
                                    </td>
                                    <td class="r4 fz13">$100.00</td>
                                    <td class="r5"><a href="" class="button-in-cart-page fz13" id="btn-remove-cart">Remove</a></td>
                                </tr>
                                <!-- end foreach -->
                            </table>
                            <div class="cart-footer">
                                <div class="text-right">
                                    <span class="fz15">Subtotal</span><span id="cf-subtotal" class="fz13">$174.99</span>
                                </div>
                                <div class="pt20 pb20 text-right fz11"><i>Shipping & taxes calculated at checkout</i></div>
                                <div class="text-right"><a href="" class="button-in-cart-page fz13">CHECK OUT</a></div>
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
