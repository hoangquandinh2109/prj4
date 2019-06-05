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
                    <h1><i class="fa fa-edit"></i> Form Samples</h1>
                    <p>Sample forms</p>
                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item">Forms</li>
                    <li class="breadcrumb-item"><a href="#">Sample Forms</a></li>
                </ul>
            </div>
        <c:if test="${err ne null}">
            <div class="row">
                <div class="col-md"></div>
                <div class="col-md-6 col-sm-12">
                    <div class="tile">
                        <h3 class="tile-title">Change Password</h3>
                        <div class="tile-body">
                            <form action="${pageContext.request.contextPath}/changePassServlet" class="form-horizontal" method="POST" id="submit">
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Current Password:</label>
                                    <div class="col-md-8">
                                        <input class="form-control col-md-8" type="password" name="currentPassword">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">New Password:</label>
                                    <div class="col-md-8">
                                        <input class="form-control col-md-8" type="password" name="newPassword" id="newPassword">
                                    </div>
                                </div>    
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Retype Password:</label>
                                    <div class="col-md-8">
                                        <input class="form-control col-md-8" <input type="password" name="retypePassword" id="retypePassword">
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
                                            <input class="btn btn-primary" type="submit" value="Submit" id="btnSubmit"></i>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
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
                            <form action="${pageContext.request.contextPath}/changePassServlet" class="form-horizontal" method="POST" id="submit">
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Current Password:</label>
                                    <div class="col-md-8">
                                        <input class="form-control col-md-8" type="password" name="currentPassword">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">New Password:</label>
                                    <div class="col-md-8">
                                        <input class="form-control col-md-8" type="password" name="newPassword" id="newPassword">
                                    </div>
                                </div>    
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Retype Password:</label>
                                    <div class="col-md-8">
                                        <input class="form-control col-md-8" <input type="password" name="retypePassword" id="retypePassword">
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
                                            <input class="btn btn-primary" type="submit" value="Submit" id="btnSubmit"></i>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
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

    <c:if test="${err1 eq true}">
        <script type="text/javascript">
            $(document).ready(function() {
                swal("", "Current Password incorrect", "error");
            });

        </script>
        ${err1 = false}
    </c:if>

</body>
</html>
