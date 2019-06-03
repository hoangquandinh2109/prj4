<%-- 
    Document   : trangMau
    Created on : Apr 28, 2019, 11:53:52 PM
    Author     : bemap
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--BUOC 1 import adminHead.jsp trong the <head></head>
         
         Buoc 2 import adminPage sau the <body>
         Buoc 3 code trong the <main><row></main>
         //DUNG BOOTSTRAP HAY CHINH FONT END CHO FORM THEM DEP
         Buoc 4 import scrpit o cuoi the body
         CHAY TRUDC TIEP O FILE NAY LUON Shift+F6
    -->
    <head>
        <c:import url="../templates/adminHead.jsp"></c:import>
        </head>
        <body>
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
            <div class="row">
              <div class="col-md"></div>
              <div class="col-md-6 col-sm-12">
                <div class="tile">
                  <h3 class="tile-title">Register</h3>
                  <div class="tile-body">
                    <form class="form-horizontal">
                      <div class="form-group row">
                        <label class="control-label col-md-3">Name</label>
                        <div class="col-md-8">
                          <input class="form-control" type="text" placeholder="Enter full name">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3">Email</label>
                        <div class="col-md-8">
                          <input class="form-control col-md-8" type="email" placeholder="Enter email address">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3">Address</label>
                        <div class="col-md-8">
                          <textarea class="form-control" rows="4" placeholder="Enter your address"></textarea>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3">Gender</label>
                        <div class="col-md-9">
                          <div class="form-check">
                            <label class="form-check-label">
                              <input class="form-check-input" type="radio" name="gender">Male
                            </label>
                          </div>
                          <div class="form-check">
                            <label class="form-check-label">
                              <input class="form-check-input" type="radio" name="gender">Female
                            </label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3">Identity Proof</label>
                        <div class="col-md-8">
                          <input class="form-control" type="file">
                        </div>
                      </div>
                      <div class="form-group row">
                        <div class="col-md-8 col-md-offset-3">
                          <div class="form-check">
                            <label class="form-check-label">
                              <input class="form-check-input" type="checkbox">I accept the terms and conditions
                            </label>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                  <div class="tile-footer">
                    <div class="row">
                      <div class="col-md-8 col-md-offset-3">
                        <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>Register</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
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
</body>
</html>
