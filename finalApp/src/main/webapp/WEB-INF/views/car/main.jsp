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

.goods_wrap .goods_list .goods_item p .goods_photo {
    position: relative;
}

.goods_wrap .goods_list .goods_item p .goods_photo i {
    position: absolute;
    top: 7px;
    right: 9px;
    font-size: 30px;
}

.goods_wrap .goods_list {
    display: flex;
    flex-wrap: wrap;
}


.goods_wrap .goods_list .goods_item {
    width: 350px;
    margin: 17px;
    height: 450px;
    /* border: 1px solid skyblue */
}

.goods_list .goods_item .goods_photo {
    display: block;
    height: 250px;
    overflow: hidden;
    border: 1px solid #dedede;
    border-radius: 12px;
}

.goods_list .goods_item .goods_text {
    height: 200px;
    padding-top: 8px;
    margin-bottom: 28px;
}

.goods_text {
    display: flex;
    flex-wrap: wrap;
}

.car_star {
    font-size: 17px;
    float: right;
    margin-right: 5px;
}

.car_title {
    font-size: 20px;
    margin: 0 10px 20px 10px;
}

.car_sort {
    font-size: 13px;
    font-weight: 500;
    margin: 0 0 30px 10px;
}

.car_content {
    margin: 0 0 3px 10px;
}

.car_option {
    margin: 3px 0 0 10px;
}

.price {
    float: right;
    margin-top: 20px;
    margin-right: 5px;
    font-size: 17px;
    font-weight: 700;
    
}


.car_main {
    background: url('../resources/images/campingcar/campingcar.jpg') no-repeat center center;
    height: 400px;
    border-radius: 10px;
}

.maintitle {
    color: white;
    font-weight: 700;
    font-size: 40px;
    margin: 50px;
}

.searchbox {
    border-radius: 10px;
    background-color: white;
    text-align: center;
    position: absolute;
    bottom: 33%;
    left: 50%;
}

.car_search {
    
    margin: 20px auto;
    padding: 10px 30px 0px 30px;
    width: 450px;

}

#search1, #search2 {
    border: 2px solid silver;
    border-radius: 10px;
    font-size: 15px;
}

#search1 {
    width: 360px;
    height: 40px;
    margin-bottom: 10px;
}

#search2 {
    width: 157px;
    height: 40px;
    margin-bottom: 20px;
}

#searchbutton {
    width: 360px;
    height: 40px;
    background-color: rgb(84, 63, 202);
    color: white;
    border: 1px solid rgb(84, 63, 202);
    border-radius: 10px;
    font-weight: 600;
    font-size: 15px;
}


</style>

<main>
	<div class="goods_wrap car_main" id="wrap">
       <ul class="goods_list">
           <div class="maintitle">
               <p style="color: white;">캠핑카,</p>
               <p style="color: white;">더이상 멀지 않아!</p>
           </div>
           <div class="searchbox">
               <h3 style="margin: 30px 0 5px 0;">캠핑카, 이제는 쉽게 예약하세요</h3>
               <form>
                   <table class="car_search" style="text-align: center;">
                       <tr>
                           <td colspan="3">
                               <select id="search1" name="option">
                                   <option>차량유형</option>
                                   <option>모터홈</option>
                                   <option>차박형(중형)</option>
                                   <option>차박형(소형)</option>
                               </select>
                           </td>
                       </tr>
                       <tr style="font-size: 13px;">
                           <td>대여일</td>
                           <td>&nbsp;</td>
                           <td>반납일</td>
                       </tr>
                       <tr>
                           <td>
                               <input id="search2" type="date" name="대여일">
                           </td>
                           <td style="width: 5%; height: 40px;">
                               ~
                           </td>
                           <td>
                               <input id="search2" type="date" name="반납일">
                           </td>
                       </tr>
                       <tr>
                           <td colspan="3">
                               <button type="button" id="searchbutton">캠핑카 검색 <i
                                       class="fa-solid fa-magnifying-glass"
                                       style="color: white;"></i></button>
                           </td>
                       </tr>
                   </table>
               </form>
           </div>
       </ul>
   </div>

   <div class="goods_wrap" id="wrap">
       <ul class="goods_list">
           <li class="goods_item">
               <p><a href="#" class="goods_photo">
                       <img src="https://via.placeholder.com/350x250" alt="goods_item">
                       <i class="fa-regular fa-heart"></i>
                   </a></p>
               <div class="goods_text">
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
           <li class="goods_item">
               <p><a href="#" class="goods_photo">
                   <img src="https://via.placeholder.com/350x250" alt="goods_item">
                   <i class="fa-regular fa-heart"></i>
               </a></p>
               <div class="goods_text">
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
           <li class="goods_item">
               <p><a href="#" class="goods_photo">
                   <img src="https://via.placeholder.com/350x250" alt="goods_item">
                   <i class="fa-regular fa-heart"></i>
               </a></p>
               <div class="goods_text">
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
           <li class="goods_item">
               <p><a href="#" class="goods_photo">
                   <img src="https://via.placeholder.com/350x250" alt="goods_item">
                   <i class="fa-regular fa-heart"></i>
               </a></p>
               <div class="goods_text">
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
           <li class="goods_item">
               <p><a href="#" class="goods_photo">
                   <img src="https://via.placeholder.com/350x250" alt="goods_item">
                   <i class="fa-regular fa-heart"></i>
               </a></p>
               <div class="goods_text">
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
        </ul>
    </div>
</main>

