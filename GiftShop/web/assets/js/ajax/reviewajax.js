var star = 0;
var title, content;
var sessionid = $("#sessionid").val();
    var proid = $("#proID").val();
loadAll();

//////////////////write a review
    var modereview = 0;
    $("#write-review").click(function(){
        if(sessionid == null || sessionid == ""){
            $(".clickdetrove").addClass("havemodal");
            $("body").addClass("square");
            $(".modal-form").remove();
            $(".content").append("<div class=\"modal-form fadeInDownMsg\"></div>");
            $(".modal-form").load(linkpage+"templates/login.html");
        }
        else if(modereview == 0){
            $("#review-form").removeClass("hide");
            modereview = 1;
        }
        else if(modereview == 1){
            $("#review-form").addClass("hide");
            modereview = 0;
        }
    });
    
$("#btn-review").click(function() {
    title = $("#title-r").val();
    content = $("#content-r").val();
    if (title.trim() != "" && content.trim() != "" && star != 0) {
        $("#content-r").next("p").remove();
        $("#review-form").fadeOut();
        console.log("link: "+linkpage+"review");
        console.log(title+" "+content+" "+star+" "+sessionid+" "+proid);
        $.ajax({
            url: linkpage+"review",
            method: 'POST',
            data: {"title":title,"content":content,"star": star,"cusid": sessionid ,"product": proid},
            success: function(data){
//                alert(data);
                $("#write-review").remove();
                $("#toThank").append("<span id=\"thankyou\">Thank for Rating</span>");
                loadAll();
            },
            error: function(data){
                alert(data+" error");
            }
        });
        modereview = 2;/// danh dau cho san pham da dc review boi customer
    } else{
        if(star == 0){
            $("#content-r").after("<p class=\"text-danger\">Please Rating!</p>");
        }
        if(!(title.trim() != "" && content.trim() != "")){
            $("#content-r").after("<p class=\"text-danger\">Don't leave any field blank</p>");
        }
    }
    $(".review-input").change(function(n){
        if(n.target.value != null || n.target.value != ""){
            $("#content-r").next("p").remove();
        }
    });
});
$("#input-star a").click(function() {
    $("#input-star a").removeClass("selected");
    $(this).addClass("selected");
    star = $(this).data("numstar");
    console.log(star);
});

function loadAll(){
    var code = "";
    $.ajax({
        url: linkpage+"review?proID="+proid,
        method: "GET",
        dataType: 'json',
        contentType: 'application/json',
        success: function(data){
            if(data.length == 0){
                $("#listReviews").hide();
            } else{
                $("#listReviews").show();
                for(var index = 0; index < data.length; index++){
                    code+="                <div class=\"item-review\">";
                    code+="                    <div class=\"review-tu clearfix\">";
                    code+="                        <div class=\"star-review\">";
                    code+="                            <i class=\"far fa-star\"></i>";
                    code+="                            <i class=\"far fa-star\"></i>";
                    code+="                            <i class=\"far fa-star\"></i>";
                    code+="                            <i class=\"far fa-star\"></i>";
                    code+="                            <i class=\"far fa-star\"></i>";
                    code+="                            <div style=\"width: "+percentstar(data[index].star)+"%;\" class=\"star-reviewed\">";
                    code+="                                <i class=\"fas fa-star\"></i>";
                    code+="                                <i class=\"fas fa-star\"></i>";
                    code+="                                <i class=\"fas fa-star\"></i>";
                    code+="                                <i class=\"fas fa-star\"></i>";
                    code+="                                <i class=\"fas fa-star\"></i>";
                    code+="                            </div>";
                    code+="                        </div>";
                    code+="                    </div>";
                    code+="                    <h2>"+data[index].title+"</h2>";
                    code+="                    <span class=\"info-people\"><strong>"+data[index].cusName+"</strong> on <strong>May 21, 2019</strong></span>";
                    code+="                    <p>"+data[index].content+"</p>                 ";
                    code+="                </div>  ";
                }
                $("#listReviews").text("");
                $("#listReviews").append(code);
            }
        },
        error: function(){
            console.log("error");
        }
    });
}

function percentstar(d){
    return (d/5)*100;
}