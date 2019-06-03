$(document).ready(function(){
    $(".slide-banner-tu .owl-carousel").owlCarousel({
        items: 1,
        nav: true,
        loop: true,
        autoplay: true,
        autoplayHoverPause: true,
        dots: false,
        mouseDrag: false,
        autoplayTimeout: 2000,
        autoplaySpeed: 1000,
        navSpeed: 1000
    });
  });
  $(document).ready(function(){
    $(".owl-carousel.product-slide.nothing").owlCarousel({
        items: 4,
        loop: true,
        autoplay: true,
        autoplayHoverPause: true,
        dots: false,
        mouseDrag: true,
        autoplayTimeout: 4000,
        autoplaySpeed: 2000,
        dragEndSpeed:1000
    });
  });
  $(document).ready(function(){
    $(".owl-carousel.product-slide.quanvippro").owlCarousel({
        items: 2,
        loop: true,
        autoplay: true,
        autoplayHoverPause: true,
        dots: false,
        mouseDrag: true,
        autoplayTimeout: 4000,
        autoplaySpeed: 2000,
        dragEndSpeed:1000
    });
  });
  $(document).ready(function(){
    $(".owl-carousel.left-vertical-product-slide").owlCarousel({
        items: 1,
        loop: true,
        autoplay: true,
        autoplayHoverPause: true,
        dots: false,
        mouseDrag: true,
        autoplayTimeout: 4000,
        autoplaySpeed: 2000,
        dragEndSpeed:1000
    });
  });