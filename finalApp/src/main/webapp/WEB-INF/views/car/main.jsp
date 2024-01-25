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
    margin-bottom: 200px;
}

.car_wrap {
    width: 1180px;
    margin: 0 auto;
   	/*border: 1px solid yellow;*/
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

.card-border{
	display:border-box;
	/*border: 1px solid blue ;*/
	margin-bottom: 30px;
	margin-left: 0;
	background-color: var(--white);
  	border-radius: var(--button-radius);
  	box-shadow: 0 0.9rem 1.7rem rgba(0, 0, 0, 0.25),
    0 0.7rem 0.7rem rgba(0, 0, 0, 0.22);
  	overflow: hidden;
  	position: relative;
	border-radius: 10px;
}


.car_list {
	display:flex;
	justify-content: space-between;
	padding-left: 0;
	/*border: 1px solid pink;*/
}

.car_wrap .car_list .car_item p .car_photo {
    position: relative;
    border-radius: 10px 10px 0 0;
}

.car_photo img {
   background-size: cover;
   width: 350px;
   height: 250px;
   border-radius: 10px 10px 0 0;

}


.car_wrap .car_list {
    display: flex;
    flex-wrap: wrap;
}


.car_wrap .car_list .car_item {
    width: 350px;
    margin: 0px;
    height: 450px;
    /* border: 1px solid skyblue */
    margin-bottom: 120px;
}



.car_list .car_item .car_photo {
    display: block;
    overflow: hidden;
    border-radius: 12px;
	margin:0;
}
/*  */



.car_list .car_item .car_text {
    height: 200px;
    padding: 8px;
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

.car_sort_wrap {
	display: flex;
	justify-content: space-between;
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
    font-size: 16px;
    font-weight: 700;
    width: 350px;
    float: right;
}

.price p {
    text-align: right;
	margin-bottom: 5px;
}




.car_main {
    background: url('../resources/images/campingcar/campingcar.jpg') no-repeat center center;
    height: 400px;
    border-radius: 15px;
    margin-top: 70px;
    width: 1180px;
    margin: 30px auto;
    margin-bottom: 100px;
}

.maintitle {
	margin-left: 40px;
	margin-top: 40px;
    color: white;
    font-weight: 700;
    font-size: 40px;
}

.searchbox {
    border-radius: 10px;
    background-color: white;
    text-align: center;
	margin: 45px auto;
	margin-right: 70px;
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


#search1, #date1, #date2 {
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

#date1, #date2 {
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

#searchbutton:hover {
	background-color: #000069;
}


</style>

<main>
	<div class="car_main shadow-lg p-3 mb-5 bg-body-tertiary" id="wrap"> <!-- car_wrap -->
       <div class="car_list">
           <div class="maintitle">
               <p style="color: white;">캠핑카,</p>
               <p style="color: white;">더이상 멀지 않아!</p>
           </div>
           <div class="searchbox">
               <p>캠핑카, 이제는 쉽게 예약하세요</p>
               <form  class="row" name="searchForm">
                   <table class="car_search" style="text-align: center;">
                       <tr>
                           <td colspan="3">
                               <select id="search1" name="carSize">
                                   <option value="0">차량유형</option>
                                   <option value="1" ${carSize==1?"selected":"" }>모터홈</option>
                                   <option value="2" ${carSize==2?"selected":"" }>차박형(중형)</option>
                                   <option value="3" ${carSize==3?"selected":"" }>차박형(소형)</option>
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
                               <input id="date1" type="date" name="start_date" value="${start_date}"
                               	placeholder="대여일" data-target="#date1" />
                           </td>
                           <td>
                               ~
                           </td>
                           <td>
                               <input id="date2" type="date" name="end_date" value="${end_date}"
                                placeholder="반납일" data-target="#date2" />
                           </td>
                       </tr>
                       <tr>
                           <td colspan="3">
                               <button type="button" id="searchbutton" onclick="searchOk();">캠핑카 검색 <i
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
           	<div class="card-border">
               <p><a href="${pageContext.request.contextPath}/car/car_detail?carNum=${dto.carNum}" class="car_photo">
                       <img src="${pageContext.request.contextPath}/uploads/caravan/${dto.thumbnail}" alt="car_item" style="width:350px; height:250px;'">
                   </a></p>
               <div class="car_text">
                   <div style="width: 350px;">
                   	<div class="car_sort_wrap">
                       <p class="car_sort">${dto.carSize}</p>
                   	   <c:if test="${dto.discountRate != 0}">
                   	   		<span class="badge text-bg-danger" style="line-height: 17px; font-size: 13px;">${dto.discountRate}% 할인</span>
                   	   </c:if>
                   	</div>
                   	   <span class="car_title">${dto.carName}</span>
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
                   	   <c:if test="${dto.discountRate == 0}">
                       	<p style="color: rgb(80, 103, 231);">주중 : <fmt:formatNumber value="${dto.weekCost}"/>원 부터</p>
                       	<p style="color: rgb(80, 103, 231);">주말 : <fmt:formatNumber value="${dto.wkndCost}"/>원 부터</p>
                       
                   	   </c:if>
                   	   <c:if test="${dto.discountRate > 0}">
						<c:set var="discountedWeekCost" value="${dto.weekCost - (dto.weekCost * (dto.discountRate / 100))}" />
						<c:set var="discountedWkndCost" value="${dto.wkndCost - (dto.wkndCost * (dto.discountRate / 100))}" />
						<p style="color: #FF0000;">주중 : <fmt:formatNumber value="${discountedWeekCost}"/>원 부터</p>
						<p style="color: #FF0000;">주말 : <fmt:formatNumber value="${discountedWkndCost}"/>원 부터</p>
                   	   </c:if>
                   </div>
               </div>
             </div>
           </li>
           
           </c:forEach>
        </ul>
        
        
    </div>
</main>

<script type="text/javascript">
function searchOk() {
	const f= document.searchForm;
	
	if(f.start_date.value ||f.end_date.value){
		if (!f.start_date.value){
			alert('시작일을 선택해주세요')
			return;
		}
		if (!f.end_date.value){
			alert('종료일을 선택해주세요')
			return;
		}
	}
	let today = new Date();
	let date1 = new Date(f.start_date.value);
	let date2 = new Date(f.end_date.value);
	if (date1<=today){
    	alert('오늘 날짜 이후를 입력하세요.');
		f.start_date.focus();
		return false;
    }
    if (date2<=date1){
    	alert('종료일은 시작일 이후여야합니다');
		f.end_date.focus();
		return false;
    }
    
	query=$('form[name=searchForm]').serialize();
	console.log(query)
	f.action = "${pageContext.request.contextPath}/car/main";
	f.submit();
}
</script>