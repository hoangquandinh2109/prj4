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
    <body class="square" onload="hidedangcap();" ng-app="cangcucot"  ng-controller="cart">
        <input type="hidden" value="${sessionScope.sessionid}" id="sessionid">
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
                                    <div class="ct-if" id='ftname'></div>
                                </div>
                                <a class='cbt' href="">change</a>
                            </div>
                            <div class="iIF">
                                <div class="ifo-iTF">
                                    <div class="tt-if">Ship to</div>
                                    <div class="ct-if" id='ftaddress'></div>
                                </div>
                                <a class='cbt' href="">change</a>
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
                        <input id="ifname" type="text" placeholder="Name" value="${thisIsMe.cusName}">
                        <input id="ifaddress" type="text" placeholder="Address" value="${thisIsMe.cusAddress}">
                        <input id="ifphone" type="text" placeholder="Phone" value="${thisIsMe.cusPhone}">
                        <textarea id="ifnote" placeholder="Notes"></textarea>
                    </div>
                    <!------------------------------------------------------------------------------------------------>
                    <!------------------------------------------------------------------------------------------------>
                    <div id="shiping-n-order-down" class="nrwsw bcpmst">
                        <div id="listradio">
                            <div class="it-rd">
                                <label for="rdd">
                                    <div class="noprice">
                                        <input type="radio" name="ifmethod" checked="" value="COD"  id="rdd">
                                        <div class="namemethod">COD</div>
                                    </div>
                                    <div class="price">Free</div>
                                </label>
                            </div>
                            <div class="it-rd">
                                <label for="rdf">
                                    <div class="noprice">
                                        <input type="radio" name="ifmethod" checked="" value="Bank Transfer"  id="rdf">
                                        <div class="namemethod">Bank Transfer</div>
                                    </div>
                                    <div class="price">Free</div>
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
                    <div id="blc">
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
                                    <div class="imgcipu"><img src="${pageContext.request.contextPath}/productImage/{{ci.proImg}}" alt=""><span>{{ci.quantity}}</span></div>
                                    <p>{{ci.proName}}</p>
                                </div>
                                <p>{{"$"+(ci.proPrice*ci.quantity).toFixed(2)}}</p>
                            </div>
                        </div>
                    </div>
                    <div class="mathing">
                        <div class="clearfix">
                            <div class="leftkey">Subtotal</div>
                            <div class="rightvalue" id='bindsubtotal'>{{"$"+subtotal.toFixed(2)}}</div>
                        </div>
                        <div class="clearfix">
                            <div class="leftkey">Shipping</div>
                            <div class="rightvalue" style="font-weight: normal">Free</div>
                        </div>
                    </div>
                    <div class="total-to-ca">
                        <div>
                                <div class="leftkey">Total</div>
                                <div class="rightvalue" id="bindtotal">{{"$"+subtotal.toFixed(2)}}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="templates/script.jsp"></c:import>
        <script>
            var page = "${thispage}";
            var wenttopayment = 0;
            var edited = 0;
            $(document).ready(function(){
                loadpage('${thispage}');
                $("#bc-if").click(function(){
                    event.preventDefault();
                    inforpage();
                    page = "information";
                });
                $("#bc-pm").click(function(){
                    event.preventDefault();
                    if(wenttopayment == 1 && edited==0){
                        paymentpage();
                        page = "payment";
                    }
                });
                $('.cbt').click(function(){
                    event.preventDefault();
                    page = "information";
                    inforpage();
                });
                $('input, textarea').focusin(function(){
                    edited = 1;
                });
                $("#nexttocontinue").click(function(){
                    event.preventDefault();
                    
                    var name = $("#ifname").val();
                    var phone = $("#ifphone").val();
                    var address = $("#ifaddress").val();
                    var method = $("input[name='ifmethod']:checked").val();
                    console.log(method);
                    var note = $("#ifnote").val();
                    
                    if(page == "information"){
                        if(validate(phone, name, address)){
                            page = "payment";
                            wenttopayment = 1;
                            $('#ftname').text(name);
                            $('#ftaddress').text(address);
                            paymentpage();
                        }
                    } else{
                        //// place order code here
                        
                            $.ajax({
                                url: linkpage+"checkout",
                                method: 'POST',
                                data: {
                                    "payment":"payment",
                                    "name":name,
                                    "phone":phone,
                                    "address":address,
                                    "method":method,
                                    "note":note
                                },
                                success: function(){
                                    alert("Thank for buying this");
                                    location.replace(linkpage);
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
            function validate(phone, name, address){
                $('.varError-form').remove(); 
                var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
                var error = 0 ;
                if(phone.trim() == ""){
                    $("#ifphone").after("<span class=\"varError-form\" style=\"color: red; \">This field can't be empty!</span>");
                    error++;
                }
                if(name.trim() == ""){
                    $("#ifname").after("<span class=\"varError-form\" style=\"color: red; \">This field can't be empty!</span>");
                    error++;
                }
                if(address.trim() == ""){
                    $("#ifaddress").after("<span class=\"varError-form\" style=\"color: red; \">This field can't be empty!</span>");
                    error++;
                }
                if(error == 0){
                    if(!vnf_regex.test(phone)){
                        console.log("phone not ok");
                        $("#ifphone").after("<span class=\"varError-form\" style=\"color: red; \">Your Phonenumber is not supported!</span>");
                        return false;
                    }
                }else{
                    return false;
                }
                return true;

            }
        </script>
    </body>

</html>

