 var app = angular.module('cangcucot', []);
 

//////////////////////////////////////////////////////////////////////////////////////Cart

app.controller('cart', function($scope, $http){
    /////////////////////////////////////add to cart/////////////////////////////////
    var self = $scope;
    var proId = $("#proID").text();
    $scope.proQuan=1;
    $scope.addThisToCart = function(id){
        console.log("proID: "+id+" proQuan: "+$scope.proQuan);
        $.ajax({
            url: linkpage+"cart",
            method: "GET",
            data: {"proID":id,"quantity":$scope.proQuan},
            success: function(){
                alert("ok");
            },
            error: function(){
                alert("not ok");
            }
        });
    }
    $scope.incQuanP = function(){
        $scope.proQuan = ($scope.proQuan == 50)?50:$scope.proQuan+1;
    }
    $scope.descQuanP = function(){
        $scope.proQuan = ($scope.proQuan == 1)?1:$scope.proQuan-1;
    }
    /////////////////////////////////////add to cart/////////////////////////////////
    
    
    
    
    /////////////////////////////////////list cart/////////////////////////////////
    $scope.listCartItems;
    /////////////////////////////////////list cart/////////////////////////////////
    
    
    
    
    /////////////////////////////////////function ajax/////////////////////////////////
    function showAllCartItems(){
        $http.get(linkpage+"cart")
        .then(function(response) {
            $scope.listCartItems = response.data.listCI;
        });
    }
    function updateCart(){
        
    }
    function deleteCartItems(){
        
    }
    /////////////////////////////////////function ajax/////////////////////////////////
});


//////////////////////////////////////////////////////////////////////////////////////Search Suggestion

app.controller('suggest', function($scope, $http) {
    $http.get(linkpage+"abc")
    .then(function(response) {
        $scope.listName = response.data.listName;
    });
    $scope.inputkeyup = function(n){
        if(n.keyCode == 38 || n.keyCode == 40){
            n.preventDefault();
        }else{
            $scope.suggest(n.target.value);
        }
    }
    $scope.suggest = function(n){
//        console.log(e);
        $scope.hide = false;
        $scope.listSuggest = [];
        var count = 0;
        $.each($scope.listName,function(index){
            if(n != "" && n != " "){
                if($scope.listName[index].proName.toLowerCase().includes(n.toLowerCase())){
                    if(count<5){
                        $scope.listSuggest.push($scope.listName[index].proName);
                        count++;
                    }
                }
            }
        });
    }
    $scope.auto = function(n){
        $scope.mysearch = n;
        $scope.hide = true;
    }
});


//////////////////////////////////////////////////////////////////////////////////////Filter Pagination
 
app.controller('proPagination', function($scope, $http) {
   $scope.numpage = 0;
   $scope.numrow = 3;
   var loc = 0; //loc hay chua
   var collVal = $("#collVal").text();
   var nameColl = $("#nameColl").text();
   $scope.minPrice = 0;
    $scope.maxPrice = 1000;
    
    var minPrice = 100;
    var maxPrice = 300;

  $("#min").text(minPrice);
    $("#max").text(maxPrice);
    
    $("#price-filter").slider({
        max: 500, 
        range:true, 
        values:[100, 300],
        slide: function( event, ui ) {
            minPrice= ui.values[0];
            maxPrice= ui.values[1];

            $("#min").text(minPrice);
            $("#max").text(maxPrice);
        }
    });
    $("#button-n-number>button").click(function (){
        filtbyprice(1);
        loc = 1;
     });
   loadPage(1);
   
   
  
   
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
       if(loc == 1){
           filtbyprice(n);
       }else{
            loadPage(n);
        }
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
   function filtbyprice(page){
       return $http.get(linkpage+"api/product/"+nameColl+"/"+collVal+"/"+page+"?from="+minPrice+"&to="+maxPrice)
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

//////////////////////////////////////////////////////////////////////////////////////////Collection pagination
app.controller('pagination', function($scope, $http) {
            var crrPage = $("#crrPage").text();
            var link = $("#linkvip").text();
            
            function getColl(page){
                return $http.get(linkpage+"product/"+link+"/api/"+page)
                .then(function(response) {
                    $scope.pagenum = response.data.pagenum;
                    $scope.currPage = response.data.currPage;
                    $scope.listCo = response.data.listCo;
                });
            }
            getColl(crrPage);
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
                getColl(n).then(function(){
                    window.history.pushState("Details", "Title", linkpage+"product/type/page/"+n);
                });
            }
            $scope.disableleft = function(){
                if(1 == $scope.currPage) {
                    return true;
                } else {
                    return false;
                }
            }
            $scope.disableright = function(n){
                if($scope.pagenum == $scope.currPage) {
                    return true;
                } else {
                    return false;
                }
            }
        }); 








