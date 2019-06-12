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
                    <h1><i class="fa fa-edit"></i>Profile</h1>
                    
                </div>
                
            </div>
            <div class="row">
                <div class="col-md"></div>
                <div class="col-md-6 col-sm-12">
                    <div class="tile">
                        <h3 class="tile-title">My Profile</h3>
                        <div class="tile-body">




                            <div class="form-group row">
                                <label class="control-label col-md-3"></label>
                                <div class="col-md-8">
                                    <input class="form-control" type="hidden" placeholder="Enter full name" name="id" value="${staff.staffID}" readonly="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3">Name*</label>
                            <div class="col-md-8">
                                <input class="form-control" name="name" type="text" placeholder="Enter full name" value="${staff.staffName}" readonly="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3">Phone*</label>
                            <div class="col-md-8">
                                <input class="form-control" type="number" placeholder="Enter phone number" name="phone" value="${staff.staffPhone}" readonly="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3">Email*</label>
                            <div class="col-md-8">
                                <input class="form-control" type="email" placeholder="Enter email address" name="email"value="${staff.staffEmail}" readonly="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3">Address*</label>
                            <div class="col-md-8">
                                <input class="form-control" rows="4" placeholder="Enter your address" name="address" value="${staff.staffAddress}" readonly="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3"></label>
                            <div class="col-md-8">
                                <input class="form-control col-md-8"  type="hidden" name="password" value="${staff.staffPassword}" readonly="">
                            </div>
                        </div>
                        <input class="form-control" type="hidden" placeholder="Enter full name" name="role" value="${staff.role}"readonly="">
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
                                    <a href="${pageContext.request.contextPath}/admin/updateprofile.jsp">Edit Profile</a>&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath}/admin/changepassword.jsp">Change Password</a>&nbsp;&nbsp;&nbsp;
                                </div>                              
                            </div>

                        </div>

                    </div>

                </div>
            </div>
            <div class="clearix"></div>
            <div class="col-md"></div>
        </div>
        <div>
        </div>
        <div>
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

</body>
</html>
