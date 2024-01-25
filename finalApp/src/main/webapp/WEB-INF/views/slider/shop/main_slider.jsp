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
  background-position: center;
  background-size: cover;
}

.swiper-slide img {
  display: block;
  width: 100%;
}
</style>

<div class="swiper mySwiper">
  <div class="swiper-wrapper">
    <div class="swiper-slide">
      <img src="${pageContext.request.contextPath}/resources/images/shop/shop_background01.jpg" width="1100" height="700" style="width: 1100px; height: 700px; object-fit: fill;"/>
    </div>
    <div class="swiper-slide">
      <img src="${pageContext.request.contextPath}/resources/images/shop/shop_background02.jpg" width="1100" height="700" style="width: 1100px; height: 700px; object-fit: fill;"/>
    </div>
    <div class="swiper-slide">
      <img src="${pageContext.request.contextPath}/resources/images/shop/shop_background03.jpg" width="1100" height="700" style="width: 1100px; height: 700px; object-fit: fill;"/>
    </div>
    <div class="swiper-slide">
      <img src="${pageContext.request.contextPath}/resources/images/shop/shop_background04.jpg" width="1100" height="700" style="width: 1100px; height: 700px; object-fit: fill;"/>
    </div>
    <div class="swiper-slide">
      <img src="${pageContext.request.contextPath}/resources/images/shop/shop_background05.jpg" width="1100" height="700" style="width: 1100px; height: 700px; object-fit: fill;"/>
    </div>
  </div>
  <div class="swiper-pagination"></div>
</div>

<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
  var swiper = new Swiper(".mySwiper", {
    spaceBetween: 0,
    effect: "fade",
    loop: true,
    centeredSlides: true,
    autoplay: {
      delay: 2500,
      disableOnInteraction: false,
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
  });
</script>