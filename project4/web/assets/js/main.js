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
        $(this).removeClass("havemodal");
        $(".modal-form").remove();
        $("body").removeClass("square");
    });

    $('a.login-link').click(function(event) {
        event.preventDefault();
        $(".clickdetrove").addClass("havemodal");
        $("body").addClass("square");
        $(".modal-form").remove();
        $(".content").append("<div class=\"modal-form wow fadeInDownModal\"></div>");
        $(".modal-form").load("templates/login.html");
    });    
    $('a.create-acc-link').click(function(event) {
        event.preventDefault();
        $(".clickdetrove").addClass("havemodal");
        $("body").addClass("square");
        $(".modal-form").remove();
        $(".content").append("<div class=\"modal-form wow fadeInDownModal\"></div>");
        $(".modal-form").load("templates/register.html");
    });   

});

new WOW().init();
