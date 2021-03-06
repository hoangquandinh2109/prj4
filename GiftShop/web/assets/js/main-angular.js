var app = angular.module('cangcucot', ['ngMaterial']);
app.controller('homepagination', function($scope, $http){
    $scope.numrow = 3;
    $scope.currpage = 1;
//    $scope.numpage = 1;
    loadPro();
    
    function loadPage(n){
        $scope.listPagePro = [];
        var skipP = 12 * (n-1);
        var bien = "";
        for(var index = skipP; index <skipP+12; index++){
            if($scope.listProd[index]){
                $scope.listPagePro.push($scope.listProd[index]);
            }
        }
        
    }
    function loadPro(){
       return $http.get(linkpage+"api/featureproduct")
       .then(function(response) {
           $scope.listProd = response.data;
            var numpage =0;
           for(var id = 0; id < response.data.length ; id++){
               if((id+1) % 12 == 0){
                   numpage++;
               }
           }
           if(id % 12 > 0 || id % 12 < 12) numpage++;
           $scope.numpage = numpage;
           loadPage(1);
       });
   }
   $scope.switchpage = function(n){
       $scope.currpage = n;
       loadPage(n);
       $('html, body').animate({
            scrollTop: $("#featureproduct-title").offset().top
        }, 1000);
   }
   $scope.active = function(n){
        if(n == $scope.currpage) {
            return "active";
        } else {
            return "";
        }
    }
   $scope.range = function(min, max, step) {
       step = step || 1;
       var input = [];
       for (var i = min; i <= max; i += step) {
           input.push(i);
       }
       return input;
   };
   $scope.productRow = function(n){
       var skiprow = 4 * (n-1);
       var list = [];
       var countitemrow = 0;
       var numPro = 0;
       for (var i = 1; i<= $scope.listPagePro.length; i++){
           numPro++;
           if(i>skiprow){
               if(countitemrow < 4){
                   list.push($scope.listPagePro[i-1]);
                   countitemrow++;
               }
           }
       }
       $scope.numPro = numPro;
       return list;
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
            return "No review";
        }else{
            return "("+numrv+")";
        }
    }
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
app.controller('vippro', DemoCtrl);
function DemoCtrl ($timeout, $q, $log, $http) {
    var self = this;

    self.simulateQuery = false;
    self.isDisabled    = false;

    
    $http.get(linkpage+"autocomplete")
    .then(function(response) {
        self.repos = loadAll(response.data);
    });

    
    self.querySearch   = querySearch;
    self.selectedItemChange = selectedItemChange;
    self.searchTextChange   = searchTextChange;

    function querySearch (query) {
      var results = query ? self.repos.filter(createFilterFor(query)) : self.repos,
          deferred;
          var top5results = [];
          var ii = 0;
          for(var index=0; index < results.length; index++){
              if(ii<5){
                top5results.push(results[index]);
              }
              ii++;
          }
        return top5results;
//      if (self.simulateQuery) {
//        deferred = $q.defer();
//        $timeout(function () { deferred.resolve(results); }, Math.random() * 1000, false);
//        return deferred.promise;
//      } else {
//      }
    }

    function searchTextChange(text) {
      $log.info('Text changed to ' + text);
    }

    function selectedItemChange(item) {
      location.replace(item.proURL);
      $log.info('Item changed to ' + JSON.stringify(item));
    }
    
    
    
    
    
    function loadAll(vip) {
      var repos = vip;
      
      return repos.map(function (repo) {
        repo.value = repo.proName.toLowerCase();
        return repo;
      });
    }

    /**
     * Create filter function for a query string
     */
    function createFilterFor(query) {
      var lowercaseQuery = query.toLowerCase();

      return function filterFn(item) {
        return (item.value.includes(lowercaseQuery));
      };

    }
  }
//////////////////////////////////////////////////////////////////////////////////////Cart

    app.controller('cart', function($scope, $http){
    /////////////////////////////////////add to cart////////////////////////////////
    var self = $scope;
    var proId = $("#proID").text();
    showAllCartItems();
    $scope.proQuan=1;
    
    $scope.sessionid=$("#sessionid").val();
    
    
    
     $scope.checkout = function(sessionid, numCart){
         if(sessionid) {
             if(numCart==0){
                modalMsg("<span class=\"text-danger\">No product in your cart!</span>");
             }else{
                 location.replace(linkpage+"checkout");
             }
         } else{
             modalLogin();
         }
             
     }

    $scope.addThisToCart = function(id){
        console.log("proID: "+id+" proQuan: "+$scope.proQuan);
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
    $scope.inc = function(id,n,p){
        if(n==50){
            return 50;
        }else{
            $scope.subtotal += p;
            updateCartAjax(id,n+1);
            return n+1;
        }
    }
    $scope.desc = function(id,n,p){
       if(n==1){
            deleteCartItems(id);
        }else{
            $scope.subtotal -= p;
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


 /************************************************************************************************************************************************/
    /***************************WISHLIST*************************************************************************************************************/
    /************************************************************************************************************************************************/
    /************************************************************************************************************************************************/
    /*******/ 
    /*******/   
app.controller('wishlist', function($scope, $http) {
    $scope.addedClass = function(n){
        
        if(n){
            return "added";
        }
        return "";
    }
    var sessionid = $("#sessionid").val();
    $scope.onW = ($("#onW").text() == "true");
    $scope.namingWBtn = function(onW){
        if(!onW){
            return "Add to Wishlist";
        }else{
            return "Remove from Wishlist"
        }
    }
    var itemtaghtml;
    $scope.btnWishlist = function(id,dfdf){
        
            
        
        if(sessionid != null && sessionid != ""){
            for(var idd=0; idd<6; idd++){
                if(event.path[idd].className.includes("product-item")){
                    itemtaghtml = $(event.path[idd]);

                }

            }
            $.ajax({
                url: linkpage+"wishlist",
                method: 'POST',
                data: {"proID": id},
                success: function(){
                     itemtaghtml.find(".image-product").find(".notificate-product").remove();
                    itemtaghtml.find(".image-product").append("<div class=\"notificate-product fadeIn animated\">Added to wishlist</div>");
                    setTimeout(function (){
                        $(".notificate-product").remove();
                    },1500);
                },
                error: function(){
                     itemtaghtml.find(".image-product").find(".notificate-product").remove();
                    itemtaghtml.find(".image-product").append("<div class=\"notificate-product fadeIn animated\">Removed from wishlist</div>");
                    setTimeout(function (){
                        $(".notificate-product").remove();
                    },1500);
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
});    
    /************************************************************************************************************************************************/
    /************************************************************************************************************************************************/
    /************************************************************************************************************************************************/
    /************************************************************************************************************************************************/
    





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
    maxPrice = Math.round(maxPrice);

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
     $scope.listType = [];
     $scope.listFiltType = [];
   $scope.check = function(n, e){
       var idofthis = $scope.listFiltType.indexOf(n);
       if(idofthis === -1){
           $scope.listFiltType.push(n);
           $(e.target).addClass("active");
       } else{
           $scope.listFiltType.splice(idofthis, 1);
           $(e.target).removeClass("active");
       }
       $http.get(linkpage+"api/product/"+nameColl+"/"+collVal)
       .then(function(response) {
           var lP = [];
           $.each(response.data.listPro,function(i,per){
                if($scope.listFiltType.indexOf(per.type) !== -1){
                    lP.push(per);
                }
            });
            $scope.listPro = lP;
       });
   }
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
       console.log(linkpage+"api/product/"+nameColl+"/"+collVal+"/"+page);
       return $http.get(linkpage+"api/product/"+nameColl+"/"+collVal+"/"+page)
       .then(function(response) {
           $scope.listPro = response.data.listPro;
           
           $scope.numpage = response.data.numofpage;
           $scope.currPage = response.data.currPage;
           $.each(response.data.listPro, function(id, lP){
               if($scope.listType.indexOf(lP.type) === -1){
                   $scope.listType.push(lP.type);
               }
           });
           console.log($scope.listType);
       });
   }
   function filtbyprice(page){
       console.log("filtprice");
       console.log(linkpage+"api/product/"+nameColl+"/"+collVal+"/"+page+"?from="+minPrice+"&to="+maxPrice);
       return $http.get(linkpage+"api/product/"+nameColl+"/"+collVal+"/"+page+"?from="+minPrice+"&to="+maxPrice)
       .then(function(response) {
           if($scope.listFiltType.length < 1){
               $scope.listPro = response.data.listPro;
           }else{
                var lP = [];
                $.each(response.data.listPro,function(i,per){
                     if($scope.listFiltType.indexOf(per.type) !== -1){
                         lP.push(per);
                     }
                 });
                 $scope.listPro = lP;
           }
           
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
            return "No review";
        }else{
            return "("+numrv+")";
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
                    window.history.pushState("Details", "Title", linkpage+"product/"+link+"/page/"+n);
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








