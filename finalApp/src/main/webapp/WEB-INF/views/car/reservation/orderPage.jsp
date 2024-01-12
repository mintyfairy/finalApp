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

.container {
	width: 1100px;
    padding-top: 40px;
    margin: 0 auto;
}

.container .wrap {
    width: 100%;
    margin: 0 auto;
    display: flex;
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

.car_wrap {
    width: 1158px;
    margin: 30px auto;
   /* border: 1px solid silver; */
    
}

.car_wrap .car_list {
    display: flex;
    flex-wrap: wrap;
}

.goods_wrap {
    width: 1100px;
    margin: 30px auto;
   /* border: 1px solid silver; */
    
}

/*
.goods_wrap .goods_list {
    height: 2500px;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    grid-template-rows: repeat(5, 1fr);
    column-gap: 18px;
}
*/


.goods_wrap .goods_list {
    width: 700px;
    margin: 0 auto;
}

.goods_list li p {
	font-size: 15px;
	font-weight: 600;
	margin: 20px 0 0 10px;
}

.goods_wrap .goods_list .goods_item {
    width: 700px;
    border: 2px solid silver;
    border-radius: 15px;
    display: flex;
    justify-content: space-between;
    margin: 10px auto;
    padding: 20px;
}

.goods_item ul {
	width: 100%;
}

.goods_item ul li {
	font-size: 18px;
	margin: 10px 0;
}

.datebox {
	text-align: center;
	padding: 0 10px;
}

#reservation_check {
	width: 400px;
    height: 50px;
    font-size: 27px;
    font-weight: 700;
    color: white;
    background-color: hsl(39, 100%, 52%);
    border: 0;
    border-radius: 10px;
    margin: 0 auto;
    
}


.goods_list .goods_item .goods_photo {
    display: block;
    height: 200px;
    overflow: hidden;
    border: 1px solid #dedede;
    border-radius: 12px;
    float: left;
}

.goods_list .goods_item .goods_text {
    height: 200px;
    padding-top: 8px;
    margin-bottom: 28px;
}

.car_wrap .car_list {
    display: flex;
    flex-wrap: wrap;
    margin: 0 auto;
}


.car_wrap .car_list .car_item {
    display: flex;
    margin: 0 auto;
    /* border: 1px solid skyblue */
}

.car_text {
	width: 300px;
    height: 200px;
    display: flex;
    flex-wrap: wrap;
    margin: 0 auto;
}

.car_star {
    font-size: 14px;
    float: right;
    margin-right: 5px;
}

.car_title {
    font-size: 17px;
    margin: 0 10px 20px 10px;
}

.car_sort {
    font-size: 10px;
    font-weight: 500;
    margin: 0 0 30px 10px;
}

.car_content {
    margin: 0 0 3px 10px;
    font-size: 13px;
}

.car_option {
    margin: 3px 0 0 10px;
    font-size: 13px;
}

.price {
    float: right;
    margin-top: 20px;
    margin-right: 5px;
    font-size: 14px;
    font-weight: 700;
    
}

h4 {
    margin-left: 30px;
    padding-top: 20px;
}


