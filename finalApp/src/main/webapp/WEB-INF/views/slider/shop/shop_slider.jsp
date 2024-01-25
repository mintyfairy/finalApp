<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<style>
html,
body {
  position: relative;
  height: 100%;
}

body {
  background: #eee;
  font-size: 14px;
  color: #000;
  margin: 0;
  padding: 0;
}

.swiper {
  width: 100%;
  height: 100%;
}

.swiper-slide {
  text-align: center;
  font-size: 18px;
  background: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
}

.swiper-slide img {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 12px;
}

.swiper-button-next, .swiper-button-prev {
  color: #dedede;
}
</style>

<div class="swiper mySwiper1">
  <div class="swiper-wrapper">
    <div class="swiper-slide">
    	<a href="${pageContext.request.contextPath}/shop/main" style="display: inline-block; height: 100%;">
	    	<img src="${pageContext.request.contextPath}/resources/images/shop/shop02.jpg" alt="photo" width="270" height="320" style="width: 270px; heigth: 320px; object-fit: fill;">
    	</a>
    </div>
    <div class="swiper-slide">
    	<a href="${pageContext.request.contextPath}/shop/main" style="display: inline-block; height: 100%;">
    		<img src="${pageContext.request.contextPath}/resources/images/shop/shop03.jpg" alt="photo" width="270" height="320" style="width: 270px; heigth: 320px; object-fit: fill;">
    	</a>
    </div>
    <div class="swiper-slide">
    	<a href="${pageContext.request.contextPath}/shop/main" style="display: inline-block; height: 100%;">
    		<img src="${pageContext.request.contextPath}/resources/images/shop/shop04.jpg" alt="photo" width="270" height="320" style="width: 270px; heigth: 320px; object-fit: fill;">
    	</a>
    </div>
    <div class="swiper-slide">
    	<a href="${pageContext.request.contextPath}/shop/main" style="display: inline-block; height: 100%;">
    		<img src="${pageContext.request.contextPath}/resources/images/shop/shop05.jpg" alt="photo" width="270" height="320" style="width: 270px; heigth: 320px; object-fit: fill;">
    	</a>
    </div>
    <div class="swiper-slide">
    	<a href="${pageContext.request.contextPath}/shop/main" style="display: inline-block; height: 100%;">
    		<img src="${pageContext.request.contextPath}/resources/images/shop/shop06.jpg" alt="photo" width="270" height="320" style="width: 270px; heigth: 320px; object-fit: fill;">
    	</a>
    </div>
    <div class="swiper-slide">
    	<a href="${pageContext.request.contextPath}/shop/main" style="display: inline-block; height: 100%;">
    		<img src="${pageContext.request.contextPath}/resources/images/shop/shop07.jpg" alt="photo" width="270" height="320" style="width: 270px; heigth: 320px; object-fit: fill;">
    	</a>
    </div>
    <div class="swiper-slide">
    	<a href="${pageContext.request.contextPath}/shop/main" style="display: inline-block; height: 100%;">
    		<img src="${pageContext.request.contextPath}/resources/images/shop/shop08.jpg" alt="photo" width="270" height="320" style="width: 270px; heigth: 320px; object-fit: fill;">
    	</a>
    </div>
    <div class="swiper-slide">
    	<a href="${pageContext.request.contextPath}/shop/main" style="display: inline-block; height: 100%;">
    		<img src="${pageContext.request.contextPath}/resources/images/shop/shop09.jpg" alt="photo" width="270" height="320" style="width: 270px; heigth: 320px; object-fit: fill;">
    	</a>
    </div>
    <div class="swiper-slide">
    	<a href="${pageContext.request.contextPath}/shop/main" style="display: inline-block; height: 100%;">
    		<img src="${pageContext.request.contextPath}/resources/images/shop/shop10.jpg" alt="photo" width="270" height="320" style="width: 270px; heigth: 320px; object-fit: fill;">
    	</a>
    </div>
  </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-scrollbar"></div>
</div>

<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
  var swiper = new Swiper(".mySwiper1", {
    slidesPerView: 3,
    spaceBetween: 0,
    spaceBetween: 0,
    loop: true,
    scrollbar: {
      el: ".swiper-scrollbar",
      hide: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });
</script>