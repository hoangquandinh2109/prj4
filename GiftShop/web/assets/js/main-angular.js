var app = angular.module('cangcucot', []);
 

//////////////////////////////////////////////////////////////////////////////////////Cart

    app.controller('cart', function($scope, $http){
    /////////////////////////////////////add to cart////////////////////////////////
    var self = $scope;
    var proId = $("#proID").text();
    showAllCartItems();
    $scope.proQuan=1;

    $scope.addThisToCart = function(id){
        console.log("proID: "+id+" proQuan: "+$scope.proQuan);
//        $http.get(linkpage+"cart?proID=&quatity")
//        .then(function(response) {
//            $scope.listCartItems = response.data.listCI;
//        });
        $.ajax({
            url: linkpage+"cart",
            method: "POST",
            data: {"proID":id,"quantity":$scope.proQuan},
            success: function(data){
                if(data!=""){
                  $(".clickdetrove").addClass("havemodal");
                    $("body").addClass("square");
                    $(".modal-form").remove();
                    $(".content").append("<div class=\"modal-form text-center fadeInDownMsg\">"+data+"</div>");
                    $(".modal-form").delay(4000).fadeOut(200);
                }
                $scope.proQuan = 1;
                showAllCartItems();
                
                $(".content").addClass("vao");
                $(".cart").addClass("ra");
            },
            error: function(){
                console.log("cannot add to cart at product detail page");
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
    
    
    /////////////////////////////////////updadte cart/////////////////////////////////
    $scope.updateQuantity = function(id, n){
       n=n.target.value;
        reSubTotal();
        if(n == ""){
        } else if(n>50){
            updateCartAjax(id,50);
            return 50;
        } else if(n<1){
            updateCartAjax(id,1);
            return 1;
        }else{
            updateCartAjax(id,n);
            return n;
        }
        
    }
    $scope.inc = function(id,n){
        reSubTotal();
        if(n==50){
            return 50;
        }else{
            updateCartAjax(id,n+1);
            return n+1;
        }
    }
    $scope.desc = function(id,n){
        reSubTotal();
       if(n==1){
            deleteCartItems(id);
        }else{
            updateCartAjax(id,n-1);
            return n-1;
        }
    }
    $scope.deleteItem = function(id){
        deleteCartItems(id);
    };
    /////////////////////////////////////update cart/////////////////////////////////
    
    
    
    /////////////////////////////////////list cart/////////////////////////////////
    $scope.listCartItems;
    /////////////////////////////////////list cart/////////////////////////////////
    
    
    
    
    /////////////////////////////////////function & ajax/////////////////////////////////
    function reSubTotal(){
        var subtotal = 0;
        for(var i = 0; i<$scope.listCartItems.length;i++){
           subtotal += $scope.listCartItems[i].proPrice*$scope.listCartItems[i].quantity;
        }
        $scope.subtotal = subtotal;
    }
    function showAllCartItems(){
        $http.get(linkpage+"cart?getJson=vip")///vip la ky tu bat ky
        .then(function(response) {
            $scope.listCartItems = response.data.listCI;
            $scope.subtotal = response.data.total;
            $scope.numCart = $scope.listCartItems.length;
        });
    }
    function updateCartAjax(id,quantity){
        $.ajax({
           url: linkpage+"cart?id="+id+"&quantity="+quantity,
           method: "PUT",
           success:function(){
               console.log("okay put update");
           },
           error: function(){
               console.log("error put");
           }
        });
    }
    function deleteCartItems(id){
        $.ajax({
           url: linkpage+"cart?id="+id,
           method: "DELETE",
           success:function(){
                showAllCartItems();
           },
           error: function(){
               console.log("error delete");
           }
        });
        
    }
    /////////////////////////////////////function ajax/////////////////////////////////
});


//////////////////////////////////////////////////////////////////////////////////////Search Suggestion
app.controller('suggest', function($scope, $http) {
    $http.get(linkpage+"autocomplete")
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
//    $("#search-input").focusout(function(){
//        $("#result-suggest").addClass("hide");
//    });
    $scope.suggest = function(n){
//        console.log(e);
        $scope.hide = false;
        $("#result-suggest").removeClass("hide");
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
//   $scope.minPrice = 0;
//    $scope.maxPrice = $("#maxPrice").text();
    var minPrice = 0;
    var maxPrice = $("#maxPrice").text();

  $("#min").text(minPrice);
    $("#max").text(maxPrice);
    
    $("#price-filter").slider({
        max: $("#maxPrice").text(), 
        range:true, 
        values:[0, $("#maxPrice").text()],
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
            ////filter to product list
        $('html, body').animate({
            scrollTop: $("#product-filter-element").offset().top
        }, 1000);
     });
   loadPage(1);
   
   
  
   
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
        $('html, body').animate({
            scrollTop: $("#product-filter-element").offset().top
        }, 1000);
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
       console.log("filtprice");
       return $http.get(linkpage+"api/product/"+nameColl+"/"+collVal+"/"+page+"?from="+minPrice+"&to="+maxPrice)
       .then(function(response) {
           $scope.listPro = response.data.listPro;
           
           $scope.numpage = response.data.numofpage;
           $scope.currPage = response.data.currPage;
       });
   }
   $scope.star = function (avg){
       if(avg == "null"){
           return {"width":"0%"}
       }
       return {
           "width" : (avg/5)*100+"%"
         }
   }
   $scope.classnumRev = function(numrv){
        if(numrv == 0.0 || numrv == "null"){
            return  "";
        }else{
            return "numrv";
        }
    }
    $scope.numRV = function(numrv){
        if(numrv == 0.0 || numrv == "null"){
            $scope.numRev = "";
            return "No review";
        }else{
            $scope.numRev = "numrv";
            return "("+numrv+")";
        }
    }
    /************************************************************************************************************************************************/
    /***************************WISHLIST*************************************************************************************************************/
    /************************************************************************************************************************************************/
    /************************************************************************************************************************************************/
    /*******/                                                                                              /*******/        
    $scope.addedClass = function(n){
        
        if(n){
            return "added";
        }
        return "";
    }
    var sessionid = $("#sessionid").val();
    $scope.btnWishlist = function(id,dfdf){
        
        if(sessionid != null && sessionid != ""){
            $.ajax({
                url: linkpage+"wishlist",
                method: 'POST',
                data: {"proID": id},
                success: function(){
//                    $(".clickdetrove").addClass("havemodal");
//                    $("body").addClass("square");
//                    $(".modal-form").remove();
//                    $(".content").append("<div class=\"modal-form text-center fadeInDownMsg\">This is added to you wishlist</div>");
//                    $(".modal-form").delay(2000).fadeOut(200);
//                    setTimeout(function(){
//                        $(".clickdetrove").css("opacity","0");
//                            setTimeout(function(){
//                            $(".clickdetrove").removeClass("havemodal");
//                            $("body").removeClass("square");
//                            $(".clickdetrove").removeAttr('style');
//                            },300);
//                    },2000);
                },
                error: function(){
//                    $(".clickdetrove").addClass("havemodal");
//                    $("body").addClass("square");
//                    $(".modal-form").remove();
//                    $(".content").append("<div class=\"modal-form text-center text-danger fadeInDownMsg\">This is removed from you wishlist</div>");
//                    $(".modal-form").delay(2000).fadeOut(200);
//                    setTimeout(function(){
//                        $(".clickdetrove").css("opacity","0");
//                            setTimeout(function(){
//                            $(".clickdetrove").removeClass("havemodal");
//                            $("body").removeClass("square");
//                            $(".clickdetrove").removeAttr('style');
//                            },300);
//                    },2000);
                }
            });
            return !dfdf;
        } else{
            $(".clickdetrove").addClass("havemodal");
            $("body").addClass("square");
            $(".modal-form").remove();
            $(".content").append("<div class=\"modal-form fadeInDownMsg\"></div>");
            $(".modal-form").load(linkpage+"templates/login.html");
            return dfdf;
        }
    }                     
    function fadeMsgDown(msg){
    }
    /************************************************************************************************************************************************/
    /************************************************************************************************************************************************/
    /************************************************************************************************************************************************/
    /************************************************************************************************************************************************/
    
    
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








