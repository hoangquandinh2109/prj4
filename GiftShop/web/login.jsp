<%-- 
    Document   : login.jsp
    Created on : May 6, 2019, 2:16:23 PM
    Author     : johnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login!</h1>
        <form id="form-in-modal" method="post">
    <span class="label-form-modal">Email</span>
    <input type="text" name="email" id="email" class="form-in-modal">
    <span class="label-form-modal">Password</span>
    <input type="password" name="password" id="password" class="form-in-modal">
    <a class="db-tac" href="">Forgot your Password?</a>
    <button id="login-button" class="db-tac" type="submit">SIGN IN</button>
    <a class="db-tac modal-create-acc" href="">Create account</a>
</form>
    <c:import url="templates/script.jsp"></c:import>
        <script>
//            $('#login-button').click(function() {
//                event.preventDefault();
//              var email=$("#email").val();
//              var password=$("#password").val();
//                $.ajax({
//                    type:"POST",
//                   data:{"email":email,"password":password},
//                   url: "login",
//                   success: function() {
//                       console.log("success",);
//                    $("#email").val("");
//                    $("#password").val("");
//                   },
//                   error:function(){
//                       console.log("error",);
//                   },
//                });
//            });
        </script>
    </body>
</html>
