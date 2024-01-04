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
    padding-top: 110px;
}

.container .wrap {
    width: 1080px;
    margin: 0 auto;
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



.wrap {
    display: flex;
}

.goods_wrap {
    width: 1158px;
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
    width: 600px;
    margin: 0 auto;
}


.goods_wrap .goods_list .goods_item {
    width: 500px;
    height: 200px;
    margin: 20px;
    border: 1px solid silver;
    display: flex;
    justify-content: space-between;
}

.reservation_date {
    width: 500px;
    margin: 20px;
    padding: 50px;
    display: flex;
    justify-content: space-between;
    border: 1px solid silver;
}

.car_user {
    width: 500px;
    margin: 20px;
    padding: 10px;
    border: 1px solid silver;
}

.coupon_use {
    width: 500px;
    margin: 20px;
    padding: 10px;
    border: 1px solid silver;
}

.total_count {
    width: 500px;
    margin: 20px;
    padding: 10px;
    border: 1px solid silver;
}

.total_count li {
    margin: 10px 0;
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

#reservation_input {
    margin-top: 3px;
    width: 300px;
    height: 40px;
    border: 2px solid silver;
    border-radius: 5px;
    font-size: 15px;
} 

#reservation_input_photo {
    width: 300px;
    height: 200px;
}

button {
    width: 400px;
    height: 50px;
    font-size: 27px;
    font-weight: 700;
    color: white;
    background-color: hsl(39, 100%, 52%);
    border: 0;
    border-radius: 10px;
    margin-left: 40px;
}

.total_count li:nth-child(-n+3) {
    margin: 20px 0;
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
        <h2 style="padding-left: 60px;"><i class="fa-solid fa-arrow-left"></i></h2>
        <h1 style="padding-left: 60px;">예약 페이지</h1>
        <div class="wrap">

            <div class="goods_wrap" id="wrap">
                <ul class="goods_list">
                    <li class="goods_item">
                    <h4>선택된 차량</h4>
                        <p><a href="#" class="goods_photo">
                                <img src="https://via.placeholder.com/250x200" alt="goods_item">
                            </a></p>
                        <div class="goods_text" style="width: 580px;">
                            <div>
                                <span class="car_sort">소형차</span>
                                <span class="car_star" style="text-decoration: underline;">후기 2개</span>
                                <span class="car_star">★ 4.7 ·&nbsp;</span>
                            </div>
                            <div class="car_title">
                                <span style="font-weight: bold;">레이 2인승 1호차</span>
                            </div>
                            <p class="car_content" style="color: #aaaaaa;">#커플 추천</p>
                            <hr>
                            <div class="car_option">
                                <span><i class="fa-solid fa-user-group"></i>동승 2인&nbsp;</span>
                                <span><i class="fa-solid fa-campground"></i>취침 2인&nbsp;</span>
                                <span><i class="fa-solid fa-dog"></i>반려동물동반가능</span>
                            </div>
                            <div class="price">
                                <p style="color: rgb(80, 103, 231);">주중 : 80,000원 부터</p>
                                <p style="color: rgb(80, 103, 231);">주말 : 130,000원 부터</p>
                            </div>
                        </div>
                    </li>
                    <li class="reservation_date">
                    <h4>선택 일정</h4>
                        <div style="text-align: center;">
                            <ul>
                                <li>
                                    <span><i class="fa-solid fa-calendar-days"
                                            style="color: #d0dbeb;"></i>&nbsp;대여일</span>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <span style="font-size: 20px;">2023-12-24</span>
                                </li>
                            </ul>
                        </div>
                        <div style="text-align: center;">
                            <ul>
                                <li>
                                    <span><i class="fa-solid fa-calendar-days"
                                            style="color: #d0dbeb;"></i>&nbsp;반납일</span>
                                </li>
                            </ul>

                            <ul>
                                <li>
                                    <span style="font-size: 20px;">2023-12-25</span>
                                </li>
                            </ul>
                        </div>
                        <div style="text-align: center;">
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
                    <li class="car_user">
                    <h4>예약자 정보</h4>
                        <ul>
                            <li>
                                이름 : 홍길동
                            </li>
                            <li>
                                휴대폰 번호 : 010 - 1111 - 1111
                            </li>
                        </ul>
                    <h4>동승운전자 추가 여부 <input type="checkbox" name="add"></h4>
                    </li>
                </ul>
            </div>
            <div class="goods_wrap" id="wrap">
                <ul class="goods_list">
                    <li class="coupon_use">
                    <h4>쿠폰 사용</h4>
                        <ul>
                            <li>
                                사용할 쿠폰&nbsp;&nbsp; 
                                <select>
                                    <option>사용가능한 쿠폰이 없습니다.</option>
                                </select>
                            </li>
                        </ul>
                    </li>
                    <li class="coupon_use">
                    <h4>결제 방식</h4>
                        <ul>
                            <li>
                                <input type="radio" name="check">&nbsp;카카오페이&nbsp;&nbsp;
                                <input type="radio" name="check">&nbsp;네이버페이
                            </li>
                        </ul>
                    </li>
                    <li class="total_count">
                    <h4>총 대여금액</h4>
                        <ul>
                            <li>
                                차량대여료 : 80,000원
                            </li>
                            <li>
                                쿠폰 할인 가격 : 0원
                            </li>
                            <li>
                                총 금액 : 80,000원
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
                                <button type="submit" id="reservation_check">결제하기</button>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>

