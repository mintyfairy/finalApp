<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@charset "utf-8";

* {
    margin: 0;
    padding: 0;
    text-decoration: none;
    color: #333;
    box-sizing: border-box;
}

ol,
ul {
    list-style: none;
}

main {
    margin-bottom: 150px;
}

.main_slider_wrap {
    position: relative;
    height: 820px;
    background: url("${pageContext.request.contextPath}/resources/images/shop/ocean.jpg") no-repeat center center;
    background-size: cover;
}

.main_slider {
    position: absolute;
    bottom: 0;
    left: calc(50% - 540px);
    z-index: 100;
    width: 1080px;
    height: 650px;
}

.category_container {
    padding: 150px 0;
}

.category_container .category_wrap {
    width: 1080px;
    height: 320px;
    margin: 0 auto;
}

.category_container .category_wrap .category_list {
    height: 160px;
    display: flex;
}

.category_container .category_wrap .category_list .category_item {
    width: calc(100% / 4);
    cursor: pointer;
    border: 1px solid black;
}

.best_container {
    position: relative;
    height: 590px;
    padding-top: 60px;
}

.best_container h1 {
    width: 1080px;
    margin: 0 auto;
    margin-bottom: 50px;
}

.best_container .best_slider {
    position: absolute;
    bottom: 0;
    left: calc(50% - 540px);
    z-index: 100;
    width: 1080px;
    height: 447px;
    margin: 0 auto;
}

.focus_container {
    padding-top: 90px;
    border: 1px solid red;
}

.focus_container .focus_wrap {
    width: 1080px;
    height: 700px;
    margin: 0 auto;
    border: 1px solid blue;
}

.focus_container .focus_wrap .focus_title {
    margin-bottom: 60px;
}

.focus_container .focus_wrap .focus_title span {
    display: inline-block;
    font-size: 36px;
    font-weight: 600;
    margin-left: 7px;
}

.focus_container .focus_wrap .focus_title .on {
    color: orange;
}

.focus_container .focus_wrap .focus_slider {
    height: 540px;
    border: 1px solid black;
}

.hot_container {
    padding-top: 80px;
    border: 1px solid red;
}

.hot_container .hot_wrap {
    width: 1080px;
    height: 1040px;
    margin: 0 auto;
    border: 1px solid blue;
}

.hot_container .hot_wrap h1 {
    margin-bottom: 60px;
}

.hot_container .hot_wrap .hot_list_wrap {
    height: calc(100% - 104px);
}

.hot_container .hot_wrap .hot_list_wrap .hot_list {
    display: grid;
    height: 100%;
    grid-template-columns: repeat(4, 1fr);
    grid-template-rows: repeat(2, 1fr);
    gap: 14px 10px;
}

.hot_container .hot_wrap .hot_list_wrap .hot_list .hot_item {
    border: 1px solid black;
}

.hot_list .hot_item .hot_photo {
    display: block;
    height: 262px;
    overflow: hidden;
    border: 1px solid #dedede;
    border-radius: 12px;
}

.hot_list .hot_item .hot_text {
    height: 200px;
    padding-top: 8px;
    border: 1px solid red;
}

.hot_list .hot_item .hot_text .hot_brand {
    font-size: 13px;
    font-weight: 600;
    margin-bottom: 10px;
}

.hot_list .hot_item .hot_text .hot_title {
    margin-bottom: 28px;
}

.hot_list .hot_item .hot_text .hot_title .hot_sale {
    font-weight: 600;
    color: red;
}

.hot_list .hot_item .hot_text .price {
    font-size: 12px;
    color: #aeaeae;
    text-align: right;
    text-decoration: line-through;
}

.hot_list .hot_item .hot_text .price_wrap {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 4px;
    padding-bottom: 10px;
    border-bottom: 1px solid #ccc;
}

.hot_list .hot_item .hot_text .price_wrap h4:first-child {
    color: red;
}

.hot_list .hot_item .hot_text .review {
    font-size: 13px;
    font-weight: 600;
    color: #8a8a8a;
}
</style>



<div class="main_slider_wrap">
    <div class="main_slider">
        <jsp:include page="/WEB-INF/views/slider/shop/main_slider.jsp"/>
    </div>
</div>

<div class="category_container">
    <div class="category_wrap">
        <ul class="category_list">
            <li class="category_item"></li>
            <li class="category_item"></li>
            <li class="category_item"></li>
            <li class="category_item"></li>
        </ul>
        <ul class="category_list">
            <li class="category_item"></li>
            <li class="category_item"></li>
            <li class="category_item"></li>
            <li class="category_item"></li>
        </ul>
    </div>
</div>

<div class="best_container">
    <h1>베스트 셀러</h1>
    <div class="best_slider">
    	<!-- 베스트 슬라이더 -->
    </div>
</div>

