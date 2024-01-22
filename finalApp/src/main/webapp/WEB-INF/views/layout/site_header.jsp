<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
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
.header_container {
	background-color: #fff;
}

.header_top {
    padding-right: 120px;
    overflow: hidden;
    display: flex;
    justify-content: space-between;
}

.header_top #sns_area .sns_list {
    display: flex;
    margin-top: 26px;
}

.header_top #sns_area .sns_list li {
    width: 27px;
    height: 27px;
    line-height: 27px;
    text-align: center;
}

.header_top #sns_area .sns_list .sns_item1 {
    background: url(${pageContext.request.contextPath}/resources/images/main/sns1.gif) no-repeat 0 0;
    margin-right: 5px;
}

.header_top #sns_area .sns_list .sns_item2 {
    background: url(${pageContext.request.contextPath}/resources/images/main/sns1.gif) no-repeat -26px 0;
    margin-right: 5px;
}

.header_top #sns_area .sns_list .sns_item3 {
    background: url(${pageContext.request.contextPath}/resources/images/main/sns1.gif) no-repeat -53px 0;
    margin-right: 5px;
}

.header_top #sns_area .sns_list .sns_item4 {
    background: url(${pageContext.request.contextPath}/resources/images/main/sns1.gif) no-repeat -79px 0;
    margin-right: 5px;
}

/*
.header_top .header_top_list {
    display: flex;
    align-items: center;
    width: 1160px;
}

.header_top .header_top_list .header_top_item {
    margin-right: 48px;
}

.header_top .header_top_list #tour_list_wrap .tour_list {
    overflow: hidden;
    vertical-align: middle;
    background-color: #ededed;
    border-radius: 100px;
    height: 40px;
    padding: 0 16px;
    display: flex;
    line-height: 40px;
}

#tour_list_wrap .tour_list li {
    position: relative;
    margin: 0 8px;
}

#tour_list_wrap .tour_list li::after {
    content: '';
    position: absolute;
    top: 14px;
    right: -9px;
    width: 1px;
    height: 14px;
    background-color: #c3c3c3;
}

#tour_list_wrap .tour_list li:last-child::after {
    display: none;
}

#tour_list_wrap .tour_list li a {
    font-size: 13px;
}

#tour_list_wrap .tour_list li a:hover {
    text-decoration: underline;
}
*/

.header_top_left {
	display: flex;
	justify-content: end;
    align-items: center;
}

.header_top_left .login_wrap a {
    position: relative;
    display: inline-block;
    padding-left: 12px;
    font-size: 14px;
}

.header_top_left .login_wrap a .custom-btn {
	margin: 20px;
	outline: none;
	width: 130px;
	height: 40px;
	border: 2px solid #000;
	font-family: 'Lato', sans-serif;
	font-weight: 500;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
}

.btn-4 {
  position: relative;
  color: #000;
  z-index: 2;
  line-height: 40px;
  padding: 0;
}
.btn-4:hover{
  border: none;
}
.btn-4:before,
.btn-4:after {
  position: absolute;
  content: "";
  width: 0%;
  height: 0%;
  border: 2px solid;
  z-index: -1;
  transition: all 0.3s ease;
}
.btn-4:before {
  top: 0;
   left: 0;
   border-bottom-color: transparent;
   border-right-color: transparent;
   border-top-color: #000;
   border-left-color: #000;
}
.btn-4:after{
   bottom: 0;
   right: 0;
   border-top-color: transparent;
   border-left-color: transparent;
   border-bottom-color: #000;
   border-right-color: #000;
}
.btn-4:hover:before,
.btn-4:hover:after {
  border-color: #000;
  height: 100%;
  width: 100%;
}

.header_bottom {
    position: relative;
    height: 143px;
}

.header_bottom .header_bottom_wrap {
    height: 84px;
    border-bottom: 1px solid #e5e5e5;
}

.header_bottom .header_bottom_in {
    width: 1200px;
    height: 100%;
    margin: 0 auto;
}

.header_bottom .header_bottom_in .header_bottom_list {
    display: flex;
    justify-content: space-between;
}



