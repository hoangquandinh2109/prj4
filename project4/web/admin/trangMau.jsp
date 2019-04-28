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
        <p>CODE CONTENT HERE</p>
    </div>
  </main>
             <c:import url="../templates/adminScript.jsp"></c:import>
    </body>
</html>
