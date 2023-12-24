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

.goods_wrap {
    width: 1158px;
    margin: 30px auto;
    display: flex;
    flex-wrap: wrap;
    border: 1px solid silver;
    
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
    border: 1px solid rgb(57, 166, 209);
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

-- 내가 추가한 것
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

</style>

<h2>내가 찜한 목록</h2>
   <hr>
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
       </ul>
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
       </ul>
   </div>
   <hr> 