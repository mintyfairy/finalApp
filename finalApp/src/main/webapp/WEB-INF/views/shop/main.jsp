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

.navi_container {
    border-top: 1px solid #cecece;
    border-bottom: 1px solid #cecece;
}

.navi_container .navi_wrap {
    width: 1080px;
    height: 60px;
    margin: 0 auto;
}

.navi_container .navi_wrap .navi_list {
    display: flex;
    height: 100%;
}

.navi_list .navi_item {
    width: calc((100% - 60px)/7);
    height: 100%;
}

.navi_list .navi_item a {
    display: block;
    height: 100%;
    text-align: center;
    line-height: 60px;
}

.hamburger {
    width: 60px;
    height: 60px;
    border-left: 1px solid #cecece;
    border-right: 1px solid #cecece;
}

.hamburger a {
    display: block;
    height: 100%;
}

.main_slider {
    height: 700px;
    background: url("${pageContext.request.contextPath}/resources/images/shop/ocean.jpg") no-repeat center center;
    background-size: cover;
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
    height: 590px;
    padding-top: 60px;
    border: 1px solid red;
}

.best_container h1 {
    margin-bottom: 50px;
}

.best_container .best_wrap {
    width: 1080px;
    height: 447px;
    margin: 0 auto;
    border: 1px solid blue;
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

<nav class="navi_container">
    <div class="navi_wrap">
        <ul class="navi_list">
            <li class="hamburger">
                <a href="#">
                    <img src="https://via.placeholder.com/60x60" alt="hamburger">
                </a>
            </li>
            <li class="navi_item">
                <a href="#">브랜드</a>
            </li>
            <li class="navi_item">
                <a href="#">베스트 셀러</a>
            </li>
            <li class="navi_item">
                <a href="#">특가상품</a>
            </li>
            <li class="navi_item">
                <a href="#">MD 추천</a>
            </li>
            <li class="navi_item">
                <a href="#">캠핑 스타터</a>
            </li>
            <li class="navi_item">
                <a href="#">AS 라운지</a>
            </li>
            <li class="navi_item">
                <a href="#">고객센터</a>
            </li>
        </ul>
    </div>
</nav>

<div class="main_slider">
    <!-- 메인 슬라이더 -->
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
    <div class="best_wrap">
        <h1>베스트 셀러</h1>

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