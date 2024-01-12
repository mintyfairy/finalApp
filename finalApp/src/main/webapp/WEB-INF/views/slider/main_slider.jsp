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
    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><img src="https://swiperjs.com/demos/images/nature-1.jpg" /></div>
            <div class="swiper-slide"><img src="https://swiperjs.com/demos/images/nature-2.jpg" /></div>
            <div class="swiper-slide"><img src="https://swiperjs.com/demos/images/nature-3.jpg" /></div>
            <div class="swiper-slide"><img src="https://swiperjs.com/demos/images/nature-4.jpg" /></div>
            <div class="swiper-slide"><img src="https://swiperjs.com/demos/images/nature-5.jpg" /></div>
            <div class="swiper-slide"><img src="https://swiperjs.com/demos/images/nature-6.jpg" /></div>
            <div class="swiper-slide"><img src="https://swiperjs.com/demos/images/nature-7.jpg" /></div>
            <div class="swiper-slide"><img src="https://swiperjs.com/demos/images/nature-8.jpg" /></div>
            <div class="swiper-slide"><img src="https://swiperjs.com/demos/images/nature-9.jpg" /></div>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
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
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
        });
    </script>
