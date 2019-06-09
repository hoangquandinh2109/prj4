<%-- 
    Document   : reportProduct
    Created on : Jun 9, 2019, 2:17:30 PM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="../templates/adminHead.jsp"></c:import>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <!--            <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
                        <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
                        <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js" ></script>-->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

            <!-- Optional theme -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />

            <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
        <c:import url="../templates/adminPage.jsp"></c:import>
            <style>
                input[type="text"], textarea, input[type="password"] {
                    font-size: 16px;
                    border: 1px solid #ececec75;
                    width: 50%;
                    padding: 12px 20px;
                    margin: 0 0 8px 0;
                    resize: none;
                    background: #f5f5f5;
                    -webkit-appearance: none;
                    border-radius: 2px;
                    font-weight: 200;
                }

                .flex-row {
                    display: flex;
                    flex: 1;
                }

                .flex-col-sm-5 {
                    flex: 1;
                    padding: 0 10px;
                }
                .form-field-wrapper {
                    margin: 0 0 20px 0;
                }

                span.input-group-addon {
                    background: transparent;
                    position: absolute;
                    border: 0;
                    top: 41%;
                    right: 0;
                    display: block;
                    width: 100%;
                    height: 100%;
                    text-align: right;
                    transform: translateY(-50%);
                    display: flex;
                    justify-content: flex-end;
                    align-items: center;
                }
            </style>
        </head>
        <body>
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
            <div class="row">        
                <div class="col-md"></div>
                <div class="col-md-6 col-sm-12">
                    <div class="tile">
                        <h3 class="tile-title">Report by Product </h3>
                        <div class="tile-body">
                            <form class="form-horizontal" action="reportServlet" method="post" >
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Product<span class="required">*</span></label>
                                    <div class="col-md-8">
                                        <select name="productID"  required class="form-control">
                                            <option value="">Select Product</option>
                                        <c:forEach var="c" items="${proList}">
                                            <option value="${c.proID}">${c.proName}</option>
                                        </c:forEach>
                                    </select>    
                                </div>
                            </div>
                                <hr/>
                                <br/>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Date Start<span class="required">*</span></label>
                                <div class="input-group date datetimepickerclass col-md-8 " id="datetimepicker1">
                                    <input type="text" name="dateSt" id="datetimepicker1"   placeholder="Start Date">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">End<span class="required">*</span></label>
                                <div class="input-group date datetimepickerclass col-md-8" id="datetimepicker2">
                                    <input type="text" name="dateEnd"  id="datetimepicker2" placeholder="End Date">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div
                            </div>
                                                     <!--       <label class="control-label col-md-3">Date Release<span class="required">*</span></label>
                                                            <div class="col-md-4">
                                                              
                                                                    <input class="form-control" type="text" pattern="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d" required name="dateSt" id="datepicker" placeholder="Enter product DateRelease" autocomplete="off">
                                                               
                                                            </div>
                                                            <div class="col-md-4">
                                                               
                                                                    <input class="form-control" type="text" pattern="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d" required name="dateEnd" id="datepicker1" placeholder="Enter product DateRelease" autocomplete="off">
                                                              
                                                            </div>-->

                    
                    <div class="tile-footer">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-3">
                                <input type="submit" class="btn btn-primary" value="Ok" />
                                <input type="reset" class="btn btn-secondary" value="Cancel" /> 
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
                </div>
        <div class="clearix"></div>
        <div class="col-md"></div>
           
</main>
</body>
<!--
<script>
    $('#datepicker').datepicker({
        uiLibrary: 'bootstrap4', maxDate: new Date, minDate: new Date(2019, 01, 01)});
    $('#datepicker1').datepicker({
        uiLibrary: 'bootstrap4', maxDate: new Date, minDate: moment().add(1)});
</script>-->
<%--<c:import url="../templates/scriptPrint.jsp"></c:import>--%>
<script>
    $(function() {


        var start_date1 = '';
        var end_date1 = '';

        if (start_date1 == '' && end_date1 == '')
        {
            $('#datetimepicker1').datetimepicker({
                useCurrent: false,
                format: 'DD/MM/YYYY'
            }).on('dp.change', function(e) {
                console.log('here1');
                console.log(e);

                $(".day").click(function() {
                    $("a[data-action='togglePicker']").trigger('click');
                });


                $('#datetimepicker2').data("DateTimePicker").minDate(e.date);


            });


            $('#datetimepicker2').datetimepicker({
                useCurrent: false,
                format: 'DD/MM/YYYY'
            }).on('dp.change', function(e) {
                console.log(e);
                console.log('here2');
                $('#datetimepicker1').data("DateTimePicker").maxDate(e.date);


            });
        }










    });






    $("#beacon").change(function() {
        alert($(this).val());
    });
</script>
</html>
