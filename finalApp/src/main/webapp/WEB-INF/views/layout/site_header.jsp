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

.header_top {
    padding: 18px 120px;
    overflow: hidden;
    border-bottom: 1px solid #ddd;
    display: flex;
    justify-content: space-between;
    border-bottom: 1px solid #e5e5e5;
}

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

.header_top_left .login_wrap {
    width: 128px;
    height: 40px;
    vertical-align: middle;
    box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.15);
    cursor: pointer;
    border-radius: 22px;
    border: 2px solid orangered;
}

.header_top_left .login_wrap a {
    position: relative;
    display: inline-block;
    line-height: 37px;
    padding-left: 12px;
    font-size: 14px;
}

.header_top_left .login_wrap a::before {
    position: absolute;
    background: url(${pageContext.request.contextPath}/resources/images/main/icon_login.png) no-repeat 0 0;
    top: 11px;
    right: -26px;
    content: '';
    width: 14px;
    height: 14px;
}

.header_bottom {
    position: relative;
    height: 149px;
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

.header_bottom_list #sns_area .sns_list {
    display: flex;
    margin-top: 26px;
}

.header_bottom_list #sns_area .sns_list li {
    width: 38px;
    height: 38px;
    line-height: 38px;
    text-align: center;
}

.header_bottom_list #sns_area .sns_list .sns_item1 {
    background: url(${pageContext.request.contextPath}/resources/images/main/sns.gif) no-repeat 0 0;
    margin-right: 5px;
}

.header_bottom_list #sns_area .sns_list .sns_item2 {
    background: url(${pageContext.request.contextPath}/resources/images/main/sns.gif) no-repeat -39px 0;
    margin-right: 5px;
}

.header_bottom_list #sns_area .sns_list .sns_item3 {
    background: url(${pageContext.request.contextPath}/resources/images/main/sns.gif) no-repeat -78px 0;
    margin-right: 5px;
}

.header_bottom_list #sns_area .sns_list .sns_item4 {
    background: url(${pageContext.request.contextPath}/resources/images/main/sns.gif) no-repeat -117px 0;
    margin-right: 5px;
}

.header_bottom_list .logo_area {
    width: 206px;
    height: 40px;
    margin-top: 26px;
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
    margin: 0 auto;
}

nav .navi_wrap .menu_bar {
    display: flex;
}

nav .navi_wrap .menu_bar .menu_item {
    width: 25%;
    text-align: center;
}

nav .navi_wrap .menu_bar .menu_item a {
    display: block;
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

        <div class="header_top_left">
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
            
        </div>
    </div>

    <div class="header_bottom">
        <div class="header_bottom_wrap">
            <div class="header_bottom_in">
                <ul class="header_bottom_list">
                    <li class="my_page">
                          <a href="${pageContext.request.contextPath}/site/list"><i class="fa-regular fa-user"></i>&nbsp;검색창으로</a>
                          <a href="${pageContext.request.contextPath}/campsite/cart" title="장바구니"></a>
                          
                    </li>
                    <li class="logo_area">
                        <a id="logo2" href="${pageContext.request.contextPath}/site/list">
                            <img src="${pageContext.request.contextPath}/resources/images/campsite/logocamp.png" alt="logo" width="206"height= "40">
                        </a>
                    </li>
                    <li class="my_page">
                        <a href="${pageContext.request.contextPath}/site/mypage/bookList"><i class="fa-regular fa-user"></i>&nbsp;예약 목록</a>
                    </li>
                </ul>
            </div>
        </div>
        <nav>

        </nav>
    </div>
</body>
</html>