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
    height: 110px;
    margin: 0 auto;
}

.header_center {
	padding-top: 16px;
}

.header_center .header_center_wrap .header_center_list {
    display: flex;
}

.header_center .header_center_wrap .header_center_list .header_center_item {
    text-align: center;
}

.header_center .header_center_wrap .header_center_list .header_center_item:first-child {
    position: relative;
}

.header_center .header_center_wrap .header_center_list .header_center_item:first-child::after {
    content: '';
    position: absolute;
    top: 18px;
    right: 0;
    width: 1px;
    height: 32px;
    background-color: #dedede;

}

.header_center .header_center_wrap .header_center_list .header_center_item a {
    display: block;
    font-size: 18px;
    padding: 20px;
}

.header_center .header_center_wrap .header_center_list .header_center_item a:hover {
    text-decoration: underline;
    color: orangered;
}

.logo {
    margin-right: 48px;
    padding-top: 6px;
}

.header_right_wrap {
    padding-top: 10px;
}

.header_right_wrap .header_right {
    width: 160px;
    height: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header_right_wrap .header_right .header_item {
    margin-left: 30px;
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
        <div class="header_center">
            <div class="header_center_wrap">
                <ul class="header_center_list">
                    <li class="header_center_item">
                        <a href="${pageContext.request.contextPath}/site/list">CAMPING AREA</a>
                    </li>
                    <li class="header_center_item">
                        <a href="${pageContext.request.contextPath}/car/main">CAMPINGCAR</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="logo">
            <a href="#">
                <img src="${pageContext.request.contextPath}/resources/images/main/logo.png" alt="logo" width="228">
            </a>
        </div>

        <div class="header_right_wrap">
            <ul class="header_right">
                <li class="header_item"><a href="#"><i class="fa-solid fa-right-to-bracket fa-lg"></i></a></li>
                <li class="header_item fa-lg"><a href="#"><i class="fa-regular fa-user"></i></a></li>
                <li class="header_item fa-lg"><a href="#"><i class="fa-solid fa-cart-shopping"></i></a></li>
                <li class="header_item fa-lg"><a href="#"><i class="fa-solid fa-headset"></i></a></li>
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
