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
                <h1><i class="fa fa-edit"></i> Form Samples</h1>              
            </div>
            <div class="row">
                <div class="col-md"></div>
                <div class="col-md-6 col-sm-12">
                    <div class="tile">
                        <h3 class="tile-title">Detail Feedback</h3>
                        <div class="tile-body">
                            <form action="../FeedbackServlet" class="form-horizontal" method="POST"> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3"></label>

                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Subject</label>
                                    <div class="col-md-8">
                                        <input class="form-control"  name="subject" value="${feed.subject}" readonly="true" >
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Message</label>
                                <div class="col-md-8">
                                    <input class="form-control"   name="message"value="${feed.message}" readonly="true">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">ReceiveDate</label>
                                <div class="col-md-8">
                                    <input class="form-control"   name="email" value="${feed.receivedDate}" readonly="true">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Sender</label>
                                <div class="col-md-8">
                                    <input class="form-control col-md-8" name="sender" value="${feed.sender.cusEmail}"readonly="true">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Rating</label>
                                <div class="col-md-8">
                                    <input class="form-control col-md-8" name="rating" value="${feed.rating}" readonly="true">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-8 col-md-offset-3">
                                    <div class="form-check">
                                        <label class="form-check-label">

                                        </label>
                                    </div>
                                </div>
                            </div>



                        </form>
                    </div>
                    <div class="tile-footer">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-3">

                                <a href="${pageContext.request.contextPath}/showFeedbackServlet"><i class="fa fa-fw fa-lg fa-times-circle"></i>Back</a>&nbsp;&nbsp;&nbsp;
                            </div>                              
                        </div>

                    </div>
                </div>
            </div>
            <div class="clearix"></div>
            <div class="col-md"></div>

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
