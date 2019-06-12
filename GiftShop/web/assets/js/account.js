var varError = 0;
var modalon = 0;

var fileList = document.getElementById("fileList");
function handleFiles(file) {
if (file.length) {
  $(".filecontainer").show();
  $(".clickdetrove").addClass('havemodal');
  fileList.innerHTML = "";
  var img = document.createElement("img");
  img.src = window.URL.createObjectURL(file[0]);
  img.height = 120;
  img.onload = function() {
      window.URL.revokeObjectURL(this.src);
  }
  fileList.appendChild(img);
}
}

$(document).ready(function() {
    $('.clickdetrove').click(function(){
        $(".filecontainer").fadeOut();
    });
    $('#uploadclick').click(function(){
        event.preventDefault();
        document.getElementById("fileElem").click();
    });
    $('#cancelfile').click(function(){
        $(".filecontainer").fadeOut();
        $(".clickdetrove").removeClass("havemodal");
    });
     $('body').keypress(function(){
         if(modalon == 1){
            $(".clickdetrove").removeClass("havemodal");
            $(".modal-form").remove();
            
            $('body').removeClass("square");
            modalon = 0;
        }
    });
    ///////////////////////////////////////////////////////////////////////////////////////////////account
    $('#dashboard').click(function(){
        $("#switcher>div").removeClass("active");
        $(this).addClass("active");
        $(".everyblock").hide();
        $("#showdashboard").show();
        loadTopOnDashboard();
        window.history.pushState("Details", "Title", linkpage+"account/dashboard");
        document.title= "Dashboard - "+usernamess;
    });
    $('#account, a#pen-edit').click(function(){
        event.preventDefault();
        $("#switcher>div").removeClass("active");
        $(this).addClass("active");
        $(".everyblock").hide();
        $("#showaccount").show();
        $("#name-need-fc").focus();
        $("#address-need-fc").val($("#myaddress").text());
        $("#phone-need-fc").val($("#myphone").text());
        $("#name-need-fc").val($("#myname").text());
        $("#email-need-fc").val($("#myemail").text());
        
        $("#oldpass").val("");
        $("#newpass").val("");
        $("#renewpass").val("");
        window.history.pushState("Details", "Title", linkpage+"account/info");
        document.title= "Account - "+usernamess;
    });
    $('#wishlist, #atagw').click(function(){
        event.preventDefault();
        $("#switcher>div").removeClass("active");
        $(this).addClass("active");
        $(".everyblock").hide();
        $("#showwishlist").show();
        loadWishlist();
        window.history.pushState("Details", "Title", linkpage+"account/wishlist");
        document.title= "Wishlist - "+usernamess;
    });
    $('#orders, #atago').click(function(){
        event.preventDefault();
        $("#switcher>div").removeClass("active");
        $(this).addClass("active");
        $(".everyblock").hide();
        $("#order-detail").hide();
        $("#orderslist").show();
        $("#showorders").show();
        loadTopOnOrder();
        loadOrders();
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
            loadTopOnOrder();
            loadOrders();
            break;
        case "orderdetail":
            $("#switcher>div").removeClass("active");
            $('#orders').addClass("active");
            $(".everyblock").hide();
            $("#orderslist").hide();
            $("#order-detail").show();
            $("#showorders").show();
            loadOrderDetail($("#pagename").val());
            break;
        case "wishlist":
            $("#switcher>div").removeClass("active");
            $('#wishlist').addClass("active");
            $(".everyblock").hide();
            $("#showwishlist").show();
            loadWishlist();
            break;
        case "dashboard":
            $("#switcher>div").removeClass("active");
            $('#dashboard').addClass("active");
            $(".everyblock").hide();
            $("#showdashboard").show();
            loadTopOnDashboard();
            break;
        case "info":
            $("#switcher>div").removeClass("active");
            $('#account').addClass("active");
            $(".everyblock").hide();
            $("#showaccount").show();
            $("#name-need-fc").focus();
            $("#address-need-fc").val($("#myaddress").text());
            $("#phone-need-fc").val($("#myphone").text());
            $("#email-need-fc").val($("#myemail").text());
            $("#name-need-fc").val($("#myname").text());
            
        
            $("#oldpass").val("");
            $("#newpass").val("");
            $("#renewpass").val("");
            break;
    }  
    
    
    ///////////////////////////////////////////////////////////////////////////////////////////////account
    
    
    
    $(".btn").click(function() {
        varError = 0;
        event.preventDefault();
        var action = $(this).text();
        if (action == "Update") {
            var address = $("#address-need-fc").val();
            var phone = $("#phone-need-fc").val();
            var name = $("#name-need-fc").val();
            var email = $("#email-need-fc").val().toLowerCase();

            validatePhone(phone);
            validateEmail(email);
            if(email == $("#myemail").text().toLowerCase() && varError ===0){
                $.ajax({
                        url: linkpage + "account",
                        method: 'POST',
                        data: {
                            "action": "updateinfo",
                            "address": address,
                            "phone": phone,
                            "name": name,
                            "email": email
                        },
                        success: function() {
                            $('input').blur();
                            $('button').blur();
                            modalMsg("Update information successfull");
                            modalon = 1;
                            document.title= "Account - "+name;
                             $("#myaddress").text(address);
                            $("#myphone").text(phone);
                            $("#myemail").text(email);
                            $("#myname").text(name);
                        },
                        error: function() {
                            modalMsg("<span style=\"color: #a94442;\">Update information failed!</span>");
                            modalon = 1;
                        }
                });
                varError = 1;///cho cái dưới khỏi chạy
            }
            if(varError === 0){
                 ajaxCheckEmailExisted(email).done(function(){
                    $("#email-need-fc").next('.varError-form').remove(); 
                    varError = 0; 
                    console.log("email okay");
                    
                    $.ajax({
                        url: linkpage + "account",
                        method: 'POST',
                        data: {
                            "action": "updateinfo",
                            "address": address,
                            "phone": phone,
                            "name": name,
                            "email": email
                        },
                        success: function() {
                            $('input').blur();
                            $('button').blur();
                            modalMsg("Update information successfull");
                            modalon = 1;
                            document.title= "Account - "+name;
                             $("#myaddress").text(address);
                            $("#myphone").text(phone);
                            $("#myemail").text(email);
                            $("#myname").text(name);
                        },
                        error: function() {
                            modalMsg("<span style=\"color: #a94442;\">Update information failed!</span>");
                            modalon = 1;
                        }
                    });

                }).fail(function (jqXHR, textStatus, errorThrown) {
                    $("#email-need-fc").next('.varError-form').remove();
                    $("#email-need-fc").after("<span class=\"varError-form\">Email existed.!</span>");
                    varError =1; 
                });
            }

        }
        if (action == "Change") {
            var op = $("#oldpass").val();
            var np = $("#newpass").val();
            var rnp = $("#renewpass").val();

            if (op == "" || np == "" || rnp == "") {
                varError = 1;
                $("#renewpass").next('.varError-form').remove();
                $("#renewpass").after("<span class=\"varError-form\">No field is null!</span>");
            }else{
                validatePassword(op);
                validatePassword(np);
                validatePassword(rnp);
                // ///////////////////////////////////
                if(varError == 0){
                    $.ajax({
                        url: linkpage + "account",
                        method: 'POST',
                        data: {"action": "testoldpass", "oldpassword": op},
                        success: function() {
                            //sai mk cu
                            varError = 2;
                            $("#oldpass").next('.varError-form').remove();
                            $("#oldpass").after("<span class=\"varError-form\">Pass is wrong!</span>");
                        },
                        error: function(){
                            $("#oldpass").next('.varError-form').remove();
                            if (np == op && varError != 2) {
                                varError = 1;
                                $("#renewpass").next('.varError-form').remove();
                                $("#renewpass").after("<span class=\"varError-form\">You should use new Password!</span>");
                            } else if (np != rnp ) {
                                varError = 1;
                                $("#renewpass").next('.varError-form').remove();
                                $("#renewpass").after("<span class=\"varError-form\">New Password not match!</span>");
                            }
                            if (varError == 0) {
                                
                                $('.varError-form').remove();
                                $.ajax({
                                    url: linkpage + "account",
                                    method: 'POST',
                                    data: {"action": "changepass", "password": np},
                                    success: function() {
                                        $('input').blur();
                                        $('button').blur();
                                         $("#oldpass").val("");
                                         $("#newpass").val("");
                                         $("#renewpass").val("");
                                        modalMsg("Change your password successfull!");
                                        modalon = 1;
                                    },
                                    error: function() {
                                        modalMsg("<span style=\"color: #a94442;\">Change your password failed!</span>");
                                        modalon = 1;
                                    }
                                });
                            }
                        }
                    });
                }
                ////////////////////////////////////////
                
            }
            



        }
    });

});
function validatePhone(phone) {
    var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
    if (!vnf_regex.test(phone)) {
        varError = 1;
        console.log("phone not ok");
        $("#phone-need-fc").next('.varError-form').remove();
        $("#phone-need-fc").after("<span class=\"varError-form\">Your Phonenumber is not supported!</span>");
    }

}
function validatePassword(password) {
                var regexP = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,22}$/;
                if (!regexP.test(password)) {
                    varError = 1;
                    console.log("pass 6 22");
                    $("#renewpass").next('.varError-form').remove();
                    $("#renewpass").after("<span class=\"varError-form\">Pass must have 6 to 22 character, and must include at least one upper case letter, one lower case letter, and one numeric digit.!</span>");
                }
            }
 function validateEmail(email){
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    if(!re.test(email)){
        
        $("#email-need-fc").next('.varError-form').remove();
        $("#email-need-fc").after("<span class=\"varError-form\">Email wrong format.!</span>");
        varError = 1;
    } 
}        
function ajaxCheckEmailExisted(email){
    return $.ajax({
            type:"GET",
            data:{"email":email.toLowerCase()},
            url: linkpage+"register"
            
        });
}
function removeW(id){
    post("wishlist", {"proID": id}).fail(function(){
        loadWishlist();
    });
}



