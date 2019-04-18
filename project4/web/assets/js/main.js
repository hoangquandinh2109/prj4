$(document).ready(function(){
    $(".btn-addtocart").click(function(){
//        alert("mua gì");
        $(".content").addClass("vao");
        $(".cart").addClass("ra");
    });
    $(".btn-love").click(function(){
        alert("yêu thương mẹ gì");
    });
    $(".clickdetrove").click(function(){
        $(".content").removeClass("vao");
        $(".cart").removeClass("ra");
    });
});