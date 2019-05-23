var linkpage = "http://localhost:8080/project4/";
$(document).ready(function(){
    $(".addtocart").click(function(){
//        alert("mua gì");
        event.preventDefault();
        showcartajax();
    });
    $(".showcartajax").click(function(){
//        alert("mua gì");
        event.preventDefault();
        showcartajax();
    });
    $(".btn-love").click(function(){
        event.preventDefault();
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
        $(".modal-form").load(linkpage+"templates/login.html");
    });    
    $('a.create-acc-link').click(function(event) {
        event.preventDefault();
        $(".clickdetrove").addClass("havemodal");
        $("body").addClass("square");
        $(".modal-form").remove();
        $(".content").append("<div class=\"modal-form wow fadeInDownModal\"></div>");
        $(".modal-form").load(linkpage+"templates/register.html");
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

function showcartajax(){
    $(".content").addClass("vao");
    $(".cart").addClass("ra");
}