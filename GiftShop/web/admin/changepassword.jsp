<%-- 
    Document   : adminIndex
    Created on : Apr 19, 2019, 7:20:11 PM
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
        <c:import url="../templates/adminPage.jsp"></c:import>
        <main class="app-content">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-edit"></i>Change Password</h1>
                   
                </div>
                
            </div>
        <c:if test="${err ne null}">
            <div class="row">
                <div class="col-md"></div>
                <div class="col-md-6 col-sm-12">
                    <div class="tile">
                        <h3 class="tile-title">Change Password</h3>
                        <div class="tile-body">
                            <form action="${pageContext.request.contextPath}/changePassServlet" name="change" class="form-horizontal" method="POST" id="submit">
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Current Password:</label>
                                    <div class="col-md-8">
                                        <input class="form-control col-md-8" type="password" name="currentPassword" id="curent">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">New Password:</label>
                                    <div class="col-md-8">
                                        <input class="form-control col-md-8" type="password" name="newPassword" id="newpass">
                                    </div>
                                </div>    
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Retype Password:</label>
                                    <div class="col-md-8">
                                        <input class="form-control col-md-8" <input type="password" name="retypePassword" id="retype">
                                    </div>
                                </div>
                                <!--                      <div class="form-group row">
                                                        <label class="control-label col-md-3">Role</label>
                                                        <div class="col-md-8">
                                                            <input class="form-control col-md-8" type="number"  name="role">
                                                        </div>
                                                      </div>
                                                      <div class="form-group row">
                                                        <label class="control-label col-md-3">Status</label>
                                                        <div class="col-md-8">
                                                            <input class="form-control col-md-1" type="checkbox"  name="status" value="true">   
                                                        </div>
                                                      </div>-->
                                <div class="form-group row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <div class="form-check">
                                            <label class="form-check-label">

                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="tile-footer">
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-3">
                                            <input class="btn btn-primary" type="submit" value="Submit" id="btnSubmit">

                                        </div>
                                    </div>
                                </div>
                            </form>

                            <div class="col-md-8 col-md-offset-3">
                                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/profileServlet?action=profile"><i class="fa fa-fw fa-lg fa-times-circle"></i>Back</a>

                            </div>

                        </div>

                    </div>
                </div>
                <div class="clearix"></div>
                <div class="col-md"></div>
            </div>
        </c:if>
        <c:if test="${err eq null}">
            <div class="row">
                <div class="col-md"></div>
                <div class="col-md-6 col-sm-12">
                    <div class="tile">
                        <h3 class="tile-title">Change Password</h3>
                        <div class="tile-body">
                            <form action="${pageContext.request.contextPath}/changePassServlet" name="change" class="form-horizontal" method="POST" id="submit">
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Current Password:</label>
                                    <div class="col-md-8">
                                        <input class="form-control col-md-8" type="password" name="currentPassword" id="curent">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">New Password:</label>
                                    <div class="col-md-8">
                                        <input class="form-control col-md-8" type="password" name="newPassword" id="newpass">
                                    </div>
                                </div>    
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Retype Password:</label>
                                    <div class="col-md-8">
                                        <input class="form-control col-md-8" <input type="password" name="retypePassword" id="retype">
                                    </div>
                                </div>
                                <!--                      <div class="form-group row">
                                                        <label class="control-label col-md-3">Role</label>
                                                        <div class="col-md-8">
                                                            <input class="form-control col-md-8" type="number"  name="role">
                                                        </div>
                                                      </div>
                                                      <div class="form-group row">
                                                        <label class="control-label col-md-3">Status</label>
                                                        <div class="col-md-8">
                                                            <input class="form-control col-md-1" type="checkbox"  name="status" value="true">   
                                                        </div>
                                                      </div>-->
                                <div class="form-group row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <div class="form-check">
                                            <label class="form-check-label">

                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <input class="btn btn-primary" type="submit" value="Submit" id="btnSubmit">

                                    </div>
                                </div>
                            </form>
                            <div class="tile-footer">
                                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/profileServlet?action=profile"></i>Back</a>
                            </div>





                        </div>

                    </div>
                </div>
                <div class="clearix"></div>
                <div class="col-md"></div>
            </div>
        </c:if>
    </main>
    <c:import url="../templates/adminScript.jsp"></c:import>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>
        <!--    <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <c:if test="${msg eq true}">
        <script type="text/javascript">
            $(document).ready(function() {
                swal("", "${message}", "error");
            });

        </script>
        ${msg = false}
    </c:if>

    <c:if test="${loi1 eq true}">
        <script type="text/javascript">
            $(document).ready(function() {
                swal("", "${abc}", "error");
            });

        </script>
    </c:if>

    <c:if test="${err1 eq true}">
        <script type="text/javascript">
            $(document).ready(function() {
                swal("", "Current Password incorrect", "error");
            });

        </script>
        ${err1 = false}
    </c:if>


    <script>
        var inputs = document.forms['change'].getElementsByTagName('input');
        var run_onchange = false;
        function valid() {
            var errors = false;

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


                    // Kiểm tra password
                    if (id === 'curent') {
                        if (reg_pass.test(value) === false) {
                            span.innerHTML = '<span class=\"error-form\" style=\"color: red;\">Password Incorrect</span>';
                        }

                        if (value.length < 6) {
                            span.innerHTML = '<span class=\"error-form\" style=\"color: red;\">Password must have 6 to 22 character</span>';
                        }

                    }
                    if (id === 'newpass') {
                        if (reg_pass.test(value) === false) {
                            span.innerHTML = '<span class=\"error-form\" style=\"color: red;\">Password Incorrect</span>';
                        }

                        if (value.length < 6) {
                            span.innerHTML = '<span class=\"error-form\" style=\"color: red;\">Password must have 6 to 22 character</span>';
                        }

                    }
                    if (id === 'retype') {
                        if (reg_pass.test(value) === false) {
                            span.innerHTML = '<span class=\"error-form\" style=\"color: red;\">Password Incorrect</span>';
                        }

                        if (value.length < 6) {
                            span.innerHTML = '<span class=\"error-form\" style=\"color: red;\">Password must have 6 to 22 character</span>';
                        }

                    }

                    // Kiểm tra số điện thoại
                }

                // Nếu có lỗi thì chèn span vào hồ sơ, chạy onchange, submit return false, highlight border
                if (span.innerHTML != '') {
                    inputs[i].parentNode.appendChild(span);
                    errors = true;
                    run_onchange = true;
                    inputs[i].style.border = '1px solid #c6807b';
                    inputs[i].style.background = '#fffcf9';
                }
            }// end for

            //if(errors === false){alert('Register Success');}
            return !errors;
        }// end valid()

        // Chạy hàm kiểm tra valid()
        var register = document.getElementById('submit');
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
