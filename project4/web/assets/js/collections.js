     
        
        var app = angular.module('collections', []);
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