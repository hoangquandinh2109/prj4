<%-- 
    Document   : head
    Created on : Apr 13, 2019, 11:05:51 AM
    Author     : johnn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/library/fontawesome/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/library/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/library/owlcarousel/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/library/animatecss/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cart.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/fav.png">

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/angular_material/1.1.12/angular-material.min.css">
<title>GiftStore - ${pagename}</title>
<style>

#dangcap{
  -webkit-animation-name: dangcap; /* Safari 4.0 - 8.0 */
  -webkit-animation-duration: 1s; /* Safari 4.0 - 8.0 */
  animation-name: dangcap;
  animation-duration: 1.5s;
  position: fixed;
  z-index: 1000000000000;
}

/* Standard syntax */
@keyframes dangcap {
  0%   {
      background-color: #f5f5f5;
      /*opacity: 1;*/
      top: 0;
      bottom: 0;
      right: 0;
      left: 0;
  }
  66%  {
      background-color: #f5f5f5;
      /*opacity: 1;*/
      top: 0;
      bottom: 0;
      right: 0;
      left: 0;
  }
  100% {
      background-color: transparent;
      /*opacity: 0;*/
      top: 50%;
      bottom: 50%;
      right: 50%;
      left: 50%;
      
  } 
}
</style>