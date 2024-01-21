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

.main_slider {
	position: relative;
	height: 100vh;
}

.main_slider .searchBox {
	position: absolute;
	top: -50px;
	left: calc(50% - 310px);
	z-index: 500;
}

main .recommend {
    width: 100%;
    height: 100vh;
    background-color: #f8f9fa;
    margin-bottom: 200px;
    padding-top: 90px;
    
}

main .recommend h1 {
    text-align: center;
    margin-bottom: 75px;
}

.card-container {
	width: 80%;
	height: 75%;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
}

.card {
	height: 90%;
	text-align: center;
}

.card-title {
	margin-top: 10px;
}

.card-text {
	margin-top: 30px;
	font-size: 16px;
	height: 60px;
}

.carbutton {
	width: 80%;
}

main .excellent {
    height: 100vh;
    background: url("${pageContext.request.contextPath}/resources/images/shop/main_background1.jpg") no-repeat center center;
    background-size: cover;
    background-color: rgba(255, 255, 255, 0.5);
    padding-top: 88px;
}

main .excellent .excellent_title {
    font-size: 36px;
    text-align: center;
    margin-bottom: 72px;
}

main .excellent .best_list {
    width: 1080px;
    height: 400px;
    margin: 0 auto;
    background-color: #fff;
    display: flex;
}

main .excellent .best_list .best_excellent {
    width: 25%;
    height: 380px;
}

.excellent .best_list .best_excellent .bestpic_wrap {
    display: block;
    width: 100%;
    height: 280px;
}

.best_excellent .excellent_info {
    height: 164px;
    background-color: orange;
    padding: 28px 32px;
}

.best_excellent .excellent_info h4 {
    width: 90px;
    height: 36px;
    line-height: 36px;
    color: #fff;
    font-size: 16px;
    font-weight: 300;
    text-align: center;
    border: 1px solid #fff;
    margin-bottom: 10px;
    border-radius: 18px;
}

.best_excellent .excellent_info p {
    color: #fff;
}

main .excellent .best_list .best_slider {
	width: 75%;
	height: 100%;
}

main .story {
    height: 100vh;
    padding-top: 88px;
    background-color: #f7f8f9;
}

.story .story_title {
    font-size: 36px;
    text-align: center;
    margin-bottom: 68px;
}

.story .story_board {
    width: 1080px;
    height: 375px;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0 auto;
}

.story .story_board .news {
    width: 50%;
    height: 100%;
    background-color: #fff;
}

.story .story_board .story_pic {
    width: 25%;
    height: 100%;
}

.story_board .news .news_title {
    position: relative;
    display: flex;
    justify-content: space-between;
    width: 100%;
    height: 72px;
    border-bottom: 1px solid #e5e5e5;
    padding: 25px 39px 13px 39px;
    box-sizing: border-box;
}

.story_board .news .news_title .news_title_right h3 {
    width: 170px;
    height: 34px;
    display: inline-block;
    margin-right: 20px;
}

.story_board .news .news_title .news_title_right span {
    position: relative;
    font-size: 12px;
    color: #bdbdbd;
    margin-left: -40px;
    padding-left: 9px;
}

.story_board .news .news_title .news_title_right span::before {
    position: absolute;
    top: -6px;
    left: 0;
    content: '';
    width: 1px;
    height: 16px;
    background-color: #bdbdbd;
}

.story_board .news .news_title a {
    display: inline-block;
    width: 70px;
    height: 26px;
    line-height: 26px;
    color: #bdbdbd;
    font-size: 13px;
    text-align: center;
    border: 1px solid #bdbdbd;
    border-radius: 13px;
}

.story_board .news .news_subject {
    padding: 32px 48px 32px 39px;
}

.story_board .news .news_subject .subject {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    height: 50px;
}
</style>
	
</head>

<body>
	<div class="main_slider">
		<jsp:include page="/WEB-INF/views/slider/main_slider.jsp"/>
		<div class="searchBox">
			<jsp:include page="/WEB-INF/views/searchBox/search_box.jsp"/>
		</div>
	</div>
	<div class="recommend">
        <h1>인기있는 캠핑카</h1>
        <div class="card-container">
	       	<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath}/resources/images/campingcar/caravanpic1.jpg" class="card-img-top" alt="..." style="background-size: cover;">
			  <div class="card-body">
			    <h5 class="card-title">코치멘 오라이온20 CB</h5>
			    <p class="card-text">5명이서 자도 넉넉한 공간으로 캠핑을 낙낙하게 즐겨보세요</p>
			    <a href="http://localhost:9090/plus/car/car_detail?carNum=14" class="btn btn-primary carbutton">보러가기</a>
			  </div>
			</div>
			  <div class="card" style="width: 18rem;">
			 <img src="${pageContext.request.contextPath}/resources/images/campingcar/caravanpic1.jpg" class="card-img-top" class="card-img-top" alt="..." style="background-size: cover;">
			 <div class="card-body">
			    <h5 class="card-title">카슬라350S</h5>
			    <p class="card-text">나들이 가기 좋은 감성 캠핑카.</p>
				<a href="http://localhost:9090/plus/car/car_detail?carNum=15" class="btn btn-primary carbutton">보러가기</a>
			  </div>
			</div>
			<div class="card" style="width: 18rem;">
   			  <img src="${pageContext.request.contextPath}/resources/images/campingcar/caravanpic1.jpg" class="card-img-top" class="card-img-top" alt="..." style="background-size: cover;">
			  <div class="card-body">
			    <h5 class="card-title">바이슨900</h5>
			    <p class="card-text">보기보다 넉넉. 최대 3인까지 추천</p>
			    <a href="http://localhost:9090/plus/car/car_detail?carNum=13" class="btn btn-primary carbutton">보러가기</a>
			  </div>
			 </div>
		</div>
    </div><!-- <div class="recommend"> -->

    <div class="excellent">
        <h1 class="excellent_title">캠핑 용품</h1>
        <div class="best_list">
            <div class="best_excellent">
                <a href="${pageContext.request.contextPath}/shop/main" class="bestpic_wrap">
                    <img src="${pageContext.request.contextPath}/resources/images/shop/shop01.jpg" alt="photo" width="270" height="280">
                </a>
                <div class="excellent_info">
                    <h4>추천해요</h4>
                    <p>가장 많이 찾는 텐트</p>
                </div>
            </div>
            <div class="best_slider">
            	<jsp:include page="/WEB-INF/views/slider/shop/shop_slider.jsp"/>
            </div>
        </div>
    </div>

	<div class="story">
		<h1 class="story_title">캠핑소식</h1>
		<div class="story_board">
			<div class="news">
				<div class="news_title">
					<div class="news_title_right">
						<h3>캠핑스토리</h3>
						<span>소식</span>
					</div>
					<a href="#">see more</a>
				</div>
				<div class="news_subject">
					<p class="subject subject1">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
					<p class="subject subject1">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
					<p class="subject subject1">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
					<p class="subject subject1">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
					<p class="subject subject1">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
				</div>
			</div>
			<div class="story_pic story_pic1">
				<a href="#">
					<img src="https://via.placeholder.com/300x274" alt="pic1">
				</a>
			</div>
			<div class="story_pic story_pic2">
				<a href="#">
					<img src="https://via.placeholder.com/300x274" alt="pic2">
				</a>
			</div>
		</div>
	</div>
    
</body>
</html>