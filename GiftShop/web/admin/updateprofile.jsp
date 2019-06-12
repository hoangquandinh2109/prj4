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
                    <h1><i class="fa fa-edit"></i>Edit Profile</h1>

                </div>

            </div>
            <div class="row">
                <div class="col-md"></div>
                <div class="col-md-6 col-sm-12">
                    <div class="tile">
                        <h3 class="tile-title">Edit Profile</h3>
                        <div class="tile-body">
                            <form action="../profileServlet" class="form-horizontal" name="register" method="POST">
                                <div class="form-group row">
                                    <label class="control-label col-md-3"></label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="hidden" placeholder="Enter full name" name="id" value="${staff.staffID}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Name*</label>
                                <div class="col-md-8">
                                    <input class="form-control" name="name" type="text" placeholder="Enter full name" value="${staff.staffName}" id="name">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Phone*</label>
                                <div class="col-md-8">
                                    <input class="form-control" type="text" placeholder="Enter phone number" name="phone" value="${staff.staffPhone}" id="phone">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Email*</label>
                                <div class="col-md-8">
                                    <input class="form-control" type="email" placeholder="Enter email address" name="email"value="${staff.staffEmail}" id="email" >
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Address*</label>
                                <div class="col-md-8">
                                    <input class="form-control"  rows="4" placeholder="Enter your address" name="address" value="${staff.staffAddress}" id="address">
                                </div>
                            </div>
                            
                                                  
                            <div class="form-group row">
                                <div class="col-md-8 col-md-offset-3">
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input class="btn btn-primary" type="submit" id="submit" value="Update"   name="action"  onclick="valid()"></i>&nbsp;&nbsp;&nbsp;     
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-8 col-md-offset-3">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/profile.jsp">Back to Profile</a>&nbsp;&nbsp;&nbsp;     
                                </label>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="clearix"></div>
            <div class="col-md"></div>
        </div>
    </main>
    <c:import url="../templates/adminScript.jsp"></c:import>

        <script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>
        <!--    <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <c:if test="${msg eq true}">
        <script type="text/javascript">
                                                $(document).ready(function() {
                                                    swal("", "Change Password success", "success");
                                                });

        </script>
        ${msg = false}
    </c:if>

    <script>
    var inputs = document.forms['register'].getElementsByTagName('input');
  var run_onchange = false;
  function valid(){
   var errors = false;
   var reg_mail = /^[A-Za-z0-9]+([_\.\-]?[A-Za-z0-9])*@[A-Za-z0-9]+([\.\-]?[A-Za-z0-9]+)*(\.[A-Za-z]+)+$/;
   var reg_pass = /^[a-zA-Z0-9]{6,22}$/;
   
   for(var i=0; i<inputs.length; i++){
    var value = inputs[i].value;
    var id = inputs[i].getAttribute('id');
    
    // Tạo phần tử span lưu thông tin lỗi
    var span = document.createElement('span');
    // Nếu span đã tồn tại thì remove
    var p = inputs[i].parentNode;
    if(p.lastChild.nodeName === 'SPAN') {p.removeChild(p.lastChild);}
   
    // Kiểm tra rỗng
    if(value === ''){
     span.innerHTML ='<span class=\"error-form\" style=\"color: red;\">This filed cannot be blank!</span>';
    }else{
    // Kiểm tra các trường hợp khác
     if(id === 'email'){
      if(reg_mail.test(value) === false){ span.innerHTML ='<span class=\"error-form\" style=\"color: red;\">Email Invalid (Exp: abc@gmail.com)</span>';}
      
     }
     if(id === 'address'){
        if(value.length <2){span.innerHTML ='<span class=\"error-form\" style=\"color: red;\">address at least 2 character</span>';}

     }
     
     // Kiểm tra password
//     if(id === 'password'){
//      if(reg_pass.test(value) === false){ span.innerHTML ='Password Incorrect';}
//   
//      if(value.length <6){span.innerHTML ='<span class=\"error-form\" style=\"color: red;\">Password must have 6 to 22 character</span>';}
//      
//     }
   
     // Kiểm tra số điện thoại
     if(id === 'phone' && isNaN(value) === true)
     {span.innerHTML ='<span class=\"error-form\" style=\"color: red;\">The phone is number</span>';}
     if(id === 'phone'){
         if(value.length <10){span.innerHTML ='<span class=\"error-form\" style=\"color: red;\">Phone is greater than 10 character</span>';}
     }
    }
   
    // Nếu có lỗi thì chèn span vào hồ sơ, chạy onchange, submit return false, highlight border
    if(span.innerHTML != ''){
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
  register.onclick = function(){
   return valid();
  }
 
  // Kiểm tra lỗi với sự kiện onchange -> gọi lại hàm valid()
   for(var i=0; i<inputs.length; i++){
    var id = inputs[i].getAttribute('id');
    inputs[i].onchange = function(){
     if(run_onchange == true){
      this.style.border = '1px solid #999';
      this.style.background = '#fff';
      valid();
     }
    }
   }// end for
</script>
</body>
</html>
