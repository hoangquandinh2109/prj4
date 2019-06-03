$('.btn-add-to-cart').click(function() {
        event.preventDefault();
        var proId=$(this).parent().find("#proID-to-cart").val();


        $.ajax({
            type: "POST",
            url: "cart",
            data:{"proID":proId},
            success: function(status){
                console.log("Entered",status);
                getAllFromCart();
            },
            error:function(error){
                console.log("error",error);
            },

        });
});

function getAllFromCart(){
    $.ajax({
        type:"GET",
       url: "cart",
       success: function(data) {
           $('#results').html(data);
       }
    });
}