<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<style>
@charset "utf-8";
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
}
</style>
	
    <!-- Swiper -->
    <div class="swiper mySwiper4">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
            <div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath}/resources/images/campingcar/caravanpic1.jpg" class="card-img-top" alt="..." style="background-size: cover;">
			  <div class="card-body">
			    <h5 class="card-title">르노마스터 캠핑카</h5>
			    <p class="card-text">5명이서 자도 넉넉한 공간으로 캠핑을 낙낙하게 즐겨보세요</p>
			    <a href="http://localhost:9090/plus/car/car_detail?carNum=62" class="btn btn-primary carbutton">보러가기</a>
			  </div>
			</div>
            </div>
            <div class="swiper-slide">
            	<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath}/resources/images/campingcar/caravanpic2.png" class="card-img-top" alt="..." style="background-size: cover;">
			  <div class="card-body">
			    <h5 class="card-title">쏠라티</h5>
			    <p class="card-text">현대자동차에서 제작한 유럽식 럭셔리 캠핑카</p>
			    <a href="http://localhost:9090/plus/car/car_detail?carNum=55" class="btn btn-primary carbutton">보러가기</a>
			  </div>
			</div>
            </div>
            <div class="swiper-slide">
            	<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath}/resources/images/campingcar/caravanpic3.png" class="card-img-top" alt="..." style="background-size: cover;">
			  <div class="card-body">
			    <h5 class="card-title">코치멘 오라이온 20tb</h5>
			    <p class="card-text">세련된 감성의 캠핑을 즐겨보세요</p>
			    <a href="http://localhost:9090/plus/car/car_detail?carNum=56" class="btn btn-primary carbutton">보러가기</a>
			  </div>
			</div>
            </div>
            <div class="swiper-slide">
            	<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath}/resources/images/campingcar/caravanpic4.png" class="card-img-top" alt="..." style="background-size: cover;">
			  <div class="card-body">
			    <h5 class="card-title">포터 캠핑카</h5>
			    <p class="card-text">독일 명품 캠핑카</p>
			    <a href="http://localhost:9090/plus/car/car_detail?carNum=57" class="btn btn-primary carbutton">보러가기</a>
			  </div>
			</div>
            </div>
            <div class="swiper-slide">
            	<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath}/resources/images/campingcar/ray.png" class="card-img-top" alt="..." style="background-size: cover;">
			  <div class="card-body">
			    <h5 class="card-title">레이</h5>
			    <p class="card-text">아늑한 분위기 커플 추천 캠핑카</p>
			    <a href="http://localhost:9090/plus/car/car_detail?carNum=54" class="btn btn-primary carbutton">보러가기</a>
			  </div>
			</div>
            </div>
            <div class="swiper-slide">
            	<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath}/resources/images/campingcar/canibal.png" class="card-img-top" alt="..." style="background-size: cover;">
			  <div class="card-body">
			    <h5 class="card-title">루프탑 카니발</h5>
			    <p class="card-text">캠핑의 밤, 루프탑에서 감성을 느껴보세요</p>
			    <a href="http://localhost:9090/plus/car/car_detail?carNum=61" class="btn btn-primary carbutton">보러가기</a>
			  </div>
			</div>
            </div>
            <div class="swiper-slide">
            	<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath}/resources/images/campingcar/casper.jpg" class="card-img-top" alt="..." style="background-size: cover;">
			  <div class="card-body">
			    <h5 class="card-title">캐스퍼 캠핑카</h5>
			    <p class="card-text">귀엽고 깜찍한 디자인으로 솔로캠핑 추천</p>
			    <a href="http://localhost:9090/plus/car/car_detail?carNum=59" class="btn btn-primary carbutton">보러가기</a>
			  </div>
			</div>
            </div>
             <div class="swiper-slide">
            	<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath}/resources/images/campingcar/caravanpic3.png" class="card-img-top" alt="..." style="background-size: cover;">
			  <div class="card-body">
			    <h5 class="card-title">코치멘 오라이온 20tb</h5>
			    <p class="card-text">세련된 감성의 캠핑을 즐겨보세요</p>
			    <a href="http://localhost:9090/plus/car/car_detail?carNum=56" class="btn btn-primary carbutton">보러가기</a>
			  </div>
			</div>
            </div>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
    var swiper = new Swiper(".mySwiper4", {
        slidesPerView: 4,
        spaceBetween: 10,
        loop: true,
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
          }
      });
    </script>
