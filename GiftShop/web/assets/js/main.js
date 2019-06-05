   function filterwishlist(t){
        if(!t){
            $(".clickdetrove").addClass("havemodal");
            $("body").addClass("square");
            $(".modal-form").remove();
            $(".content").append("<div class=\"modal-form fadeInDownMsg\"></div>");
            $(".modal-form").load(linkpage+"templates/login.html");
            return false;
        } 
        return true;
    }
var linkpage = "/GiftShop/";
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
        $(".content").append("<div class=\"modal-form fadeInDownMsg\"></div>");
        $(".modal-form").load(linkpage+"templates/login.html");
    });    
    $('a.create-acc-link').click(function(event) {
        event.preventDefault();
        $(".clickdetrove").addClass("havemodal");
        $("body").addClass("square");
        $(".modal-form").remove();
        $(".content").append("<div class=\"modal-form fadeInDownMsg\"></div>");
        $(".modal-form").load(linkpage+"templates/register.html");
    });   


    $('.cart-quantity > input').on('keyup', function(e){
           console.log(e)
        if ($(this).val() < 1 
            && e.keyCode !== 46 // keycode for delete
            && e.keyCode !== 8 // keycode for backspace
            && e.target.value < 1
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
        window.history.pushState("Details", "Title", linkpage+"account/dashboard");
        document.title= "Dashboard - "+usernamess;
    });
    $('#account, a#pen-edit').click(function(){
        event.preventDefault();
        $("#switcher>div").removeClass("active");
        $(this).addClass("active");
        $(".everyblock").hide();
        $("#showaccount").show();
        $("#address-need-fc").focus();
        $("#address-need-fc").val($("#myaddress").val());
        $("#phone-need-fc").val($("#myphone").val());
        window.history.pushState("Details", "Title", linkpage+"account/info");
        document.title= "Account - "+usernamess;
    });
    $('#wishlist').click(function(){
        $("#switcher>div").removeClass("active");
        $(this).addClass("active");
        $(".everyblock").hide();
        $("#showwishlist").show();
        window.history.pushState("Details", "Title", linkpage+"account/wishlist");
        document.title= "Wishlist - "+usernamess;
    });
    $('#orders').click(function(){
        $("#switcher>div").removeClass("active");
        $(this).addClass("active");
        $(".everyblock").hide();
        $("#order-detail").hide();
        $("#orderslist").show();
        $("#showorders").show();
        window.history.pushState("Details", "Title", linkpage+"account/orders");
        document.title= "Orders - "+usernamess;
    });
    var tabname = $("#tabname").val();
    var usernamess = $("#usernamess").val();
    switch (tabname) {
        case "orders":
            $("#switcher>div").removeClass("active");
            $('#orders').addClass("active");
            $(".everyblock").hide();
            $("#order-detail").hide();
            $("#orderslist").show();
            $("#showorders").show();
            break;
        case "orderdetail":
            $("#switcher>div").removeClass("active");
            $('#orders').addClass("active");
            $(".everyblock").hide();
            $("#orderslist").hide();
            $("#order-detail").show();
            $("#showorders").show();
            break;
        case "wishlist":
            $("#switcher>div").removeClass("active");
            $('#wishlist').addClass("active");
            $(".everyblock").hide();
            $("#showwishlist").show();
            break;
        case "dashboard":
            $("#switcher>div").removeClass("active");
            $('#dashboard').addClass("active");
            $(".everyblock").hide();
            $("#showdashboard").show();
            break;
        case "info":
            $("#switcher>div").removeClass("active");
            $('#account').addClass("active");
            $(".everyblock").hide();
            $("#showaccount").show();
            $("#address-need-fc").focus();
            $("#address-need-fc").val($("#myaddress").val());
            $("#phone-need-fc").val($("#myphone").val());
            break;
    }  
    
    $(".button-remove").click(function(){
        event.preventDefault();
        var val = $(this).text(); 
        if(val == "View"){
            $("#orderslist").hide();
            $("#order-detail").show();
            $("html, body").scrollTop(0);
            window.history.pushState("Details", "Title", linkpage+"account/orders/detail");
            document.title= "#20190205392 - "+usernamess;
        }
    });//temp view bip
    
    ///////////////////////////////////////////////////////////////////////////////////////////////account

  
    
    
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