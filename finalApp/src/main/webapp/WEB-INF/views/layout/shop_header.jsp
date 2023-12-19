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
