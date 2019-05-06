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
            <div class="row">
              <div class="col-md"></div>
              <div class="col-md-6 col-sm-12">
                <div class="tile">
                  <h3 class="tile-title">Register</h3>
                  <div class="tile-body">
                      <form action="../profileServlet" class="form-horizontal" method="POST">
                      <div class="form-group row">
                        <label class="control-label col-md-3">ID</label>
                        <div class="col-md-8">
                            <input value="${p.staffID}" class="form-control" type="hidden" placeholder="Enter full name" name="id">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3">Name</label>
                        <div class="col-md-8">
                            <input class="form-control" name="name" type="text" placeholder="Enter full name">
                        </div>
                      </div>
                        <div class="form-group row">
                        <label class="control-label col-md-3">Phone</label>
                        <div class="col-md-8">
                            <input class="form-control" type="number" placeholder="Enter phone number" name="phone">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3">Email</label>
                        <div class="col-md-8">
                            <input class="form-control col-md-8" type="email" placeholder="Enter email address" name="email">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3">Address</label>
                        <div class="col-md-8">
                            <textarea class="form-control" rows="4" placeholder="Enter your address" name="address"></textarea>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3">Password</label>
                        <div class="col-md-8">
                            <input value="${p.staffPassword}" class="form-control col-md-8" type="hidden"  name="password">
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
                              <input class="form-check-input" type="checkbox">I accept the terms and conditions
                            </label>
                          </div>
                        </div>
                      </div>
                          <div class="tile-footer">
                    <div class="row">
                      <div class="col-md-8 col-md-offset-3">
                          <input class="btn btn-primary" type="submit" value="Register"></i>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
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
          </main>
  <c:import url="../templates/adminScript.jsp"></c:import>
  
    
    </body>
</html>
