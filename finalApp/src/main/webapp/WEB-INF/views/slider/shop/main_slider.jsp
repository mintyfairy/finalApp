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
      <!-- <a href="https://kr.freepik.com/free-vector/illustration-drawing-style-of-camping-icons-collection_2799380.htm#query=%EC%BA%A0%ED%95%91&position=42&from_view=search&track=sph&uuid=2dd630b6-ba36-4724-abf4-708f4367e5ed">작가 rawpixel.com</a> 출처 Freepik -->
    </div>
    <div class="swiper-slide">
      <img src="${pageContext.request.contextPath}/resources/images/shop/shop_background02.jpg" width="1100" height="700" style="width: 1100px; height: 700px; object-fit: fill;"/>
      <!-- <a href="https://kr.freepik.com/free-vector/camping-composition-with-two-tents-fire-cool-box-with-trees-and-night-sky-cartoon_13749106.htm#query=%EC%BA%A0%ED%95%91&position=47&from_view=search&track=sph&uuid=d40c1b41-8d24-44f0-a9b4-3da21310058b">작가 macrovector</a> 출처 Freepik -->
    </div>
    <div class="swiper-slide">
      <img src="${pageContext.request.contextPath}/resources/images/shop/shop_background03.jpg" width="1100" height="700" style="width: 1100px; height: 700px; object-fit: fill;"/>
      <!-- <a href="https://www.freepik.com/free-vector/summer-camp-with-tent-bonfire-backpack-van_12760323.htm#page=3&query=%EC%BA%A0%ED%95%91&position=10&from_view=search&track=ais&uuid=6343385c-5076-485d-9d12-7db013e2fa87">Image by upklyak</a> on Freepik -->
    </div>
    <div class="swiper-slide">
      <img src="${pageContext.request.contextPath}/resources/images/shop/shop_background04.jpg" width="1100" height="700" style="width: 1100px; height: 700px; object-fit: fill;"/>
    </div>
    <div class="swiper-slide">
      <img src="${pageContext.request.contextPath}/resources/images/shop/shop_background05.jpg" width="1100" height="700" style="width: 1100px; height: 700px; object-fit: fill;"/>
	  <!-- <a href="https://www.freepik.com/free-vector/glamping-flat-concept-with-people-seating-outside-modern-camping-lounge-tent-vector-illustration_41684316.htm#page=6&query=%EC%BA%A0%ED%95%91&position=4&from_view=search&track=ais&uuid=6343385c-5076-485d-9d12-7db013e2fa87">Image by macrovector</a> on Freepik -->
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