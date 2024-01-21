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
  font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
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
}
</style>

<!-- Swiper -->
<div class="swiper mySwiper2">
  <div class="swiper-wrapper">
    <div class="swiper-slide">
    	<img src="${pageContext.request.contextPath}/resources/images/shop/best01.jpg" />
    </div>
    <div class="swiper-slide">
    	<img src="${pageContext.request.contextPath}/resources/images/shop/best02.jpg" />
    </div>
    <div class="swiper-slide">
    	<img src="${pageContext.request.contextPath}/resources/images/shop/best03.jpg" />
    </div>
    <div class="swiper-slide">
    	<img src="${pageContext.request.contextPath}/resources/images/shop/best04.jpg" />
    </div>
    <div class="swiper-slide">
    	<img src="${pageContext.request.contextPath}/resources/images/shop/best05.jpg" />
    </div>
    <div class="swiper-slide">
    	<img src="${pageContext.request.contextPath}/resources/images/shop/best06.jpg" />
    </div>
    <div class="swiper-slide">
    	<img src="${pageContext.request.contextPath}/resources/images/shop/best07.jpg" />
    </div>
    <div class="swiper-slide">
    	<img src="${pageContext.request.contextPath}/resources/images/shop/best08.jpg" />
    </div>
    <div class="swiper-slide">
    	<img src="${pageContext.request.contextPath}/resources/images/shop/best09.jpg" />
    </div>
    <div class="swiper-slide">
    	<img src="${pageContext.request.contextPath}/resources/images/shop/best10.jpg" />
    </div>
    <div class="swiper-slide">
    	<img src="${pageContext.request.contextPath}/resources/images/shop/best11.jpg" />
    </div>
    <div class="swiper-slide">
    	<img src="${pageContext.request.contextPath}/resources/images/shop/best12.jpg" />
    </div>
  </div>
</div>

  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
var swiper = new Swiper(".mySwiper2", {
  loop: true,
  breakpoints: {
    769: {
      slidesPerView: 4,
      slidesPerGroup: 4,
    },
  },
  autoplay: {
    delay: 2500,
    disableOnInteraction: false,
  },
});
</script>