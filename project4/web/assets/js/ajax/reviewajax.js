var star = 0;
var title, content;
$("#btn-review").click(function() {
    title = $("#title-r").val();
    content = $("#content-r").val();
    if (title != "" && content != "" && star != 0) {
        alert("review");
    } else{
        alert("ko review  dc");
    }
});
$("#input-star a").click(function() {
    $("#input-star a").removeClass("selected");
    $(this).addClass("selected");
    star = $(this).data("numstar");
    console.log(star);
});