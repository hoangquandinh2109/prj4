<%-- 
    Document   : JSSscript
    Created on : Jun 7, 2019, 5:26:32 PM
    Author     : bemap
--%>

<script>
    var xx;
    var bex = 2;
    var count = 5;
    var checkCmt = true;
    $(document).ready(function() {
        var now = new Date();
        var checkLiked =${checkLike};
        var likeID = '${likeID}';
//        setInterval(function() {
//            $.ajax({
//                url: "countRuntime",
//                type: "GET",
//                dataType: 'json',
//                data:{pid:${p.postID}},
//                headers: {
//                    Accept: 'application/json ,chartset=utf-8',
//                    'Content-Type': 'Apllication/json;chartset=utf-8'
//                },
//                success:function(result){
//                    $("#getTTLikeRT").text(result.total[1].totalLike);
//    }
//                    
//                
//            });
//        }, 3000);
        $('[data-toggle="tooltip"]').tooltip();
        $('#hitLike').click(function() {
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
        var ID = '${sessionid}';
        var name = "${sessionname}";
        //   var blak =ID.toLocaleString('');
        //REPLY HERE

        $("input[name='createReply']").keyup(function(e) {
            if (e.keyCode === 13) {
                if (ID === '') {
                    alert("Login First");
                    return;
                }
                var dataS = $(this).val();
                if (dataS === "") {
                    alert("INPUT FIELD CANNOT BLANK");
                    return;
                }
                $(this).val("");
                $(this).hide();
                var cmtID = $(this).attr('at');
                var shortTemp = "";
                if (ID === '${p.postID}') {
                    shortTemp = '<h4 class="text-dark font-weight-bold" title="Author Post">' + name + '</h4>';
                }
                else {
                    shortTemp = '<h4>' + name + '</h4>';
                }
                var idRep = 'cainay' + cmtID;
                var resestCount = true;
                $.ajax({
                    url: "commentServlet",
                    type: "POST",
                    dataType: "json",
                    data: {action: "createReply", data: dataS, cmtID: cmtID, postID:${p.postID}, resestCount: resestCount},
                    success: function(data) {

                        var template = '<div class="media p-2" id="moiCreate">' +
                                '  <img src="https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png" alt="Jane Doe" class="mr-3 mt-3 rounded-circle" style="width:45px;">' +
                                ' <div class="media-body">' + shortTemp +
                                '<a href="#"data-toggle="tooltip" class="text-time text-secondary" title=""><small>' + data.replyItem[0].dateTime + '</small></a>' +
                                '<div class="p-2">' +
                                '<span id="moiCreate" class="text-dark editCmt pt-2 pl-3 pb-2 pr-3">' + dataS + '</span>' +
                                '<input type="text" id="editMoi" at="repMoi" value="' + dataS + '"name="editReply" class="form-control pull-right"  placeholder="Edit a reply... if this field is blank this comment will be deleted" style = "display:none;"/>' +
                                '<br>' +
                                '<span class="btn reply text-primary" onClick="reloadpage()"><i class="fal fa-reply"></i>Reply</span>' +
                                '<button class="btn btn-outline-primary edit-cmt" style="cursor: pointer"   onClick="reloadpage()"><i class="fal fa-edit"></i></button>' +
                                '<button class="btn btn-outline-danger"  onClick="reloadpage()"><i class="fal fa-trash-alt"></i></button>';

                        '</div></div></div>';
                        // document.getElementById('3').innerHtml(template);
                        // console.log('#'+iddenhapvo+"");
                        $("#" + idRep).append(template);

                        $("#sTotal").text(data.replyItem[0].sTotal);
                    }
                });
            }
        });
        //editComment
        $("input[name='editCmt']").keyup(function(e) {
            if (e.keyCode === 13) {
                var action = "";
                var s = $(this).val();
                var commentID = $(this).attr('at');
                if (s === "") {
                    action = "deleteComment";
                }
                else {
                    action = "updateComment";
                }
                $.ajax({
                    url: "commentServlet",
                    type: "POST",
                    dataType: "json",
                    data: {action: action, data: s, commentID: commentID, postID:${p.postID}},
                    success: function(data) {
                        console.log(data);
                        if (data.replyItem[0].status === true)
                        {
                            $('#editCmtInput' + commentID).hide();
                            $('#edCmtValue' + commentID).text(s);
                            $('#edCmtValue' + commentID).show();
                        }
                        else {
                            $("#sTotal").text(data.replyItem[0].sTotal);
                            $('div').remove('#cmtRepID' + commentID);
                        }
                    }
                });
            }
        });
        //edit rep//////////////////////////////////////////////////////////
        $("input[name='editReply']").keyup(function(e) {
            if (e.keyCode === 13) {
                var action = "";
                var s = $(this).val();
                var repID = $(this).attr('at');
                if (s === "") {
                    action = "deleteReply";
                }
                else {
                    action = "updateReply";
                }

                $.ajax({
                    url: "commentServlet",
                    type: "POST",
                    dataType: "json",
                    data: {action: action, data: s, repID: repID, postID:${p.postID}},
                    success: function(data) {
                        console.log(data);
                        if (data.replyItem[0].status === true)
                        {
                            $('#edit' + data.replyItem[0].repID).hide();
                            $('#rep' + repID).text(data.replyItem[0].getContent);
                            $('#rep' + repID).show();
                        }
                        else {
                            $("#sTotal").text(data.replyItem[0].sTotal);
                            $('div').remove('#zz' + repID);
                        }
                    }
                });
            }
        });

        $('#inputCmt').keyup(function(e) {
            if (e.keyCode === 13)
            {
                var s = $('#inputCmt').val();
                if (ID === '') {
                    alert("Login First");
                    return;
                }
                if (s === "") {
                    alert("INPUT FIELD CANNOT BLANK");
                    return;
                }
                console.log("count truoc khi vo ajax" + count);
                var testC = checkCmtSpam(checkCmt, count);
                // console.log(testC);
                if (testC <= 5) {

                }
                var shortTempCmt = "";
                $(this).val("");

                if (ID === '${p.postID}') {
                    shortTempCmt = '<h4 class="text-dark font-weight-bold" style="margin-bottom:auto" title="Author Post">' + name + '</h4>';
                }
                else {
                    shortTempCmt = '<h4 style="margin-bottom:auto">' + name + '</h4>';
                }
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
                                ' <div class="media-body">' + shortTempCmt +
                                '<a href="#" data-toggle="tooltip" class="text-time text-secondary" id="' + data.replyItem[0].postID + '"><small>' + data.replyItem[0].dateTime + '</small> </a> ' +
                                '<div class="p-2">' +
                                '<span class="text-dark editCmt pt-2 pl-3 pb-2 pr-3">' + data.replyItem[0].getContent + '</span>' +
                                '<br>' +
                                '<span class="btn reply text-primary" onClick="reloadpage()"><i class="fal fa-reply"></i>Reply</span>' +
                                '<button class="btn btn-outline-primary edit-cmt" style="cursor: pointer"   onClick="reloadpage()"><i class="fal fa-edit"></i></button>' +
                                '<button class="btn btn-outline-danger"  onClick="reloadpage()"><i class="fal fa-trash-alt"></i></button>';
                        $("#chovaoday").append(template);
                        document.getElementById(data.replyItem[0].postID).title = data.replyItem[0].dateTime;
                        $('[data-toggle="tooltip"]').tooltip();
                        $("#sTotal").text(data.replyItem[0].sTotal);
                        document.getElementById(data.replyItem[0].postID);
                    }
                });
            }
        });
    });
    function deleteReplyFunction(xe) {
        $.ajax({
            url: "commentServlet",
            type: "POST",
            dataType: "json",
            data: {action: "deleteReply", repID: xe, postID:${p.postID}},
            success: function(data) {
                console.log(data);
                $("#sTotal").text(data.replyItem[0].sTotal);
                $('div').remove('#zz' + xe);

            }
        });
    }
    function deleteCommentFunction(xe) {
        $.ajax({
            url: "commentServlet",
            type: "POST",
            dataType: "json",
            data: {action: "deleteComment", commentID: xe, postID:${p.postID}},
            success: function(data) {
                console.log(data);
                console.log(data.replyItem[0].sTotal);
                $("#sTotal").text(data.replyItem[0].sTotal);
                $('div').remove('#cmtRepID' + xe);

            }
        });
    }
    function reloadpage() {
        location.reload();
    }
    function settingEditPost() {
        $('.edpostShow').show();
        $('.edpostHide').hide();
        var IMGUR_CLIENT_ID = 'bcab3ce060640ba';
        var IMGUR_API_URL = 'https://api.imgur.com/3/image';
        var toolbarOptions = {
            container: [
                [{'header': [1, 2, false, 4]}],
                ['bold', 'italic', 'underline'],
                [{'color': []}, {'background': []}],
                [{'list': 'ordered'}, {'list': 'bullet'}],
                [{'script': 'sub'}, {'script': 'super'}],
                [{'indent': '-1'}, {'indent': '+1'}],
                [{'align': []}],
                ['blockquote', 'code', 'link', 'image', 'video']
            ],
            handlers: {
                // handlers object will be merged with default handlers object

                'image': function image() {
                    var Imglenght = quill.getLength() * 10;
                    var _this3 = this;
                    var fileInput = this.container.querySelector('input.ql-image[type=file]');
                    if (fileInput == null) {
                        fileInput = document.createElement('input');
                        fileInput.setAttribute('type', 'file');
                        fileInput.setAttribute('accept', 'image/png, image/gif, image/jpeg, image/bmp, image/x-icon');
                        fileInput.classList.add('ql-image');
                        fileInput.addEventListener('change', function() {
                            console.log(fileInput.files[0]);
                            console.log(fileInput.files[0].type);
                            var data = new FormData();
                            data.append('image', fileInput.files[0]);
                            var xhr = new XMLHttpRequest();
                            xhr.open('POST', IMGUR_API_URL, true);
                            xhr.setRequestHeader('Authorization', 'Client-ID ' + IMGUR_CLIENT_ID);
                            xhr.onreadystatechange = function() {
                                if (xhr.readyState === 4) {
                                    var response = JSON.parse(xhr.responseText);
                                    if (response.status === 200 && response.success) {
                                        quill.insertEmbed(Imglenght, 'image', response.data.link);
                                    } else {
                                        var reader = new FileReader();
                                        reader.onload = function(e) {
                                            console.log("cannot insert hinh``");
                                        };
                                        reader.readAsDataURL(image);
                                    }
                                }
                            }
                            xhr.send(data);
                            console.log(data);
                            /*if (fileInput.files != null && fileInput.files[0] != null) {
                             var reader = new FileReader();
                             reader.onload = function(e) {
                             var range = _this3.quill.getSelection(true);
                             _this3.quill.updateContents(new _quillDelta2.default().retain(range.index).delete(range.length).insert({image: e.target.result}), _emitter2.default.sources.USER);
                             _this3.quill.setSelection(range.index + 1, _emitter2.default.sources.SILENT);
                             fileInput.value = "";
                             };
                             reader.readAsDataURL(fileInput.files[0]);
                             }*/
                        });
                        this.container.appendChild(fileInput);
                    }
                    fileInput.click();
                },
                'link': function(value) {
                    if (value) {
                        var href = prompt('Enter the LInk');
                        this.quill.format('link', href);
                    } else {
                        this.quill.format('link', false);
                    }
                }
            }
        };

        var quill = new Quill('#content-body', {
            modules: {
                toolbar: toolbarOptions
            },
            placeholder: 'Edit.. POST',
            theme: 'snow',
            readyOnly: false
        });
        quill.setContents(x);
        quill.enable(true);
        console.log(" hahahahah");
        $("#myForm").submit(function(e) {
            var myOP = [];
            var string = "";
            myOP = $('form').serializeArray();
            $.each(myOP, function(index, value) {
                string = string.concat(";", value.value.toString());
                console.log(string);
            });
            string = string.slice(1);
            var title = $("#edTitlePost").val();
            var contentPost = JSON.stringify(quill.getContents());
            //    var ss = JSON.parse(strins);
            var infor = quill.getText();

            $.ajax({
                type: 'POST',
                url: 'createPostServlet',
                dataType: 'json',
                data: {action: "update", content: contentPost, tag: string, infor: infor, title: title, postID:${p.postID}},
                success: function(data) {
                    alert("THANH CONG nHE");
                    location.reload();

                }
            });


            return false;
        });

    }

    function checkCmtSpam(checkCmt, count) {
        if (checkCmt === true && count <= 5) {
            count = count - 1;
            //var xax=count;
            return count;
            //console.log(count);

        }
        else {
            checkCmt = false;
            count = 6;
        }
        console.log(count + " as");
    }
    function deletePostFunction(pid) {
        $.ajax({
            type: 'POST',
            url: 'createPostServlet',
            dataType: 'json',
            data: {action: "delete", content: "contentPost", tag: "string", infor: "infor", title: "title", postID: pid},
            success: function(data) {
                alert("THANH CONG nHE");
                location.reload();
            }
        }
        )
    }
    ;



    var Ptitle = "";
    var Pcontent = "";
    var PID = "";
    var Ptag = "";



    var quills = new Quill('#content-body', {
        readOnly: true
    });

    var s =${content};
    var x = JSON.parse(s);
    quills.setContents(x);
</script>
