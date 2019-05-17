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


    $('.cart-quantity > input').on('keydown keyup', function(e){
        if ($(this).val() < 1 
            && e.keyCode !== 46 // keycode for delete
            && e.keyCode !== 8 // keycode for backspace
           ) {
           e.preventDefault();
           $(this).val(1);
           $(this).change();
        }
        if ($(this).val() > 50 
            && e.keyCode !== 46 // keycode for delete
            && e.keyCode !== 8 // keycode for backspace
           ) {
           e.preventDefault();
           $(this).val(50);
           $(this).change();
        }
    });

});

new WOW().init();
