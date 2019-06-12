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
        <c:import url="../templates/adminHead.jsp"></c:import>
    </head>
    <body class="app sidebar-mini rtl">
    
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
                    <form class="login-form" action="${pageContext.request.contextPath}/loginStafftServlet" method="POST" name="resetpass">

                        <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
                        <div class="form-group">
                            <label class="control-label">USERNAME</label>
                            <input class="form-control" type="email" name="email" placeholder="Email" autofocus id="email" required="">
                        </div>
                        <div class="form-group">
                            <label class="control-label">PASSWORD</label>
                            <input class="form-control" type="password" name="password" placeholder="Password" id="password" required="">
                        </div>
                        <div class="form-group">
                            <div class="utility">
                                <div class="animated-checkbox">
                                    <!--                                    <label>
                                                                            <input type="checkbox"><span class="label-text">Stay Signed in</span>
                                                                        </label>-->
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
                            <input class="form-control" type="email" name="abcxyz" placeholder="Email"  id="email" required="">
                        </div>
                        <div class="form-group btn-container">
                            <button class="btn btn-primary btn-block" id="submit"><i class="fa fa-unlock fa-lg fa-fw"></i>RESET</button>
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
                    <form class="login-form" action="${pageContext.request.contextPath}/loginStafftServlet" method="POST" name="resetpass">

                        <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
                        <div class="form-group">
                            <label class="control-label">USERNAME</label>
                            <input class="form-control" type="email" name="email" placeholder="Email" autofocus id="email" required="">
                        </div>
                        <div class="form-group">
                            <label class="control-label">PASSWORD</label>
                            <input class="form-control" type="password" name="password" placeholder="Password" id="password" required="">
                        </div>
                        <div class="form-group">
                            <div class="utility">
                                <div class="animated-checkbox">
                                    <!--                                    <label>
                                                                            <input type="checkbox"><span class="label-text">Stay Signed in</span>
                                                                        </label>-->
                                </div>
                                <p class="semibold-text mb-2"><a href="#" data-toggle="flip">Forgot Password ?</a></p>
                            </div>
                        </div>
                        <div class="form-group btn-container">
                            <button class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>SIGN IN</button>
                        </div>
                    </form>
                <form class="forget-form" action="${pageContext.request.contextPath}/ResetPasswordServlet" method="post" name="resetpass">
                    <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>Forgot Password ?</h3>
                    <div class="form-group">
                        <label class="control-label">EMAIL</label>
                        <input class="form-control" type="text" name="abcxyz" id="email" placeholder="Email" required="">
                    </div>
                    <div class="form-group btn-container">
                        <button class="btn btn-primary btn-block" id="submit"> <i class="fa fa-unlock fa-lg fa-fw"></i>RESET</button>
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
        
        <c:if test="${mess3 eq true}">
        <script type="text/javascript">
            $(document).ready(function() {
                swal("", "Username or Password incorrect", "error");
            });

        </script>
        ${mess3 = false}
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



    <c:if test="${loi eq true}">
        <script type="text/javascript">
            $(document).ready(function() {
                swal("", "${abc}", "error");
            });

        </script>
    </c:if>
    <c:if test="${loi1 eq true}">
        <script type="text/javascript">
            $(document).ready(function() {
                swal("", "${abc}", "success");
            });

        </script>
    </c:if>


    <script>
        var inputs = document.forms['register'].getElementsByTagName('input');
        var run_onchange = false;
        function valid() {
            var errors = false;
            var reg_mail = /^[A-Za-z0-9]+([_\.\-]?[A-Za-z0-9])*@[A-Za-z0-9]+([\.\-]?[A-Za-z0-9]+)*(\.[A-Za-z]+)+$/;
            var reg_pass = /^[a-zA-Z0-9]{6,22}$/;

            for (var i = 0; i < inputs.length; i++) {
                var value = inputs[i].value;
                var id = inputs[i].getAttribute('id');

                // Tạo phần tử span lưu thông tin lỗi
                var span = document.createElement('span');
                // Nếu span đã tồn tại thì remove
                var p = inputs[i].parentNode;
                if (p.lastChild.nodeName === 'SPAN') {
                    p.removeChild(p.lastChild);
                }

                // Kiểm tra rỗng
                if (value === '') {
                    span.innerHTML = '<span class=\"error-form\" style=\"color: red;\">This filed cannot be blank!</span>';
                } else {
                    // Kiểm tra các trường hợp khác
                    if (id === 'email') {
                        if (reg_mail.test(value) === false) {
                            span.innerHTML = '<span class=\"error-form\" style=\"color: red;\">Email Invalid (Exp: abc@gmail.com)</span>';
                        }

                    }


                    // Kiểm tra password
                    if (id === 'password') {
                        if (reg_pass.test(value) === false) {
                            span.innerHTML = 'Password Incorrect';
                        }

                        if (value.length < 6) {
                            span.innerHTML = '<span class=\"error-form\" style=\"color: red;\">Password must have 6 to 22 character</span>';
                        }

                    }




                    // Nếu có lỗi thì chèn span vào hồ sơ, chạy onchange, submit return false, highlight border
                    if (span.innerHTML != '') {
                        inputs[i].parentNode.appendChild(span);
                        errors = true;
                        run_onchange = true;
                        inputs[i].style.border = '1px solid #c6807b';
                        inputs[i].style.background = '#fffcf9';
                    }
                    // end for

                    //if(errors === false){alert('Register Success');}
                    return !errors;
                }
            }
        }// end valid()

        // Chạy hàm kiểm tra valid()
        var register == document.getElementById('submit');
        register.onclick = function() {
            return valid();
        }

        // Kiểm tra lỗi với sự kiện onchange -> gọi lại hàm valid()
        for (var i = 0; i < inputs.length; i++) {
            var id = inputs[i].getAttribute('id');
            inputs[i].onchange = function() {
                if (run_onchange == true) {
                    this.style.border = '1px solid #999';
                    this.style.background = '#fff';
                    valid();
                }
            }
        }// end for
    </script>

</body>
</html>