function removeWDB(id){
    post("wishlist", {"proID": id}).fail(function(){
        loadWishlistDB();
    });
}
function loadWishlistDB(){
    get("api/getMyWishlist").done(function(data){
        if(data.length != 0){
            var topWitems="";
            var checkRow = 0;
            $.each(data,function(ip, p){
                if(ip < 4){
                    if(checkRow === 0){
                        topWitems += "<div class=\"r twd list-product\">";
                    }
                        topWitems +=     "<div class=\"c-05 \">";
                        topWitems +=         "<div class=\"product-item\">";
                        topWitems +=             "<img src=\""+p.img+"\"";
                        topWitems +=                     "alt=\"\">";
                        topWitems +=             "<a href=\""+p.url+"\" class=\"pname\">"+p.name+"</a>";
                        topWitems +=             "<button onclick=\"removeWDB('"+p.id+"'); return false;\" class=\"pbutton-wishlist button-remove\">Remove from wishlist</button>";
                        topWitems +=         "</div>";
                        topWitems +=     "</div>";
                        checkRow++;
                    if(checkRow === 2 || !data[ip+1]){
                        topWitems += "</div>";
                        checkRow = 0;
                    }
                }
            });
            $(".twd").remove();
            $("#etwd").remove();
            $("#bindTopWishlistDashboard").append(topWitems);
        }else{
            $(".twd").remove();
            $("#etwd").remove();
            $("#bindTopWishlistDashboard").append("<div id=\"etwd\" class=\"list-product op50\">You haven't add anything to wishlist</div>");
        }
      
        
    });
}
function loadTopOnDashboard(){
    loadWishlistDB();
        console.log("hello");
    get("api/toppurchase").done(function(data){
        console.log("hello1");
        if(data.length != 0){
            var topPitems="";
            var checkRow = 0;
            $.each(data,function(ip, p){
                if(ip < 4){
                    if(checkRow === 0){
                        topPitems += "<div class=\"tpd r list-product\">";
                    }
                        topPitems +=     "<div class=\"c-05 \">";
                        topPitems +=         "<div class=\"product-item\">";
                        topPitems +=             "<img src=\""+p.img+"\"";
                        topPitems +=                     "alt=\"\">";
                        topPitems +=             "<a href=\""+p.url+"\" class=\"pname\">"+p.name+"</a>";
                        topPitems +=             "<span class=\"pdate\">Order date: <span>"+p.odate+"</span></span>";
                        topPitems +=         "</div>";
                        topPitems +=     "</div>";
                        checkRow++;

                    if(checkRow === 2 || !data[ip+1]){
                        topPitems += "</div>";
                        checkRow = 0;
                    }
                }
            });
            $(".tpd").remove();
            $("#etpd").remove();
            $("#bindTopPurchaseDashboard").append(topPitems);
        }else{
            $(".tpd").remove();
            $("#etpd").remove();
            $("#bindTopPurchaseDashboard").append("<div id=\"etpd\" class=\"list-product op50\">You haven't bought any gift</div>");
        }
    }).fail(function(error){
        console.log(error);
    });
}
function loadTopOnOrder(){
    get("api/toppurchase").done(function(data){
        if(data.length != 0){
            var topPOitems="";
            var checkRow = 0;
            $.each(data,function(ip, p){
                if(ip < 4){
                    if(checkRow === 0){
                        topPOitems += "<div class=\"r tpo list-product\">";
                    }
                        topPOitems +=     "<div class=\"c-05 \">";
                        topPOitems +=         "<div class=\"product-item\">";
                        topPOitems +=             "<img src=\""+p.img+"\"";
                        topPOitems +=                     "alt=\"\">";
                        topPOitems +=             "<a href=\""+p.url+"\" class=\"pname\">"+p.name+"</a>";
                        topPOitems +=             "<span class=\"pdate\">Order date: <span>"+p.odate+"</span></span>";
                        topPOitems +=         "</div>";
                        topPOitems +=     "</div>";
                        checkRow++;
                        
                    if(checkRow === 2 || !data[ip+1]){
                        topPOitems += "</div>";
                        checkRow = 0;
                    }
                }
            });
            $(".tpo").remove();
            $("#etpo").remove();
            $("#bindTopPurchaseOrders").append(topPOitems);
        }else{
            $(".tpo").remove();
            $("#etpo").remove();
            $("#bindTopPurchaseOrders").append("<div id=\"etpo\" class=\"list-product op50\">You haven't bought any gift</div>");
        }
    });
}







