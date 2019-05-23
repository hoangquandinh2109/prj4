 var product = angular.module('product', []);
 
product.controller('proPagination', function($scope, $http) {
   $scope.numpage = 0;
   var collVal = $("#collVal").text();
   var nameColl = $("#nameColl").text();
   loadPage(1);
  
   
   $scope.numrow = 3;
   $scope.addtocart = function(){
       showcartajax();
   }
   $scope.productRow = function(n){
       var skiprow = 4 * (n-1);
       var list = [];
       var countitemrow = 0;
       for (var i = 1; i<= $scope.listPro.length; i++){
           if(i>skiprow){
               if(countitemrow < 4){
                   list.push($scope.listPro[i-1]);
                   countitemrow++;
               }
           }
       }
       return list;
   }
   $scope.currPage = 1;
   
   $scope.range = function(min, max, step) {
       step = step || 1;
       var input = [];
       for (var i = min; i <= max; i += step) {
           input.push(i);
       }
       return input;
   };
   $scope.active = function(n){
       if(n == $scope.currPage) {
           return "active";
       } else {
           return "";
       }
   }
   $scope.switchpage = function(n){
       loadPage(n);
       console.log($scope.listPro.length);
   }
   $scope.disableleft = function(){
       if(1 == $scope.currPage) {
           return true;
       } else {
           return false;
       }
   }
   $scope.disableright = function(n){
       if($scope.numpage == $scope.currPage) {
           return true;
       } else {
           return false;
       }
   }
   function loadPage(page){
       return $http.get(linkpage+"api/product/"+nameColl+"/"+collVal+"/"+page)
       .then(function(response) {
           $scope.listPro = response.data.listPro;
           $scope.numpage = response.data.numofpage;
           $scope.currPage = response.data.currPage;
       });
   }
   $scope.star = function (avg){
       return {
           "width" : (avg/5)*100+"%"
         }
   }
}); 

$(document).ready(function(){
    $("#info").click(function(){
        event.preventDefault();
        $(".button-tab>li").removeClass("active");
        $(this).parent().addClass("active");
        $(".tabs").hide();
        $("#infoTab").show();
    });
    $("#faq").click(function(){
        event.preventDefault();
        $(".button-tab>li").removeClass("active");
        $(this).parent().addClass("active");
        $(".tabs").hide();
        $("#faqTab").show();
    });
    $("#review").click(function(){
        event.preventDefault();
        $(".button-tab>li").removeClass("active");
        $(this).parent().addClass("active");
        $(".tabs").hide();
        $("#reviewTab").show();
    });
    $("#comment").click(function(){
        event.preventDefault();
        $(".button-tab>li").removeClass("active");
        $(this).parent().addClass("active");
        $(".tabs").hide();
        $("#commentTab").show();
    });
});