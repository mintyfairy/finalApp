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





.car_wrap {
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

.car_wrap .car_list .car_item p .car_photo {
    position: relative;
}

.car_wrap .car_list .car_item p .car_photo i {
    position: absolute;
    top: 7px;
    right: 9px;
    font-size: 30px;
}

.car_wrap .car_list {
    display: flex;
    flex-wrap: wrap;
}


.car_wrap .car_list .car_item {
    width: 350px;
    margin: 17px;
    height: 450px;
    /* border: 1px solid skyblue */
}

.car_list .car_item .car_photo {
    display: block;
    height: 250px;
    overflow: hidden;
    border: 1px solid #dedede;
    border-radius: 12px;
}

.car_photo img {
	background-size: cover;
	width: 350px;
	height: 250px;
}

.car_list .car_item .car_text {
    height: 200px;
    padding-top: 8px;
    margin-bottom: 28px;
    display: flex;
    flex-wrap: wrap;
}

.car_star {
    font-size: 17px;
    float: right;
}

.car_title {
	font-size: 23px;
	font-weight: bold;
    margin: 5px 10px 20px 15px;
}

.car_sort {
    font-size: 14px;
    font-weight: 600;
    margin: 0 0 5px 15px;
}

.car_content {
	font-size: 15px;
    margin: 5px 0 3px 10px;
}

.car_option {
	font-size: 18px;
    margin: 3px 0 0 10px;
}

.price {
    margin-top: 20px;
    margin-right: 5px;
    font-size: 18px;
    font-weight: 700;
    width: 350px;
    float: right;
}

.price p {
    text-align: right;
}




.car_main {
    background: url('../resources/images/campingcar/campingcar.jpg') no-repeat center center;
    height: 400px;
    border-radius: 10px;
    margin-top: 70px;
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
	margin: 40px auto;
    bottom: 10%;
    left: 50%;
    width: 450px;
}

.searchbox p {
	font-size: 21px;
	font-weight: 800;
	margin-top: 30px;
}

.car_search {
    margin: 20px auto;
    width: 360px;
}


#search1, #search2 {
    border: 2px solid silver;
    border-radius: 10px;
    font-size: 18px;
    padding-left: 10px;
   
}

#search1 {
    width: 356px;
    height: 45px;
    margin-bottom: 10px;
}

#search2 {
    width: 170px;
    height: 45px;
    text-align: center;

}

#searchbutton {
    width: 360px;
    height: 45px;
    background-color: rgb(84, 63, 202);
    color: white;
    border: 1px solid rgb(84, 63, 202);
    border-radius: 10px;
    font-weight: 600;
    font-size: 18px;
    margin-top: 20px;
    
}


</style>

<main>
	<div class="car_wrap car_main" id="wrap">
       <div class="car_list">
           <div class="maintitle">
               <p style="color: white;">캠핑카,</p>
               <p style="color: white;">더이상 멀지 않아!</p>
           </div>
           <div class="searchbox">
               <p>캠핑카, 이제는 쉽게 예약하세요</p>
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
                       <tr style="font-size: 14px; font-weight: 700;">
                           <td>대여일</td>
                           <td style="width: 3%;">&nbsp;</td>
                           <td>반납일</td>
                       </tr>
                       <tr>
                           <td>
                               <input id="search2" type="date" name="대여일">
                           </td>
                           <td>
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
       </div>
   </div>

   <div class="car_wrap" id="wrap">
       <ul class="car_list">
         <c:forEach var="dto" items="${list}" varStatus="status">
           <li class="car_item">
               <p><a href="${pageContext.request.contextPath}/car/car_detail?carNum=${dto.carNum}" class="car_photo">
                       <img src="${pageContext.request.contextPath}/resources/images/campingcar/caravanpic100.jpg" alt="car_item">
                       <!-- <img src="${pageContext.request.contextPath}/resources/images/campingcar/${dto.thumbnail}/350x250" alt="car_item"> -->
                       <i class="fa-regular fa-heart"></i>
                   </a></p>
               <div class="car_text">
                   <div style="width: 350px;">
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
                       <p style="color: rgb(80, 103, 231);">주중 : <fmt:formatNumber value="${dto.weekCost}"/>원 부터</p>
                       <p style="color: rgb(80, 103, 231);">주말 : <fmt:formatNumber value="${dto.wkndCost}"/>원 부터</p>
                   </div>
               </div>
           </li>
           </c:forEach>
        </ul>
    </div>
</main>

