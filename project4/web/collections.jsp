<%-- 
    Document   : collections
    Created on : May 20, 2019, 8:22:07 PM
    Author     : johnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <c:import url="templates/head.jsp"></c:import>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/collections.css">
</head>

<body ng-app="cangcucot">
    <div class="content-n-cart clearfix">
        <div class="content">
            <div class="clickdetrove"></div>
            <c:import url="templates/header.jsp"></c:import>
            <div class="web-body" ng-controller="pagination" >
                <div class="container">
                    <!--codehere-->
                    <h3 id="h3name" class="text-center">${h3name}</h3>
                    <div class="row">
                        <div ng-repeat="co in listCo" class="wow fadeIn col-xs-12 col-md-4 col-sm-4">
                            <div class="collection-grid-item">
                                <div class="collection-image">
                                    <a href="${pageContext.request.contextPath}/product/${link}/{{co.coID}}" class="collection-grid-item__link">
                                        <img class="collection-grid-item__overlay image-more-hover"
                                            src="//cdn.shopify.com/s/files/1/2334/1307/collections/list_collection_default_2f07e954-6fe9-4cde-9d52-4c2ce7fa7d58_450x450_crop_top.png"
                                            alt="ap nextstorev2">
                                    </a>
                                </div>
                                <div class="collection-grid-item__title-wrapper text-center">
                                    <h3 class="collection-grid-item__title">
                                        <a href="${pageContext.request.contextPath}/product/${link}/{{co.coID}}">{{co.coName}}</a>
                                    </h3>
                                    <span class="count_items">11 Items</span>
                                    <div class="">
                                        <a class="btn button-collections" href="${pageContext.request.contextPath}/product/${link}/{{co.coID}}">
                                            Shop the collection
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center">
                        <div id="pagination" class="clearfix">
                            <ul class="pagination">
                                <li ng-if='!disableleft()'>
                                    <a ng-click="switchpage(currPage-1)" title="« Previous">
                                        <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                    </a>
                                </li>
                                <li ng-repeat="n in range(1,pagenum)" ng-class="active(n)">
                                    <a ng-click="switchpage(n)" ng-if="active(n) != 'active'" href="">{{n}}</a>
                                    <span ng-if="active(n) == 'active'" >{{n}}</span>
                                </li>
                                <li ng-if='!disableright()'>
                                    <a ng-click="switchpage(currPage+1)" title="« Previous">
                                        <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--codehere-->
                </div>
            </div>
            <c:import url="templates/footer.jsp"></c:import>
        </div>
        <c:import url="templates/cart-modal.jsp"></c:import>
    </div>
    <span id='crrPage' style='display: none;'>${currPage}</span>
    <span id='linkvip' style='display: none;'>${link}</span>
        
    <c:import url="templates/script.jsp"></c:import>
<!--    <script src="${pageContext.request.contextPath}/assets/library/angularjs/angular.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/collections.js"></script>-->
</body>

</html>