<div class="focus_container">
    <div class="focus_wrap">
        <div class="focus_title">
            <span>FOCUS</span>
            <span class="on">ON</span>
        </div>
        <div class="focus_slider">
            <!-- focus_slider -->
        </div>
    </div>
</div>

<div class="hot_container">
    <div class="hot_wrap">
        <h1>HOT PRICE</h1>
        <div class="hot_list_wrap">
            <ul class="hot_list">
                <li class="hot_item">
                    <a class="hot_photo" href="#">
                        <img src="https://via.placeholder.com/261x261" alt="hot_item">
                    </a>
                    <div class="hot_text">
                        <p class="hot_brand">브랜드 이름</p>
                        <p class="hot_title">상품 이름 <span class="hot_sale">15% 할인</span></p>
                        <p class="price">원가</p>
                        <div class="price_wrap">
                            <h4>할인%</h4>
                            <h4>할인된 가격</h4>
                        </div>
                        <p class="review">리뷰 2</p>
                    </div>
                </li>
                <li class="hot_item">
                    <a class="hot_photo" href="#">
                        <img src="https://via.placeholder.com/261x261" alt="hot_item">
                    </a>
                    <div class="hot_text">
                        <p class="hot_brand">브랜드 이름</p>
                        <p class="hot_title">상품 이름 <span class="hot_sale">15% 할인</span></p>
                        <p class="price">원가</p>
                        <div class="price_wrap">
                            <h4>할인%</h4>
                            <h4>할인된 가격</h4>
                        </div>
                        <p class="review">리뷰 2</p>
                    </div>
                </li>
                <li class="hot_item">
                    <a class="hot_photo" href="#">
                        <img src="https://via.placeholder.com/261x261" alt="hot_item">
                    </a>
                    <div class="hot_text">
                        <p class="hot_brand">브랜드 이름</p>
                        <p class="hot_title">상품 이름 <span class="hot_sale">15% 할인</span></p>
                        <p class="price">원가</p>
                        <div class="price_wrap">
                            <h4>할인%</h4>
                            <h4>할인된 가격</h4>
                        </div>
                        <p class="review">리뷰 2</p>
                    </div>
                </li>
                <li class="hot_item">
                    <a class="hot_photo" href="#">
                        <img src="https://via.placeholder.com/261x261" alt="hot_item">
                    </a>
                    <div class="hot_text">
                        <p class="hot_brand">브랜드 이름</p>
                        <p class="hot_title">상품 이름 <span class="hot_sale">15% 할인</span></p>
                        <p class="price">원가</p>
                        <div class="price_wrap">
                            <h4>할인%</h4>
                            <h4>할인된 가격</h4>
                        </div>
                        <p class="review">리뷰 2</p>
                    </div>
                </li>
                <li class="hot_item">
                    <a class="hot_photo" href="#">
                        <img src="https://via.placeholder.com/261x261" alt="hot_item">
                    </a>
                    <div class="hot_text">
                        <p class="hot_brand">브랜드 이름</p>
                        <p class="hot_title">상품 이름 <span class="hot_sale">15% 할인</span></p>
                        <p class="price">원가</p>
                        <div class="price_wrap">
                            <h4>할인%</h4>
                            <h4>할인된 가격</h4>
                        </div>
                        <p class="review">리뷰 2</p>
                    </div>
                </li>
                <li class="hot_item">
                    <a class="hot_photo" href="#">
                        <img src="https://via.placeholder.com/261x261" alt="hot_item">
                    </a>
                    <div class="hot_text">
                        <p class="hot_brand">브랜드 이름</p>
                        <p class="hot_title">상품 이름 <span class="hot_sale">15% 할인</span></p>
                        <p class="price">원가</p>
                        <div class="price_wrap">
                            <h4>할인%</h4>
                            <h4>할인된 가격</h4>
                        </div>
                        <p class="review">리뷰 2</p>
                    </div>
                </li>
                <li class="hot_item">
                    <a class="hot_photo" href="#">
                        <img src="https://via.placeholder.com/261x261" alt="hot_item">
                    </a>
                    <div class="hot_text">
                        <p class="hot_brand">브랜드 이름</p>
                        <p class="hot_title">상품 이름 <span class="hot_sale">15% 할인</span></p>
                        <p class="price">원가</p>
                        <div class="price_wrap">
                            <h4>할인%</h4>
                            <h4>할인된 가격</h4>
                        </div>
                        <p class="review">리뷰 2</p>
                    </div>
                </li>
                <li class="hot_item">
                    <a class="hot_photo" href="#">
                        <img src="https://via.placeholder.com/261x261" alt="hot_item">
                    </a>
                    <div class="hot_text">
                        <p class="hot_brand">브랜드 이름</p>
                        <p class="hot_title">상품 이름 <span class="hot_sale">15% 할인</span></p>
                        <p class="price">원가</p>
                        <div class="price_wrap">
                            <h4>할인%</h4>
                            <h4>할인된 가격</h4>
                        </div>
                        <p class="review">리뷰 2</p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>