.header_bottom_list .logo_area {
    width: 206px;
    height: 40px;
}

.bottom_right_wrap .bottom_right {
    width: 200px;
    height: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.bottom_right_wrap .bottom_right .header_item a {
    display: inline-block;
}

.bottom_left_wrap .bottom_left_list {
    display: flex;
    padding-left: 0;
}

.bottom_left_wrap .bottom_left_list .bottom_left_item {
    text-align: center;
}

.bottom_left_wrap .bottom_left_list .bottom_left_item:first-child {
    position: relative;
}

.bottom_left_wrap .bottom_left_list .bottom_left_item:first-child::after {
    content: '';
    position: absolute;
    top: 21px;
    right: 0;
    width: 1px;
    height: 20px;
    background-color: #dedede;
}

.bottom_left_wrap .bottom_left_list .bottom_left_item:nth-child(2) {
    position: relative;
}

.bottom_left_wrap .bottom_left_list .bottom_left_item:nth-child(2)::after {
    content: '';
    position: absolute;
    top: 21px;
    right: 0;
    width: 1px;
    height: 20px;
    background-color: #dedede;
}

.bottom_left_wrap .bottom_left_list .bottom_left_item:last-child a {
	padding-right: 0;
}

.bottom_left_wrap .bottom_left_list .bottom_left_item a {
    display: block;
    font-size: 15px;
    padding: 20px 10px 20px 10px;
}

.bottom_left_wrap .bottom_left_list .bottom_left_item a:hover {
    text-decoration: underline;
    color: orangered;
}

#logo2 {
    display: block;
    width: 100%;
    height: 100%;
}

.header_bottom_list .my_page {
    height: 40px;
    margin-top: 26px;
}

.header_bottom_list .my_page a {
    display: block;
    height: 100%;
    font-size: 13px;
    line-height: 40px;
}

.header_bottom_list .my_page a:hover {
    text-decoration: underline;
}

nav .navi_wrap {
    width: 1200px;
    height: 54px;
    margin: 0 auto;
}

nav .navi_wrap .menu_bar {
    display: flex;
    margin-bottom: 0;
}

nav .navi_wrap .menu_bar .menu_item {
    width: 33.3%;
    text-align: center;
}

nav .navi_wrap .menu_bar .menu_item a {
    display: block;
    line-height: 20px;
    font-size: 18px;
    padding: 20px 0;
}

nav .navi_wrap .menu_bar .menu_item a:hover {
    text-decoration: underline;
    color: orangered;
}
</style>
</head>
	<div class="header_top">
	<!-- 
        <ul class="header_top_list">
            <li id="logo" class="header_top_item">
                <a href="${pageContext.request.contextPath}/">
                    <img src="https://via.placeholder.com/108x38" alt="logo">
                </a>
            </li>
            <li id="tour_list_wrap" class="header_top_item">
                <ul class="tour_list">
                    <li>
                        <a href="#">캠핑장 구석구석</a>
                    </li>
                    <li>
                        <a href="#">열린관광 모두의 캠핑</a>
                    </li>
                    <li>
                        <a href="#">캠핑트립코리아</a>
                    </li>
                    <li>
                        <a href="#">캠핑e배움터</a>
                    </li>
                    <li>
                        <a href="#">캠핑카</a>
                    </li>
                    <li>
                        <a href="#">사진갤러리</a>
                    </li>
                    <li>
                        <a href="#">한국캠핑콘텐츠랩</a>
                    </li>
                    <li>
                        <a href="#">TourAPI</a>
                    </li>
                </ul>
            </li>
        </ul>
