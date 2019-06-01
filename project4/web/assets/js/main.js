var linkpage = "/project4/";
$(document).ready(function(){
    $(".addtocart").click(function(){
        alert("mua gì");
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


    $('.cart-quantity > input').on('keyup', function(e){
        if ($(this).val() < 1 
            && e.keyCode !== 46 // keycode for delete
            && e.keyCode !== 8 // keycode for backspace
            && e.target.value < 1
           ) {
           e.preventDefault();
           console.log(e)
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
//////////////////////////////////////////////////////////////////////////////////////Jquery product detail

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
    ///////////////////////////////////////////////////////////////////////////////////////////////account
    $('#dashboard').click(function(){
        $("#switcher>div").removeClass("active");
        $(this).addClass("active");
        $(".everyblock").hide();
        $("#showdashboard").show();
    });
    $('#account').click(function(){
        $("#switcher>div").removeClass("active");
        $(this).addClass("active");
        $(".everyblock").hide();
        $("#showaccount").show();
    });
    $('#wishlist').click(function(){
        $("#switcher>div").removeClass("active");
        $(this).addClass("active");
        $(".everyblock").hide();
        $("#showwishlist").show();
    });
    $('#orders').click(function(){
        $("#switcher>div").removeClass("active");
        $(this).addClass("active");
        $(".everyblock").hide();
        $("#order-detail").hide();
        $("#orderslist").show();
        $("#showorders").show();
    });
    ///////////////////////////////////////////////////////////////////////////////////////////////account

    $(".button-remove").click(function(){
        event.preventDefault();
        var val = $(this).text(); 
        if(val == "View"){
            $("#orderslist").hide();
            $("#order-detail").show();
            $("html, body").scrollTop(0);
        }
    });//temp view bip
    
    
    
    $(window).scroll(function() {
        var $height = $(window).scrollTop();
        if($height > 1000) {
                $("#abcxyz").addClass("hienlen");
        } else {
                $("#abcxyz").removeClass("hienlen");
        }
    });



    $("#abcxyz").click(function(){
        $("html, body").animate({ scrollTop: 0 }, "slow");
    });
    var thistext = $("#product-filter-element").data("thistext").split(" ");
    var therest = "<span> ";
    for(var ii = 1; ii<thistext.length;ii++){
        therest += thistext[ii]+" ";
    }
    therest += "</span>";
    $("#product-filter-element").text(thistext[0]);
    $("#product-filter-element").append(therest);
});

new WOW().init();

function showcartajax(){
    $(".content").addClass("vao");
    $(".cart").addClass("ra");
}