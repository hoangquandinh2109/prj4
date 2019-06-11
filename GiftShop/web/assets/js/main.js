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
function hidedangcap(){
    $("#dangcap").hide();
    $('body').removeClass("square");
}
$(document).ready(function(){ 
    ///thong bao
    
    $('#btn-bell > a').click(function(){
        event.preventDefault();
        $('#btn-bell').removeClass('unseen');
        $('#hopvip').show();
        $("body").addClass("square");
        $('.clickdetrove').addClass('havenotification');
    });
    
    
    $(".showcartajax").click(function(){
        event.preventDefault();
        showcartajax();
    });
    $(".clickdetrove").click(function(){
        $(".content").removeClass("vao");
        $(".cart").removeClass("ra");
        $(this).removeClass("havemodal");
        $(this).removeClass("havenotification");
        $(".modal-form").remove();
        $("body").removeClass("square");
        $('#hopvip').hide();
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

function modalLogin(){
    $(".clickdetrove").addClass("havemodal");
    $("body").addClass("square");
    $(".modal-form").remove();
    $(".content").append("<div class=\"modal-form fadeInDownMsg\"></div>");
    $(".modal-form").load(linkpage+"templates/login.html");
}
function modalMsg(text){
    $(".clickdetrove").addClass("havemodal");
    $("body").addClass("square");
    $(".modal-form").remove();
    $(".content").append("<div class=\"modal-form text-center fadeInDownMsg\">"+text+"</div>");
}