</style>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="reservation.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body>
    <div class="container">
        <h2 style="padding-left: 150px; margin: 30px 0 10px 0;"><i class="fa-solid fa-angles-left"></i></h2>
        <h1 style="padding-left: 150px; margin-bottom: 30px;">차량 예약 </h1>
        <div class="wrap">
        <form name="paymentForm" method="post" >
        	
            <div class="goods_wrap" id="wrap">
                <ul class="goods_list">
                    <li><p>선택된 차량</p></li>
                    <li class="goods_item">
                        <div class="car_wrap" id="wrap">
					       <ul class="car_list">
					           <li class="car_item" style="width: 100%;">
					                       <img src="${pageContext.request.contextPath}/resources/images/campingcar/${dto.thumbnail}" style="width:250px; height:200px; margin: 0 auto;"/>
					               <div class="car_text">
					                   <div>
					                       <p class="car_sort">${dto.carSize}</p>
					                   	   <span class="car_title">${dto.carName}</span>
					                       <span class="car_star" style="text-decoration: underline;">후기 2개</span>
					                       <!-- <span class="car_star" style="margin-left: 160px;">★ 4.7 ·&nbsp;</span> -->
					                   	   <p class="car_content" style="color: #aaaaaa;">${dto.description}</p>
					                   </div>
					                   <div class="car_option">
					                       <span><i class="fa-solid fa-user-group"></i>&nbsp;${dto.carMaxNum}인&nbsp;</span>
					                       <span><i class="fa-solid fa-campground"></i>&nbsp;${dto.sleepNum}인&nbsp;</span>
					                       <c:if test="${dto.petOrNot == 1}">
					                       <span><i class="fa-solid fa-dog"></i>반려동물동반가능</span>
					                       </c:if>
					                   </div>
					
					                   <div class="price">
					                       <p style="color: rgb(80, 103, 231);">주중 : ${dto.weekCost}원(가격계산)</p>
					                   </div>
					                   <input type="hidden" name="thumbnail" value="${dto.thumbnail}">
					                   <input type="hidden" name="carSize" value="${dto.carSize}">
					                   <input type="hidden" name="carName" value="${dto.carName}">
					                   <input type="hidden" name="description" value="${dto.description}">
					                   <input type="hidden" name="carMaxNum" value="${dto.carMaxNum}">
					                   <input type="hidden" name="sleepNum" value="${dto.sleepNum}">
					                   <input type="hidden" name="petOrNot" value="${dto.petOrNot}">
					                   <input type="hidden" name="weekCost" value="${dto.weekCost}">
					                   <input type="hidden" name="wkndCost" value="${dto.wkndCost}">
					               </div>
					           </li>
					        </ul>
					    </div>
                    </li>
                    <li><p>선택 일정</p></li>
                    <li class="goods_item">
                        <div class="datebox">
                            <ul>
                                <li>
                                    <span><i class="fa-solid fa-calendar-days"
                                            style="color: #d0dbeb;"></i>&nbsp;대여일</span>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <span style="font-size: 20px;">${dto.start_date}</span>
                                     <input type="hidden" name="start_date" value="${dto.start_date}">
                                </li>
                            </ul>
                        </div>
                        <div class="datebox">
                            <ul>
                                <li>
                                    <span><i class="fa-solid fa-calendar-days"
                                            style="color: #d0dbeb;"></i>&nbsp;반납일</span>
                                </li>
                            </ul>

                            <ul>
                                <li>
                                    <span style="font-size: 20px;">${dto.end_date}</span>
                                    <input type="hidden" name="end_date" value="${dto.end_date}">
                                    <input type="hidden" name="userName" value="${dto.userName}">
                            		<input type="hidden" name="tel" value="${dto.tel}">
                            		<input type="hidden" name="discountRate" value="${dto.discountRate}">
                                </li>
                            </ul>
                        </div>
                        <div class="datebox">
                            <ul>
                                <li>
                                    <span>총</span>
                                </li>
                            </ul>

                            <ul>
                                <li>
                                    <span style="font-size: 20px;">1박(24시간)</span>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li><p>예약자 정보</p></li>
                    <li class="goods_item">
                        <ul>
                            <li>
                                이름 : ${sessionScope.member.userName}
                            </li>
                            <li>
                                휴대폰 번호 : ${dto.tel}
                            </li>
                            <li>
			                    <h4>동승운전자 추가 여부 <input type="checkbox" name="add"></h4>
                            </li>
                            
                        </ul>
                    </li>
                    <li><p>결제 방식</p></li>
                    <li class="goods_item">
                        <ul>
                            <li>
                                <input type="radio" name="check">&nbsp;카카오페이&nbsp;&nbsp;
                                <input type="radio" name="check">&nbsp;네이버페이
                            </li>
                        </ul>
                    </li>
                    <li><p>총 대여금액</p></li>
                    <li class="goods_item">
                        <ul>
                            <li>
                                차량대여료 : <fmt:formatNumber value="${dto.weekCost}"/>원
                            </li>
                            <li>
                            	할인율 : ${dto.discountRate}%
                            </li>
                            <li>
                                할인 가격 : ${dto.discount}원
                            </li>
                            <li>
                                총 금액 : ${dto.totMoney}원
                            </li>
                            <li>
                                이용약관(보험고지,손해면책 등) <i class="fa-solid fa-angle-right"></i>
                            </li>
                            <li>
                                개인정보 취급방침 <i class="fa-solid fa-angle-right"></i>
                            </li>
                            <li>
                                <input type="checkbox" name="submit">
                                위 내용을 확인하였으며, 결제 및 예약에 동의합니다.
                            </li>
                            <li>
                            	<div style="width: 100%;">
                            		<div style="width: 400px; margin: 30px auto;">
                                		<button type="submit" id="reservation_check">결제하기</button>
                               		</div>
                               	</div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
           
            </form>
        </div>
        </div>
</body>

