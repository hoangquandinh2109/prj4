<%-- 
    Document   : adminLogin
    Created on : Apr 28, 2019, 10:48:19 PM
    Author     : bemap
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <c:import url="../templates/adminHead.jsp"></c:import>

        </head>
        <body>            

            <section class="material-half-bg">
                <div class="cover"></div>
            </section>
            <section class="login-content">
                <div class="logo">
                    <h1>Cang cu Cot</h1>

                </div>
            <c:if test="${mess eq null}">
                <div class="login-box">
                    <form class="login-form" action="${pageContext.request.contextPath}/loginStafftServlet" method="POST">

                        <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
                        <div class="form-group">
                            <label class="control-label">USERNAME</label>
                            <input class="form-control" type="text" name="email" placeholder="Email" autofocus required="">
                        </div>
                        <div class="form-group">
                            <label class="control-label">PASSWORD</label>
                            <input class="form-control" type="password" name="password" placeholder="Password" required="">
                        </div>
                        <div class="form-group">
                            <div class="utility">
                                <div class="animated-checkbox">
                                    <label>
                                        <input type="checkbox"><span class="label-text">Stay Signed in</span>
                                    </label>
                                </div>
                                <p class="semibold-text mb-2"><a href="#" data-toggle="flip">Forgot Password ?</a></p>
                            </div>
                        </div>
                        <div class="form-group btn-container">
                            <button class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>SIGN IN</button>
                        </div>
                    </form>
                    <form class="forget-form" action="${pageContext.request.contextPath}/ResetPasswordServlet" method="post">
                        <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>Forgot Password ?</h3>
                        
                        <div class="form-group">
                            <label class="control-label">EMAIL</label>
                            <input class="form-control" name="message" type="text" placeholder="Email">
                        </div>
                        <div class="form-group btn-container">
                            <button class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw" ></i>RESET</button>
                        </div>
                        
                        <div class="form-group mt-3">
                            <p class="semibold-text mb-0"><a href="#" data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> Back to Login</a></p>
                        </div>
                    </form>
                </div>
            </section>
        </c:if>
        <c:if test="${mess ne null}">
            <div class="login-box">
                <form class="login-form" action="${pageContext.request.contextPath}/loginStafftServlet" method="POST">

                    <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
                    <div class="form-group">
                        <label class="control-label">USERNAME</label>
                        <input class="form-control" type="text" name="email" placeholder="Email" autofocus required="">
                    </div>
                    <div class="form-group">
                        <label class="control-label">PASSWORD</label>
                        <input class="form-control" type="password" name="password" placeholder="Password" required="">
                    </div>
                    <div class="form-group">
                        <div class="utility">
                            <div class="animated-checkbox">
                                <label>
                                    <input type="checkbox"><span class="label-text">Stay Signed in</span>
                                </label>
                            </div>
                            <p class="semibold-text mb-2"><a href="" data-toggle="flip">Forgot Password ?</a></p>
                        </div>
                    </div>
                    <div class="form-group btn-container">
                        <button class="btn btn-primary btn-block" ><i class="fa fa-sign-in fa-lg fa-fw"></i>SIGN IN</button>
                    </div>
                </form>
                <form class="forget-form" action="${pageContext.request.contextPath}/ResetPasswordServlet" method="post">
                    <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>Forgot Password ?</h3>
                    <div class="form-group">
                        <label class="control-label">EMAIL</label>
                        <input class="form-control" type="text" name="message" placeholder="Email" >
                    </div>
                    <div class="form-group btn-container">
                        <button class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>RESET</button>
                    </div>
                    <div class="form-group mt-3">
                        <p class="semibold-text mb-0"><a href="#" data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> Back to Login</a></p>
                    </div>
                </form>
            </div>
        </section>
    </c:if>


    <c:import url="../templates/adminScript.jsp"></c:import>
    <c:import url="../templates/adminScript.jsp"></c:import>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>
        <!--    <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script type="text/javascript">
            // Login Page Flipbox control
            $('.login-content [data-toggle="flip"]').click(function() {
                $('.login-box').toggleClass('flipped');
                return false;
            });
        </script>

    <c:if test="${mess eq true}">
        <script type="text/javascript">
            $(document).ready(function() {
                swal("", "Username or Password incorrect", "error");
            });

        </script>
        ${mess = false}
    </c:if>
        
    <c:if test="${mess2 eq true}">
        <script type="text/javascript">
            $(document).ready(function() {
                swal("", "Login Success !", "error");
            });

        </script>
        ${mess2 = false}
    </c:if>    
        
        

    <c:if test="${eror eq true}">
        <script type="text/javascript">
            $(document).ready(function() {
                swal("", "Your account is locked, please contact Admin to unlock it", "error");
            });

        </script>
        ${eror = false}
    </c:if>
        
    <c:if test="${eror3 eq true}">
        <script type="text/javascript">
            $(document).ready(function() {
                swal("", "Account has not been registered", "error");
            });

        </script>
        ${eror = false}
    </c:if>    

</body>
</html>
