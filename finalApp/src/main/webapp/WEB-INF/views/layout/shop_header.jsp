<%@ page contentType="text/html; charset=UTF-8" %>
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

.header_top {
    padding: 0 40px;
    border-bottom: 1px solid #efefef;
}

.header_top_wrap {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 1080px;
    height: 200px;
    margin: 0 auto;
}

.header_search {
    width: 500px;
    position: relative;
}

.header_search form input {
    width: 100%;
    height: 54px;
    border-radius: 27px;
}

.header_search form button {
    position: absolute;
    width: 50px;
    height: 50px;
    top: 2px;
    right: 24px;
    border: none;
    background-color: transparent;
    cursor: pointer;
}

.header_right {
    width: 160px;
    height: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header_item {
    width: 32px;
    height: 32px;
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
</style>
</head>
<div class="header_top">
    <div class="header_top_wrap">
        <div class="logo">
            <a href="#">
                <img src="https://via.placeholder.com/120x80" alt="logo">
            </a>
        </div>
        <div class="header_search">
            <form action="">
                <input type="text">
                <button type="button"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
        <div class="header_right_wrap">
            <ul class="header_right">
                <li class="header_item"><a href="#"><i class="fa-solid fa-right-to-bracket"></i></a></li>
                <li class="header_item"><a href="#"><i class="fa-regular fa-user"></i></a></li>
                <li class="header_item"><a href="#"><i class="fa-solid fa-cart-shopping"></i></a></li>
                <li class="header_item"><a href="#"><i class="fa-solid fa-headset"></i></a></li>
            </ul>
        </div>
    </div>
</div>

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
