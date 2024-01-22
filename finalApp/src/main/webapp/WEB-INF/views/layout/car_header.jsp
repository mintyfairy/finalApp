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

.navi_container {
  border-top: 1px solid #cecece;
  border-bottom: 1px solid #cecece;
}

.navi_container .navi_wrap {
  width: 1080px;
  height: 60px;
  margin: 0 auto;
}

.hamburger {
  width: 100px;
  height: 50px;
  margin-right: 110px;
}

.hamburger a {
  display: block;
  height: 100%;
}

.menu {
  width: 1100px;
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
  text-align: center;
  border-top: 1px solid silver;
}

.submenu2>li {
  line-height: 50px;
  text-align: center;
  border-top: 1px solid silver;
}

.submenu1 {
  height: 0;
  background-color: white;
  /*ul의 높이를 안보이게 처리*/
  overflow: hidden;
}

.submenu2 {
  height: 0;
  background-color: white;
  /*ul의 높이를 안보이게 처리*/
  overflow: hidden;
}

.menu>li:hover {
  transition-duration: 0.5s;
}

.menu>li:hover .submenu1 {
  height: 100px;
  transition-duration: 1s;
  
}

.menu>li:hover .submenu2 {
  height: 200px;
  transition-duration: 1s;
 
}

.loginout {
  width: 50px;
  line-height: 60px;
  float: right;
  margin:0;
}

.bell {
  width: 80px;
  line-height: 60px;
  text-align: right;
  font-size: 17px;
}




 /* 공통헤더 css*/
 
.header_top {
	width: 1080px;
    padding: 0 70px 0 0;
    border-bottom: 1px solid #efefef;
    margin: 0 auto;
   
}

.header_top_wrap {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 1080px;
    height: 110px;

}

.header_center {
	padding-top: 16px;
}

.header_center .header_center_wrap .header_center_list {
    display: flex;
    padding-left: 0;
}

.header_center .header_center_wrap .header_center_list .header_center_item {
    text-align: center;
}

.header_center .header_center_wrap .header_center_list .header_center_item:first-child {
    position: relative;
}

/* 
.header_center .header_center_wrap .header_center_list .header_center_item:first-child::after {
    content: '';
    position: absolute;
    top: 18px;
    right: 0;
    width: 1px;
    height: 32px;
    background-color: #dedede;

}
 */
.header_center .header_center_wrap .header_center_list .header_center_item a {
    display: block;
    font-size: 18px;
    padding: 0px;
}

.header_center .header_center_wrap .header_center_list .header_center_item a:hover {
    text-decoration: underline;
    color: orangered;
}

.logo {
    margin-right: 100px;
    padding-top: 6px;
}

.header_right_wrap {
    padding-top: 20px;
}

.header_right_wrap .header_right {
    width: 160px;
    height: 100%; 
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header_right_wrap .header_right .header_item a {
    display: inline-block;
}

/* 공통헤더 마지막 */

</style>

<div class="header_top">
    <div class="header_top_wrap">
        <div class="header_center">
            <div class="header_center_wrap">
                <ul class="header_center_list">
                    <li class="header_center_item">
                        <a href="${pageContext.request.contextPath}/" style="padding-left:0;">메인&nbsp;|</a>
                    </li>
                    <li class="header_center_item">
                        <a href="${pageContext.request.contextPath}/site/list" style="padding-left:0;">&nbsp;캠핑예약&nbsp;|</a>
                    </li>
                    <li class="header_center_item">
                        <a href="${pageContext.request.contextPath}/shop/main">&nbsp;스토어</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="logo">
            <a href="${pageContext.request.contextPath}/car/main">
                <img src="${pageContext.request.contextPath}/resources/images/main/logo.png" alt="logo" width="228">
            </a>
        </div>

        <div class="header_right_wrap">
            <ul class="header_right">
            	<c:choose>
						<c:when test="${empty sessionScope.member}">
			               	<li class="header_item"><a href="${pageContext.request.contextPath}/member/login"><i class="fa-solid fa-right-to-bracket fa-lg"></i></a></li>
				        </c:when>
				        <c:otherwise>
				        	<li class="header_item"><a href="${pageContext.request.contextPath}/member/logout" title="로그아웃"><i class="fa-solid fa-right-to-bracket fa-lg"></i></a></li>
						</c:otherwise>
			     </c:choose>
                
                <li class="header_item fa-lg"><a href="${pageContext.request.contextPath}/member/join"><i class="fa-solid fa-user-plus"></i></a></li>
                <li class="header_item fa-lg"><a href="${pageContext.request.contextPath}/csCenter/notice/list"><i class="fa-solid fa-headset"></i></a></li>
                <c:if test='${sessionScope.member.authority=="CAMP"||sessionScope.member.authority=="ADMIN"}'>
				   <li class="header_item fa-lg"><a href="${pageContext.request.contextPath}/admin/carManage/car"><i class="fa-solid fa-user-gear"></i></a></li>
				</c:if>
            </ul>
        </div>
    </div>
</div>


    <nav class="navi_container">
        <div class="navi_wrap">
            <ul class="menu clearfix">
                <li>
                    <a href="${pageContext.request.contextPath}/car/main">홈</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/car/location">오시는길</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/car/mypage/rider">예약정보</a>
                </li>
                <li>
                	&nbsp;
                </li>
                <li>
                	&nbsp;
                </li>
                <li>
                	&nbsp;
                </li>
                <li class="bell">
                    <a href="#"><i class="fa-solid fa-bell"></i></a>
                </li>
                
            </ul>
        </div>
    </nav>
