<%-- 
    Document   : managerMenu
    Created on : Apr 22, 2019, 3:47:27 PM
    Author     : bemap
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
    
<link rel="stylesheet" href="../assets/css/adminContent.css">
<link rel="stylesheet" href="../assets/css/adminStyle.css">
<title>CANG CU COT ADMIN V.</title>
    </head> 
    <body>
        <div class="header" id="header">
            <div class="logo">
                <a href="#">Xero
                    <span>Source</span>
                </a>
            </div>
        </div>
        <!--<a class="mobile" href="#">MENU</a> -->
        <div id="container">
            <div class="sidebar">
              <ul class="nav">
                  <li><a href="#">Create new Staff</a></li>
                  <li><a href="#">View product</a></li>
                  <li><a href="#">Get report</a></li>
                  <li><a href="#">View feedback</a></li>
                  <li><a href="#">Account list</a></li>
              </ul>     
            </div>
            <c:import url="insertPro.jsp"></c:import>
           
        </div>
</body>
</html>
