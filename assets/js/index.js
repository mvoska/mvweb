$(document).ready(function(){
  $('#nav').localScroll(1000);
  $('#nav2').localScroll(1000);
  $('#nav3').localScroll(1000);
  $('#nav4').localScroll(1000);
  $('#nav5').localScroll(1000);
  //.parallax(xPosition, speedFactor, outerHeight) options:
  //xPosition - Horizontal position of the element
  //inertia - speed to move relative to vertical scroll. Example: 0.1 is one tenth the speed of scrolling, 2 is twice the speed of scrolling
  //outerHeight (true/false) - Whether or not $ should use it's outerHeight option to determine when a section is in the viewport
  $('#header-section').parallax("50%", 0.1);
  $('#features-section').parallax("50%", 0.1);
  $('#team-section').parallax("50%", 0.1);
  $('.bg').parallax("50%", 0.3);
  $('#portfolio-section').parallax("50%", 0.3);
  $('#contact-section').parallax("50%", 0.1);
})
$('#slogan-section-2 .parallax-point-event').bind('inview', function (event, visible) {
  if (visible == true) {
    $('.browser-shot-1').addClass("active");
    $('.browser-shot-2').addClass("active");
    $('.browser-shot-3').addClass("active");
  }else{
    $('.browser-shot-1').removeClass("active");
    $('.browser-shot-2').removeClass("active");
    $('.browser-shot-3').removeClass("active");
  }
});
$('#header-section').bind('inview', function (event, visible) {
  if (visible == true) {
    $('.gobottom').addClass("active");
    $('.hero-unit h1 span').addClass("active");
  }else{
    $('.gobottom').removeClass("active");
    $('.hero-unit h1 span').removeClass("active");
  }
});
var hero = $('#header-section .hero-unit');
$(window).scroll(function () {
  if ($(this).scrollTop() > 550) {
    hero.addClass("hide");
  } else {
    hero.removeClass("hide");
  }
});
var navbar = $('#navbartop');
var navbartop = $('#topnavbar');
$(window).scroll(function () {
  if ($(this).scrollTop() > 640) {
    navbar.addClass("navbar-scroll");
    navbartop.removeClass("navbar-static-top");
    navbartop.addClass("navbar-fixed-top");
  } else {
    navbar.removeClass("navbar-scroll");
    navbartop.removeClass("navbar-fixed-top");
    navbartop.addClass("navbar-static-top");
  }
});
$('#download-resume').click(function() {
  ga('send', 'event', {
    eventCategory: 'Resume',
    eventAction: 'View/Download'
  });
})
