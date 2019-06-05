<%-- 
    Document   : Resetpassword
    Created on : May 20, 2019, 3:13:29 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Reset Password</h3>
<form id="form-in-modal" action="SendMailServlet">
    <span class="label-form-modal">Email</span>
    <input id="email" type="text" name="recipient" value="" class="form-in-modal check-blank">
<!--    <span class="label-form-modal">Content</span>
    <input id="email" type="text" name="content" value="" class="form-in-modal check-blank">-->
<span class="label-form-modal">Subject</span>
    <input id="email" type="text" name="subject" value="" class="form-in-modal check-blank">
    <span class="label-form-modal">Content</span>
    <input id="email" type="text" name="content" value="" class="form-in-modal check-blank">
    <button class="db-tac" id="register-button" type="submit">Submit</button>

    <div class="db-tac"><span>Back to</span> <a class="modal-login" href="">Login</a></div>
</form>
    </body>
</html>
