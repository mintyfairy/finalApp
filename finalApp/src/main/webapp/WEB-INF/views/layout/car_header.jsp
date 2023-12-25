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

.clearfix:before, .clearfix:after {
  display: block;
  content: '';
  line-height: 0;
}

.clearfix:after {
  clear:both;
}

main {
  margin-bottom: 150px;
}

.container {
  border-top: 1px solid #cecece;
  border-bottom: 1px solid #cecece;
}

.container .navi_wrap {
  width: 1080px;
  height: 60px;
  margin: 0 auto;
}

.hamburger {
  width: 100px;
  height: 50px;
  margin-right: 130px;
  border-left: 1px solid #cecece;
  border-right: 1px solid #cecece;
}

.hamburger a {
  display: block;
  height: 100%;
}

.menu {
  width: 1080px;
  overflow: hidden;
  margin: 0 auto;
}


.menu>li {
  width: 150px;
  float: left;
  line-height: 60px;
  text-align: center;
}

.menu a {
  color: black;
}

.submenu1>li {
  line-height: 50px;
}

.submenu2>li {
  line-height: 50px;
}

.submenu1 {
  height: 0;
  /*ul의 높이를 안보이게 처리*/
  overflow: hidden;
}

.submenu2 {
  height: 0;
  /*ul의 높이를 안보이게 처리*/
  overflow: hidden;
}

.menu>li:hover {
  transition-duration: 0.5s;
}

.menu>li:hover .submenu1 {
  height: 100px;
  transition-duration: 1s;
  text-align: center;
}

.menu>li:hover .submenu2 {
  height: 200px;
  transition-duration: 1s;
  text-align: center;
}

.loginout {
  width: 100px;
  line-height: 60px;
  float: right;
}

.bell {
  width: 120px;
  line-height: 60px;
  float: right;
  text-align: center;
}

</style>

<main>
    <nav class="navi_container">
        <div class="navi_wrap">
            <ul class="menu clearfix">
                <li class="hamburger">
                    <a href="${pageContext.request.contextPath}/">
                        <img src="../image/logo.png" alt="hamburger">
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/car/location">오시는길</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/car/cs.faq">고객센터</a>
                    <ul class="submenu1">
                        <li><a href="${pageContext.request.contextPath}/car/cs.faq">FAQ</a></li>
                        <li><a href="${pageContext.request.contextPath}/car/cs.notice">공지사항</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">마이페이지</a>
                    <ul class="submenu2">
                        <li><a href="#">운전자 정보</a></li>
                        <li><a href="${pageContext.request.contextPath}/car/mypage.zzim">찜</a></li>
                        <li><a href="#">예약내역</a></li>
                        <li><a href="#">1:1 문의</a></li>
                    </ul>
                </li>
                <li class="bell" style="text-align: right;">
                    <a href="#"><i class="fa-solid fa-bell"></i></a>
                </li>
                <li class="loginout">
                    <span>login</span>
                </li>
            </ul>
        </div>
    </nav>
</main>