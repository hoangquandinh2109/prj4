<%-- 
    Document   : purchase
    Created on : May 7, 2019, 10:42:45 AM
    Author     : johnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="templates/head.jsp"></c:import>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/purchase.css">
    </head>
    <body ng-app="cangcucot"  ng-controller="cart">
        <div class="wrap-page">
            <div class="container">
                <div class="main col-xs-7">
                    <h4>GiftStore</h4>
                    <div id="breadcum">
                        <a href="">Cart</a> <i class="fal fa-chevron-right"></i> 
                        <a href="">Information</a> <i class="fal fa-chevron-right"></i> 
                        <a href="">Shipping</a> <i class="fal fa-chevron-right"></i> 
                        <a href="">Payment</a>
                    </div>
                    <p>Contact Information</p>
                    <div id="conInf-ca">
                        <div id="img-coninfca"><img src="http://localhost:8080/project4/img/blankava.png" alt=""></div>
                        <div id="ifo-conifi">
                            <p>Vip Pro (vippro@gmail.com) </p>
                            <p><a href="">Log out</a></p>
                        </div>
                    </div>
                    <p>Shipping Address</p>
                    <input type="text" placeholder="Name">
                    <input type="text" placeholder="Address">
                    <input type="text" placeholder="Phone">
                    <div class="navigator-purchase">
                        <a href="" id="backtoprev"><i class="fal fa-chevron-left"></i> Return to Cart</a>
                        <a id="nexttocontinue" href="">Continue to Shipping method</a>
                    </div>
                </div>
                <div class="side-bar col-xs-5">
                    <div class="list-cart">
                        <div class="ci-pu">
                            <div class="imgcipu"><img src="https://cdn.shopify.com/s/files/1/2334/1307/products/Untitled-4_f4c92dfe-1709-4406-bec4-21c707ea1b38_160x140.png" alt=""><span></span></div>
                            <p>Nameskdlsdkfsdlkfjflsdk</p>
                            <p>$390.09</p>
                        </div>
                    </div>
                    <div class="mathing">
                        <div class="clearfix">
                            <div class="leftkey">Subtotal</div>
                            <div class="rightvalue">$234.09</div>
                        </div>
                        <div class="clearfix">
                            <div class="leftkey">Shipping</div>
                            <div class="rightvalue">Calculated at next step</div>
                        </div>
                    </div>
                    <div class="total-to-ca">
                        <div>
                                <div class="leftkey">Total</div>
                                <div class="rightvalue">$472.99</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="templates/script.jsp"></c:import>
    </body>

</html>