function loadWishlist(){
    get("api/getMyWishlist").done(function(data){
        if(data.length != 0){
            var rowsItems = "";
            var checkRow = 0;
            $.each(data,function(ip, p){
                if(checkRow === 0){
                    rowsItems +="<div class=\"r lpwl\">";
                }
                
                rowsItems +=    "<div class=\"c-05\">";
                rowsItems +=        "<div class=\"product-item\">";
                rowsItems +=            "<a href=\""+p.url+"\"><img src=\""+p.img+"\"";
                rowsItems +=                                                                                            "alt=\"\"></a>";
                rowsItems +=            "<a href=\""+p.url+"\" class=\"pname\">"+p.name+"</a>";
                rowsItems +=            "<div class=\"wishlist-price\">"+p.price+"</div>";
                rowsItems +=            "<button onclick=\"removeW('"+p.id+"'); return false;\" class=\"button-remove pbutton-wishlist\">Remove</button>";
                rowsItems +=        "</div>";
                rowsItems +=    "</div>";
                checkRow++;
                
                if(checkRow === 2 || !data[ip+1]){
                    rowsItems += "</div>";
                    checkRow = 0;
                }
            });
            $(".lpwl").remove();
            $("#erodd").remove();
            $("#bindproductwl").append(rowsItems);
        }    else{
            $(".lpwl").remove();
            $("#erodd").remove();
            $("#bindproductwl").append("<div id=\"erodd\" style=\"opacity: 0.5;\">no items</div>");
        }
    }).fail(function(){
        
    });
}            
function loadOrders(){
    get("api/getAllOrder").done(function(data){
        var rowsItem;
        $(".it-ods").remove();
        if(data.length == 0){
            $(".no-item-od").remove();
            $("#table-orders").after("<div class=\"no-item-od\">No items</div>");   
        }
        else{
            $(".no-item-od").remove();
            $.each(data, function(index, oditem){
                rowsItem += "<tr class=\"it-ods\">";
                rowsItem += "<td>"+oditem.id+"</td>";
                rowsItem += "<td>"+oditem.date+"</td>";
                rowsItem += "<td>"+oditem.item+"</td>";
                rowsItem += "<td>"+oditem.total+"</td>";
                rowsItem += "<td>"+oditem.status+"</td>";
                rowsItem += "<td><a href=\"\" onclick=\"loadOrderDetail('"+oditem.id+"'); return false;\" class=\"button-remove\">View</a></td>";
                rowsItem += "</tr>";
            });
            $("#table-orders").append(rowsItem);
        }
    }).fail(function(){
        alert("fail");
    });
}            
function loadOrderDetail(code){
    $("#orderslist").hide();
    $("#order-detail").show();
    $("html, body").scrollTop(0);
    window.history.pushState("Details", "Title", linkpage+"account/orders/"+code);
    document.title= "#"+code+" - "+$("#usernamess").val();
    get("api/orderdetail/"+code).done(function(data){
        $("#bindcode").text("#"+code);
        $("#bindreceiver").text(data[0].receiver);
        $("#bindaddress").text("Address: "+data[0].address);
        $("#bindphone").text("Phone: "+data[0].phone);
        $("#binddate").text("Date: "+data[0].date);
        $("#bindnote").text("Notes: "+data[0].note);
        $("#bindpayment").text(data[0].payment);
        $("#bindtotal").text(data[0].total);
        if(data[1].length != 0){
            var rowsItems = "";
            var checkRow = 0;
            if(data[1].length !== 0){
                $.each(data[1],function(ip, p){ 
                    if(checkRow === 0){
                        rowsItems += "<div class=\"r list-product lpodd\">";
                    }

                    rowsItems +=     "<div class=\"c-05 \">";
                    rowsItems +=         "<div class=\"product-item\">";
                    rowsItems +=             "<img src=\""+p.proImage+"\"";
                    rowsItems +=                     "alt=\"\">";
                    rowsItems +=             "<a href=\""+p.proURL+"\" class=\"pname\">"+p.proName+"</a>";
                    rowsItems +=             "<span class=\"price-io\">"+p.proPrice+"</span>";
                    rowsItems +=             "<span class=\"quan-io\">"+p.proItem+" item(s)</span>";
                    rowsItems +=         "</div>";
                    rowsItems +=     "</div>";
                    checkRow++;

                    if(checkRow === 2 || !data[1][ip+1]){
                        rowsItems += "</div>";
                        checkRow = 0;
                    }
                });     
                $(".lpodd").remove();
                $("#erodd").remove();
                $("#bindproductodd").append(rowsItems);
            } else{
                
                $(".lpodd").remove();
                $("#erodd").remove();
                $("#bindproductodd").append("<div id=\"erodd\" style=\"opacity: 0.5;\">no items</div>");
            }
        }    
    }).fail(function(){
        location.replace(linkpage+"notfound");
    });
}            

function get(url){
    console.log(linkpage+url);
    return $.ajax({
            type: "GET",
            dataType: 'json',
            contentType: 'application/json',
            url: linkpage+url
        });
}
function post(url, data){
    return $.ajax({
            type: "POST",
            url: linkpage+url,
            data: data ? data : null
        });
}
            
            