-->
        <div class="header_top_left">
        <!-- 
       		 <c:choose>
				<c:when test="${empty sessionScope.member}">
		            <div class="login_wrap">
		                <a href="${pageContext.request.contextPath}/member/login">통합로그인</a>
		            </div>
		        </c:when>
		        <c:otherwise>
					<div class="p-2">
						<a href="${pageContext.request.contextPath}/member/logout" title="로그아웃">로그아웃</a>
					</div>					
				</c:otherwise>
		     </c:choose>
         -->
            
        </div>
         <div id="sns_area">
	            <ul class="sns_list">
	                <li class="sns_item1">
	                    <a href="#" target="_blank"></a>
	                </li>
	                <li class="sns_item2">
	                    <a href="#" target="_blank"></a>
	                </li>
	                <li class="sns_item3">
	                    <a href="#" target="_blank"></a>
	                </li>
	                <li class="sns_item4">
	                    <a href="#" target="_blank"></a>
	                </li>
	            </ul>
	        </div>
        
    </div>

    <div class="header_bottom">
        <div class="header_bottom_wrap">
	            <div class="header_bottom_in">
	                <ul class="header_bottom_list">
	                    <li class="bottom_left_wrap">
			                <ul class="bottom_left_list">
			                    <li class="bottom_left_item">
			                        <a href="${pageContext.request.contextPath}/site/list" style="padding-left:0;">캠핑예약</a>
			                    </li>
			                    <li class="bottom_left_item">
			                        <a href="${pageContext.request.contextPath}/car/main">캠핑카</a>
			                    </li>
			                    <li class="bottom_left_item">
			                        <a href="${pageContext.request.contextPath}/shop/main">스토어</a>
			                    </li>
			                </ul>
	                    </li>
	                    <li class="logo_area">
	                        <a id="logo2" href="${pageContext.request.contextPath}/">
	                            <img src="${pageContext.request.contextPath}/resources/images/main/logo.png" alt="logo" style="width:210px; height:55px;">
	                        </a>
	                    </li>
	                    
	                    <!-- 
	                    <li class="my_page">
	                        <a href="#"><i class="fa-regular fa-user"></i>&nbsp;마이페이지</a>
	                    </li>
	                     -->
	                     
				        <li class="bottom_right_wrap">
				            <ul class="bottom_right">
				            	<c:choose>
				            		<c:when test="${empty sessionScope.member}">
				                		<li class="header_item"><a href="${pageContext.request.contextPath}/member/login"><i class="fa-solid fa-arrow-right-to-bracket fa-lg"></i></a></li>
				                		<li class="header_item"><a href="${pageContext.request.contextPath}/member/join"><i class="fa-solid fa-user-plus fa-lg"></i></a></li>
				                	</c:when>
				                	<c:otherwise>
				                		<li class="header_item"><a href="${pageContext.request.contextPath}/member/logout"><i class="fa-solid fa-arrow-right-from-bracket fa-lg"></i></a></li>
						                <li class="header_item fa-lg"><a href="${pageContext.request.contextPath}/site/mypage/bookList"><i class="fa-regular fa-user fa-lg"></i></a></li>
				                	</c:otherwise>
				                </c:choose>
				                <li class="header_item fa-lg"><a href="${pageContext.request.contextPath}/campsite/cart"><i class="fa-solid fa-cart-shopping"></i></a></li>
				                <li class="header_item fa-lg">
				                	<a href="${pageContext.request.contextPath}/csCenter/notice/list"><i class="fa-solid fa-headset"></i></a></li>
				                <c:if test='${sessionScope.member.authority=="CAMP"||sessionScope.member.authority=="ADMIN"}'>
				                	<li class="header_item fa-lg"><a href="${pageContext.request.contextPath}/admin"><i class="fa-solid fa-user-gear"></i></a></li>
				                </c:if>
				            </ul>
				        </li>
	                </ul>
	            </div>
	        </div>
	        <nav>
	            <div class="navi_wrap">
	                <ul class="menu_bar">
	                    <li class="menu_item">
	                        <a href="${pageContext.request.contextPath}/site/list">CAMPING AREA</a>
	                    </li>
	                    <li class="menu_item">
	                        <a href="${pageContext.request.contextPath}/car/main"  >CAMPING CAR</a>
	                    </li>
	                    <li class="menu_item">
	                        <a href="${pageContext.request.contextPath}/shop/main"  >CAMPING SHOP</a>
	                    </li>
	                </ul>
	            </div>
        </nav>
    </div>
</body>
</html>