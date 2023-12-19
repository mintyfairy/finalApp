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

main .recommend {
    width: 100%;
    height: 685px;
    background-color: #f8f9fa;
    margin-bottom: 200px;
    padding-top: 90px;
}

main .recommend h1 {
    text-align: center;
    margin-bottom: 75px;
}

main .recommend .recommend_place {
    width: 960px;
    height: 382px;
    margin: 0 auto;
}

main .recommend .recommend_place .recommend_list {
    height: 100%;
    display: flex;
    justify-content: space-around;
}

.recommend_list .recommend_item {
    width: 25%;
    height: 100%;
}

.recommend_list .recommend_item .recommend_picture {
    display: block;
    width: 170px;
    height: 170px;
    margin: 0 auto;
    overflow: hidden;
    border-radius: 50%;
}

.recommend_list .recommend_item .recommend_desc {
    width: 224px;
    height: 180px;
    background-color: #fff;
    margin: 0 auto;
    margin-top: 27px;
}

.recommend_list .recommend_item .recommend_desc h3 {
    width: 80%;
    margin: 0 auto;
    margin-bottom: 10px;
    padding-top: 10px;
    padding-bottom: 10px;
    text-align: center;
    color: orange;
    border-bottom: 1px solid #ccc;
}

.recommend_list .recommend_item .recommend_desc p {
    padding: 0 20px;
    text-align: center;
    font-size: 14px;
    color: slategray;
}

main .excellent {
    height: 680px;
    background: url('/image/메인 배경.jpg') no-repeat center center;
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

main .story {
    height: 520px;
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
    height: 275px;
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
</style>
	
</head>

<body>
	<div class="main_slider" style="height: 700px;">
		<jsp:include page="/WEB-INF/views/slider/main_slider.jsp"/>
	</div>
	<div class="recommend">
        <h1>추천 여행지</h1>
        <div class="recommend_place">
            <ul class="recommend_list">
                <li class="recommend_item">
                    <a href="#" class="recommend_picture"><img src="https://via.placeholder.com/170x170" alt="item1"></a>
                    <div class="recommend_desc">
                        <h3>제목1</h3>
                        <p>Lorem ipsum dolor sit amet.</p>
                    </div>
                </li>
                <li class="recommend_item">
                    <a href="#" class="recommend_picture"><img src="https://via.placeholder.com/170x170" alt="item1"></a>
                    <div class="recommend_desc">
                        <h3>제목1</h3>
                        <p>Lorem ipsum dolor sit amet.</p>
                    </div>
                </li>
                <li class="recommend_item">
                    <a href="#" class="recommend_picture"><img src="https://via.placeholder.com/170x170" alt="item1"></a>
                    <div class="recommend_desc">
                        <h3>제목1</h3>
                        <p>Lorem ipsum dolor sit amet.</p>
                    </div>
                </li>
                <li class="recommend_item">
                    <a href="#" class="recommend_picture"><img src="https://via.placeholder.com/170x170" alt="item1"></a>
                    <div class="recommend_desc">
                        <h3>제목1</h3>
                        <p>Lorem ipsum dolor sit amet.</p>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <div class="excellent">
        <h1 class="excellent_title">우수 야영장</h1>
        <div class="best_list">
            <div class="best_excellent">
                <a href="#" class="bestpic_wrap">
                    <img src="https://via.placeholder.com/270x280" alt="photo">
                </a>
                <div class="excellent_info">
                    <h4>추천해요</h4>
                    <p>Lorem ipsum, dolor sit amet consectetur adipisicing.</p>
                </div>
            </div>
            <!-- 슬라이더 -->
        </div>
    </div>

    <div class="story">
        <h1 class="story_title">캠핑소식</h1>
        <div class="story_board">
            <div class="news"></div>
            <div class="story_pic"></div>
            <div class="story_pic"></div>
        </div>
    </div>
</body>
</html>