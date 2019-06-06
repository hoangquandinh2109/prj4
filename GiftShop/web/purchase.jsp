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
    <body onload="hidedangcap();" ng-app="cangcucot"  ng-controller="cart">
        <div class="wrap-page">
            <div class="container">
                <div class="main col-xs-7">
                    <h4>GiftStore</h4>
                    <div id="breadcum">
                        <a href="${pageContext.request.contextPath}/cart">Cart</a> <i class="fal fa-chevron-right"></i> 
                        <a id="bc-if" href="" class="bc-things">Information</a> <i class="fal fa-chevron-right"></i>  
                        <a id="bc-pm" href="" class="bc-things">Payment</a>
                    </div>
                    <!------------------------------------------------------------------------------------------------>
                    <!------------------------------------------------------------------------------------------------>
                    <!------------------------------------------------------------------------------------------------>
                    <div id="ship-N-pay" class="nrwsw bcpmst">
                        <div id="listinfo">
                            <div class="iIF">
                                <div class="ifo-iTF">
                                    <div class="tt-if">Contact</div>
                                    <div class="ct-if">${thisIsMe.cusEmail}</div>
                                </div>
                                <a href="">change</a>
                            </div>
                            <div class="iIF">
                                <div class="ifo-iTF">
                                    <div class="tt-if">Ship to</div>
                                    <div class="ct-if">${thisIsMe.cusAddress}</div>
                                </div>
                                <a href="">change</a>
                            </div>
                        </div>
                    </div>
                    <!------------------------------------------------------------------------------------------------>
                    <!------------------------------------------------------------------------------------------------>
                    <!------------------------------------------------------------------------------------------------>
                    <!------------------------------------------------------------------------------------------------>
                    <!------------------------------------------------------------------------------------------------>
                    <!------------------------------------------------------------------------------------------------>
                    <div id="onlyinfo" class="nrwsw bcifst">
                        <p id="title-up">Contact Information</p>
                        <div id="conInf-ca">
                            <div id="img-coninfca"><img src="${pageContext.request.contextPath}/img/blankava.png" alt=""></div>
                            <div id="ifo-conifi">
                                <p>${thisIsMe.cusName} (${thisIsMe.cusEmail}) </p>
                                <p><a href="${pageContext.request.contextPath}/logout">Log out</a></p>
                            </div>
                        </div>
                    </div>
                    <!------------------------------------------------------------------------------------------------>
                    <!------------------------------------------------------------------------------------------------>
                    <!------------------------------------------------------------------------------------------------>
                    <!------------------------------------------------------------------------------------------------>
                    <p id="title-down"></p>
                    <!------------------------------------------------------------------------------------------------>
                    <div id="inforthings" class="nrwsw bcifst">
                        <input type="text" placeholder="Name" value="${thisIsMe.cusName}">
                        <input type="text" placeholder="Address" value="${thisIsMe.cusAddress}">
                        <input type="text" placeholder="Phone" value="${thisIsMe.cusPhone}">
                    </div>
                    <!------------------------------------------------------------------------------------------------>
                    <!------------------------------------------------------------------------------------------------>
                    <div id="shiping-n-order-down" class="nrwsw bcpmst">
                        <div id="listradio">
                            <div class="it-rd">
                                <label for="rdd">
                                    <div class="noprice">
                                        <input type="radio" name="as" checked="" id="rdd">
                                        <div class="namemethod">COD</div>
                                    </div>
                                    <div class="price">$15.00</div>
                                </label>
                            </div>
                        </div>
                    </div>
                    <!------------------------------------------------------------------------------------------------>
                    <!------------------------------------------------------------------------------------------------>
                    <!------------------------------------------------------------------------------------------------>
                    <!------------------------------------------------------------------------------------------------>
                    <div class="navigator-purchase">
                        <a href="" id="backtoprev"><i class="fal fa-chevron-left"></i> <span></span></a>
                        <a id="nexttocontinue" href=""><span></span></a>
                    </div>
                </div>
                <div class="side-bar col-xs-5">
                    <div class="list-cart">
                        <div style="padding: 40px 0;
                            text-align: center; 
                            font-family: 'MerriweatherSans';
                            font-size: 21px; 
                            opacity: 0.5;" 
                            ng-if="numCart == 0">
                           no item
                       </div>
                        <div class="ci-pu" ng-repeat="ci in listCartItems">
                            <div>
                                <div class="imgcipu"><img src="${pageContext.request.contextPath}/productImage/{{ci.proImg}}" alt=""><span>{{numCart}}</span></div>
                                <p>{{ci.proName}}</p>
                            </div>
                            <p>{{"$"+ci.proPrice}}</p>
                        </div>
                    </div>
                    <div class="mathing">
                        <div class="clearfix">
                            <div class="leftkey">Subtotal</div>
                            <div class="rightvalue">{{"$"+subtotal}}</div>
                        </div>
                        <div class="clearfix">
                            <div class="leftkey">Shipping</div>
                            <div class="rightvalue" style="font-weight: normal">Free</div>
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
        <script>
            var page = "${thispage}";
            $(document).ready(function(){
                loadpage('${thispage}');
                $("#bc-if").click(function(){
                    event.preventDefault();
                    inforpage();
                    page = "information";
                });
                $("#bc-pm").click(function(){
                    event.preventDefault();
                    paymentpage();
                    page = "payment";
                });
                $("#nexttocontinue").click(function(){
                    event.preventDefault();
                    if(page == "information"){
                        page = "payment";
                        paymentpage();
                    } else{
                        //// place order code here
                        alert("pay");
                        $.ajax({
                            url: linkpage+"checkout",
                            method: 'POST',
                            data: {"payment":"payment"},
                            success: function(){
                                alert("okay");
                            },
                            error: function(){
                                alert("fail");
                            }
                        });
                    }
                });
                $("#backtoprev").click(function(){
                    event.preventDefault();
                    if(page == "information"){
                        location.replace(linkpage+"cart");
                    } else{
                        page = "information";
                        inforpage();
                    }
                });
            });
            function loadpage(d){
                if(d== "information"){
                    inforpage();
                }
                if(d== "payment"){
                    paymentpage();
                }
            }
            function inforpage(){
                $(".nrwsw").hide();
                $(".bcifst").show();
                $(".bc-things").removeClass("active");
                $("#bc-if").addClass("active");
                $("#title-down").text("Shipping Address");
                $("#backtoprev span").text("Return to Cart");
                $("#nexttocontinue span").text("Continue to Payment method");
            }
            function paymentpage(){
                $(".nrwsw").hide();
                $(".bcpmst").show();
                $(".bc-things").removeClass("active");
                $("#bc-pm").addClass("active");
                $("#title-down").text("Payment Method");
                $("#backtoprev span").text("Return to Shipping Information");
                $("#nexttocontinue span").text("Place Order");
            }
        </script>
    </body>

</html>

