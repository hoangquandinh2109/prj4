var error = 0;
$(document).ready(function() {
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
    
    
    
    
    $(".btn").click(function() {
        error = 0;
        event.preventDefault();
        var action = $(this).text();
        if (action == "Update") {
            var address = $("#address-need-fc").val();
            var phone = $("#phone-need-fc").val();

            validatePhone(phone);

            if (error == 0) {
                $.ajax({
                    url: linkpage + "account",
                    method: 'POST',
                    data: {"action": "updateinfo", "address": address, "phone": phone},
                    success: function() {
                        alert("update info success");
                        location.reload();
                    },
                    error: function() {
                        alert("error");
                    }
                });
            }

        }
        if (action == "Change") {
            var op = $("#oldpass").val();
            var np = $("#newpass").val();
            var rnp = $("#renewpass").val();

            if (op == "" || np == "" || rnp == "") {
                error = 1;
                $("#renewpass").next('.error-form').remove();
                $("#renewpass").after("<span class=\"error-form\" style=\"color: red; \">No field is null!</span>");
            }
            // ///////////////////////////////////
            $.ajax({
                url: linkpage + "account",
                method: 'POST',
                data: {"action": "testoldpass", "oldpassword": op},
                success: function() {
                    //sai mk cu
                    error = 1;
                    $("#oldpass").next('.error-form').remove();
                    $("#oldpass").after("<span class=\"error-form\" style=\"color: red; \">Pass is wrong!</span>");
                }
            });
            ////////////////////////////////////////
            validatePassword(op);
            validatePassword(np);
            validatePassword(rnp);

            if (np != rnp) {
                error = 1;
                $("#renewpass").next('.error-form').remove();
                $("#renewpass").after("<span class=\"error-form\" style=\"color: red; \">New Password not match!</span>");
            }
            if (np == op) {
                error = 1;
                $("#renewpass").next('.error-form').remove();
                $("#renewpass").after("<span class=\"error-form\" style=\"color: red; \">You should use new Password!</span>");
            }

            if (error == 0) {
                $.ajax({
                    url: linkpage + "account",
                    method: 'POST',
                    data: {"action": "changepass", "password": np},
                    success: function() {
                        alert("change pass success");
                        location.reload();
                    },
                    error: function() {
                        alert("error");
                    }
                });
            }



        }
    });

});
function validatePhone(phone) {
    var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
    if (!vnf_regex.test(phone)) {
        error = 1;
        console.log("phone not ok");
        $("#phone-need-fc").next('.error-form').remove();
        $("#phone-need-fc").after("<span class=\"error-form\" style=\"color: red; \">Your Phonenumber is not supported!</span>");
    }

}
function validatePassword(password) {
                var regexP = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,22}$/;
                if (!regexP.test(password)) {
                    error = 1;
                    console.log("pass 6 22");
                    $("#renewpass").next('.error-form').remove();
                    $("#renewpass").after("<span class=\"error-form\" style=\"color: red; \">Pass must have 6 to 22 character, and must include at least one upper case letter, one lower case letter, and one numeric digit.!</span>");
                }
            }
function loadWishlist(){
    
}            
function loadOrders(){
    
}            
function loadOrderDetail(){
    
}            
            
            