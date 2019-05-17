<%-- 
    Document   : cart-modal
    Created on : May 07, 2019, 10:59:58 AM
    Author     : johnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="cart">
    <div class="list-cart-items">
        <div class="cart-item clearfix">
            <div class="cart-photo">
                <img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-4_f4c92dfe-1709-4406-bec4-21c707ea1b38_160x140.png"
                    alt="">
            </div>
            <div class="cart-info">
                <h5 class="cart-proName">Canon LIS5</h5>
                <div class="cart-tools">
                    <div class="cart-quantity">
                        <input type="number" min="1" max="50">
                        <button class="cart-quan-plus"><span>+</span></button>
                        <button class="cart-quan-minus"><span>-</span></button>
                    </div>
                    <button class="cart-items-remove"><i class="fal fa-trash-alt"></i></button>
                </div>
                <div class="cart-price">x $32.23 = $32.23</div>
            </div>
        </div>
    </div>
</div>