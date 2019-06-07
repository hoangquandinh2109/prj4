<%-- 
    Document   : JSSscript
    Created on : Jun 7, 2019, 5:26:32 PM
    Author     : bemap
--%>

<script>
               var xx;
                    $(document).ready(function() {
                        var checkLiked =${checkLike};
                        var likeID ='${likeID}';
                        $('[data-toggle="tooltip"]').tooltip();

                        $('#hitLike').click(function() {
                            console.log("testHILKE");
                            $.ajax({
                                url: "commentServlet",
                                type: "POST",
                                dataType: "json",
                                data: {action: "hitLike", postID:${p.postID}, likeStatus: checkLiked, likeID: likeID},
                                success: function(data) {
                                    checkLiked = data.likeItem[0].likeStatus;
                                    likeID = data.likeItem[0].likeID;
                                    if (checkLiked) {
                                        $('#resetLike').text("");
                                        $("#resetLike").append(data.likeItem[0].countLikes + ' <i style="color:blue" class="far fa-thumbs-up"></i>');
                                        var template = '<span><i style="color:blue" class="far fa-thumbs-up"></i> Liked</span>';
                                        $('#hitLike').text("");
                                        $('#hitLike').removeClass("btn btn-outline-secondary");
                                        $('#hitLike').addClass("btn btn-outline-primary");
                                        $("#hitLike").append(template);
                                    }
                                    else {
                                        $('#resetLike').text("");
                                        $("#resetLike").append(data.likeItem[0].countLikes + ' <i class="far fa-thumbs-up"></i>');
                                        var template = '<span><i class="far fa-thumbs-up"></i> Like</span>';
                                        $('#hitLike').text("");
                                        $('#hitLike').removeClass("btn btn-outline-primary");
                                        $('#hitLike').addClass("btn btn-outline-secondary");
                                        $("#hitLike").append(template);

                                    }

                                }
                            });
                        });
                        var ID='${sessionid}';
                    //   var blak =ID.toLocaleString('');
                    //REPLY HERE
                        $("input[name='dizz']").keyup(function(e) {
                            
                            if( ID===''){
                                    alert("Login First");
                                    return;
                                }

                            if (e.keyCode === 13) {

                                var s=$(this).val();
                               
                                if (s === "") {
                                    alert("INPUT FIELD CANNOT BLANK");
                                    return;
                                }
                                var cmtID = $(this).attr('id');
                                $(this).val("");
                                var resestCount = true;
                                $.ajax({
                                    url: "commentServlet",
                                    type: "POST",
                                    dataType: "json",
                                    data: {action: "createReply",data:s, cmtID: cmtID, postID:${p.postID}, resestCount: resestCount},
                                    success: function(data) {
                                        location.reload();
                                    }
                                });

                            }
                        });
                        $('#inputCmt').keyup(function(e) {
                            if (e.keyCode === 13)
                            {
                                
                                var s = $('#inputCmt').val();
                                if(ID===''){
                                    alert("Login First");
                                    return;
                                }
                                if (s === "") {
                                    alert("INPUT FIELD CANNOT BLANK");
                                    return;
                                }
                                $(this).val("");
                                var resestCount = true;
                                $.ajax({
                                    url: "commentServlet",
                                    type: "POST",
                                    dataType: "json",
                                    data: {action: "createComment", data: s, postID:${p.postID}, resestCount: resestCount},
                                    success: function(data) {
                                        //  var x =JSON.stringify(data);
                                        var template = '<div class="media">' +
                                                '<img src="https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png" alt="John Doe" class ="mr-3 mt-3 rounded-circle" style="width:60px;">' +
                                                ' <div class="media-body">' +
                                                '<h4>' + data.commentItem[0].userName + '</h4><a href="#" data-toggle="tooltip" class="text-time text-secondary" id="' + data.commentItem[0].postID + '"><small>1 day ago</small> </a> ' +
                                                '<div class="bg-light text-dark rounded editCmt">' +
                                                '<p class="pl-2 pt-2 pb-2"> ' + data.commentItem[0].commentContent + '<i class="fas fa-ellipsis-v"></i></p>' +
                                                '</div>' +
                                                '</div> ' +
                                                '</div><br>';

                                        $("#chovaoday").append(template);
                                        document.getElementById(data.commentItem[0].postID).title = data.commentItem[0].dateTime;
                                        $('[data-toggle="tooltip"]').tooltip();
                                        $("#sTotal").text(data.commentItem[0].sTotal);

                                    }
                                });
                            }
                        });

                    });
                    var quills = new Quill('#content-body', {
                        readOnly: true
                    });
                    var s =${content};
                    var x = JSON.parse(s);
                    console.log(x);
                    quills.setContents(x);
</script>
