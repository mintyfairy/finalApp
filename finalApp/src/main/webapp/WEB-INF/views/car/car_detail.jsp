<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style>
@charset "utf-8";

* {
    margin: 0;
    padding: 0;
    text-decoration: none;
    color: #333;
    box-sizing: border-box;
}
*, *::after, *::before { box-sizing: border-box; }

ol,
ul {
    list-style: none;
}

main {
    margin-bottom: 150px;
}

body {
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 14px;
	color: #222;
}

h1, h2, h3, h4, h5, h6 {
	font-family: NanumGothic, 나눔고딕, "Malgun Gothic", "맑은 고딕", 돋움, sans-serif;
}


#wrap {
  width: 1080px;
  box-sizing: border-box;
  margin: 50px auto;

}



#wrap2 {
  width: 1000px;
  box-sizing: border-box;
  margin: 50px auto;
}

.first-container {
  padding: 25px;
  display: flex;
  margin: 20px auto;
  border: 1px soild red;
}

.thumbnail-addImages {
  box-sizing: border-box;
  border: none;
  margin: 0 auto;
  padding-left: 20px;
  
}

.addImages > img {
  box-sizing: border-box;
  border: 1px solid grey;
  width: 50px;
  height: 50px;
}

.car-detail {
  box-sizing: border-box;
  border: none;
  width: 500px;
  height: 600px; 
  margin: 0 auto;
  padding-left: 50px;
}

.thumbnail{
  width: 450px;
  height: 350px;
  box-sizing: border-box;
  border: none;
  
 
}

.thumbnail > img:first-child {
  height: 100%;
  width: 100%;
  background-repeat : no-repeat; 
  background-size : cover 
  
}


.carName-liked {
  display: flex;
  justify-content: center;
  float:left
}



.fa-heart {
  font-size: 25px;
  font-weight: 600;
  padding-left: 25px;
  margin-top: 5px;
}

.option-mini {
  margin-top: 10px;
  width: 400px;
  padding: 5px 10px;
  display: flex;
  justify-content: space-between;
}

.option-mini > span {
  box-sizing: border-box;
  border: 1px solid gray;
  background-color: beige;
  margin-right: 15px;
  padding: 5px;
  font-size: 10px;
}

.calendar {
  margin-top: 30px;
  width: 400px;
  height: 100px;
  box-sizing: border-box;
  border: gray;
  display: flex;
  flex-wrap: wrap;
  
  
}

.calendar > form {
  display: flex;
  width: 500px;
  height: 100%;
  justify-content: space-between;
}

.calendar .start-date {
  width: 190px;
  height: 100%;
  box-sizing: border-box;
  border: gray;
  
}

.calendar .end-date {
  width: 190px;
  height: 100%;
  box-sizing: border-box;
  border: gray;
}

#wrap .calendar > p {
  font-size: 50px;
  color: gray;
}
.calendar > input {
  height: 60%;
  width: 190px;
  border: #dedede;
  
}

input[type=date] {
  width: 100%;
  height: 60px;
  font-size: 20px;
  text-align: center;
  border-radius: 10px;
  margin-top: 5px;
  
  
}

#date {
	border: 2px solid #bebebe;
	font-weight: 600;
	color: #3c3c3c;
}

input[type='date']::before {
  content: attr(data-placeholder);
  width: 100%;
}

input[type='date']:focus::before,
input[type='date']:valid::before {
  display: none;
}

.totalFee {
	height: 50px;
}

#totalFee {
	margin: 0 auto; 
	font-weight: 700;
	font-size: 20px;
	text-align: center;
	
}

.usetime {
  width: 400px;
  height: 80px;
  box-sizing: border-box;
  border: none;
  padding: 20px 30px;
}

.borrow-area {
  margin-top: 15px;
  width: 400px;
  height: 80px;
  box-sizing: border-box;
  border: none;
 
}

.price-reservation {
  width: 400px;
  height: 80px;
  box-sizing: border-box;
  border: none;
  margin-top: 40px;
}
.price {
  font-size: 20px;
  font-weight: 700;
  box-sizing: border-box;
  border: none;
  text-align: center;
  margin: 10px 0 20px 0;
}


button[name=reservation] {
  background-color: #275efe;
  font-size: 15px;
  color: #fff;
  padding:4px 8px;
  width: 300px;
  height: 50px;
  font-family: 'Roboto';
  font-weight: 600;
  border-radius: 24px;
  display: block;
  outline: none;
  appearance: none;
  border: none;
  margin: 0 auto;
}
button[name=reservation]:hover {
  background-color:#002ead;
  transition: 0.7s;
}

.second-container {
  box-sizing: border-box;
  background-color: white;

  margin: 0 auto;
}


.available-size {
  display: flex;
  width: 800px;
  margin: 0 auto;
  border: 3px solid silver;
  border-radius: 20px;
  padding: 40px;
  
}

.available-mini {
	text-align: center;
	margin: 0 auto;
	width: 250px;
	margin-top: 18px;
	margin-right: 10px;
}

.available-mini h3 { padding-bottom: 15px; color: gray;}

.available-mini p { font-size: 20px; font-weight: 600;}



.option-detail {
  width: 70%;
  min-height: 500px;
  box-sizing: border-box;
  border: none;
  margin: 0 auto;
}

.option-detail > div {
  width: 90%;
  min-height: 50px;
  box-sizing: border-box;
  border: none;
  display: flex;
  margin: 0 auto;
  justify-content: space-between;
}

.option-detail > div > p {
  font-size: 16px;
  font-weight: 500;
  margin: 15px;
  padding-top: 8px;
}

/*
.option-detail > div > img {
  font-size: 14px;
  font-weight: 500;
  margin-top: 10px;
  margin-right: 100px;
}
*/



.option-detail > div > img{
  width: 50px;
  height: 50px;
  background-repeat : no-repeat; 
  background-size : cover  
}

/*탭*/
ol,
ul {
    list-style: none;
}

.container-detail {
    padding-top: 50px;
    margin-bottom: 140px;
}

.container .wrap {
    width: 1080px;
    margin: 0 auto;
}

.product_info_wrap {
    display: flex;
    justify-content: space-between;
}

.product_info_wrap .product_thumb {
    flex-basis: 50%;
}

.product_info_wrap .product_info {
    flex-basis: 47%;
}

.product_info .product_title {
    position: relative;
    border-bottom: 1px solid #efefef;
    margin-bottom: 28px;
}

.product_info .product_title .brand {
    display: block;
    font-size: 18px;
    margin-bottom: 5px;
}

.product_info .product_title .product_name {
    font-size: 28px;
    margin-bottom: 28px;
}

.product_info .product_title .like_btn {
    position: absolute;
    top: 0;
    right: 0;
}

.product_value {
    margin-bottom: 72px;
}

.product_value div {
    display: flex;
    align-items: center;
    flex-wrap: nowrap;
}

.product_value .product_price {
    margin-bottom: 14px;
}

.product_value div p:first-child {
    width: 130px;
    font-size: 13px;
    font-weight: bold;
}

.product_value .product_delivery {
    margin-bottom: 28px;
}

.product_value .product_delivery p:nth-child(2) {
    font-size: 13px;
}

.product_value .brand_name {
    color: #575757;
    font-size: 15px;
    margin-bottom: 15px;
}

.product_value .cnt_price {
    display: flex;
    justify-content: space-between;
    margin-bottom: 28px;
    padding-right: 30px;
    padding-bottom: 28px;
    border-bottom: 1px solid #efefef;
}

.product_value .cnt_price .qty input {
    width: 60px;
    height: 35px;
    padding-left: 15px;
    font-size: 13px;
    text-align: left;
    border-radius: 0;
    border: 1px solid #e6e6e6;
}

.product_value .cnt_price .qty button {
    width: 35px;
    height: 35px;
    font-size: 20px;
    cursor: pointer;
    background-color: #fff;
    border-radius: 0;
    border: 1px solid #e6e6e6;
}

.product_value .total_price {
    display: flex;
    justify-content: space-between;
}

.btn_list {
    display: flex;
}

.btn_list a {
    display: block;
    width: 138px;
    height: 60px;
    margin-left: 7px;
    color: black;
    text-align: center;
    line-height: 60px;
    background-color: #fff;
    border: 1px solid #efefef;
}

.btn_list a:first-child {
    width: 224px;
    color: #fff;
    background-color: #000;
    border: 1px solid black;
}

.detail_wrap {
    padding-top: 100px;
}

.detail_wrap .detail_tab .tab_list {
    display: flex;
}

.tab_list .tab_item {
    width: 25%;
}

.tab_list .tab_item a {
    display: block;
    height: 60px;
    font-size: 15px;
    color: #9f9f9f;
    line-height: 60px;
    text-align: center;
    border-bottom: 2px solid #e5e5e5;
}

.tab_list .tab_item a:active {
    color: #000;
    border-bottom: 2px solid #000;
}

.detail_wrap .detail_img {
    padding-top: 60px;
    padding-bottom: 100px;
    text-align: center;
}

.detail_review {
    margin-bottom: 100px;
    padding-top: 60px;
}

.detail_review .review_table table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
    word-wrap: break-word;
    word-break: keep-all;
    border-top: 1px solid black;
}

.detail_review .review_table table tbody tr {
    border-bottom: 1px solid #e5e5e5;
}

.detail_review .review_table table tbody tr td {
    padding: 15px 0;
    text-align: center;
    font-size: 13px;
    font-weight: bold;
}

.detail_review .review_write {
    position: relative;
    margin-top: 20px;
}

.detail_review .review_write a {
    position: absolute;
    right: 0;
    display: block;
    width: 108px;
    height: 38px;
    font-size: 13px;
    color: #000;
    text-align: center;
    line-height: 38px;
    border: 1px solid #231f20;
    background: #fff;
}

.detail_qna {
    margin-bottom: 100px;
    padding-top: 60px;
}

table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
    word-wrap: break-word;
    word-break: keep-all;
    border-top: 1px solid black;
}

.detail_qna .qna_table table tbody tr {
    border-bottom: 1px solid #e5e5e5;
}

.detail_qna .qna_table table tbody tr td {
    padding: 15px 0;
    text-align: center;
    font-size: 13px;
    font-weight: bold;
}

.detail_qna .qna_write {
    position: relative;
    margin-top: 20px;
}

.detail_qna .qna_write a {
    position: absolute;
    right: 0;
    display: block;
    width: 108px;
    height: 38px;
    font-size: 13px;
    color: #000;
    text-align: center;
    line-height: 38px;
    border: 1px solid #231f20;
    background: #fff;
}

.detail_as {
	width: 1080px;
}

.detail_as .as_table table tbody tr th {
    font-size: 16px;
    font-weight: 500;
    border-bottom: 1px solid #e6e6e6;
    background: #f9f9f9;
}

.detail_as .as_table table tbody tr td {
    padding: 45px 20px;
    font-size: 13px;
    border-bottom: 1px solid #e6e6e6;
}


.container { 
	/* margin: 0 auto; */
	width: 100%;	
}
.body-container { 
	margin-bottom: 50px;
	max-width: 1000px;
	display:flex;
}
.body-main {
	margin: 0 auto;
	width: 799px;
	justify-content: space-between;
}



ul.tabs{
  margin: 0px;
  padding: 0px;
  list-style: none;
  display: flex;
}
ul.tabs li{
  width: 200px;
  background: none;
  color: #222;
  display: inline-block;
  padding: 10px 15px;
  cursor: pointer;
  text-align: center;
}

ul.tabs li.current{
  background: #ededed;
  color: #222;
  font-weight: 600;
}

.tab-content{
  display: none;
  background: #ededed;
  padding: 15px;
}

.tab-content.current{
	width: 100%;
  display: inherit;
}


</style>
<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}


</script>










<div id="wrap">

  <div class="first-container">
    <div class="thumbnail-addImages">
    <form method="post" enctype="multipart/form-data">
      <div class="thumbnail">
        <img src="${pageContext.request.contextPath}/resources/images/campingcar/campingcar.jpg"/>
      </div>
      <div class="addImages">
        <img src="${pageContext.request.contextPath}/resources/images/campingcar/bed.png" alt="bed">
        <img src="${pageContext.request.contextPath}/resources/images/campingcar/bed.png" alt="bed">
      </div>
      </form>
    </div>
    <div class="car-detail">
      <div class="carName-liked">
        <h3>${dto.carName}</h3>
        <i class="fa-regular fa-heart" style="margin-left: 50px;"></i>
      </div>
     
    <div style="text-align: center; margin-top: 5px;">
    	<p>${dto.description}</p>
    </div>
      
      <div class="calendar">
        <form name="datepickForm" method="post">
          <div class="start-date">
          
            <p style="font-size: medium; font-weight: bold; margin-left: 65px;">대여일</p>
            <input id="start_date" type="date" name="start_date" style="font-size:16px;, font-weight: 450;">
          </div>
          <p style="margin-top: 40px; font-size: large; font-weight: 600;"> | </p>
          <div class="end-date">
            <p style="font-size: medium; font-weight: bold; margin-left: 65px;">반납일</p>
            <input id="end_date" type="date" name="end_date" style="font-size:16px;, font-weight: 450;">
            <input type="hidden" name="carNum" value="${dto.carNum}">
            <input type="hidden" name="discountRate" value="${dto.discountRate}">
            <input type="hidden" id="inputTotalFee" name="totMoney" value="0">
            <input type="hidden" id="inputDisTotalFee" name="fee" value="0">
          </div>
		</form>
      </div>
      
      <br>
      <hr style="width: 400px;">
	  
	  <div class="usetime">
        <p>
          출고가능시간 &nbsp;  |&nbsp; 오전 8시 00분 ~ 오전 10시 00분
          <br>          
          반납마감시간 &nbsp;  |&nbsp;  오후 8시 00분
      </div>
      
      <hr style="width: 400px;">
      
      <div class="borrow-area">
        <p style="font-size: 15px; font-weight: bold;">대여장소</p>

        <p style="margin: 10px 65px">서울특별시 월드컵북로 21 풍성빌딩 2층</p>
      </div>
      
      <hr style="width: 400px;">
    
      <div class="price-reservation">
          <p style="font-size: 15px; font-weight: bold;">차량대여료</p>
          <div class="price">
          	<c:if test="${dto.discountRate == 0}">
              <span>주중 : <fmt:formatNumber value="${dto.weekCost}"/>~</span>
          	  <span>&nbsp;&nbsp;</span>
          	  <span>주말 : <fmt:formatNumber value="${dto.wkndCost}"/>~</span>
            </c:if>
            <c:if test="${dto.discountRate > 0}">
              <p style="font-size: 15px;">${dto.discountRate}% 할인가 <i class="fa-solid fa-wand-magic-sparkles"></i></p>
			  <c:set var="discountedWeekCost" value="${dto.weekCost - (dto.weekCost * (dto.discountRate / 100))}" />
			  <c:set var="discountedWkndCost" value="${dto.wkndCost - (dto.wkndCost * (dto.discountRate / 100))}" />
				<span style="color: #FF0000;">주중 : <fmt:formatNumber value="${discountedWeekCost}"/>~</span>
				<span>&nbsp;&nbsp;</span>
				<span style="color: #FF0000;">주말 : <fmt:formatNumber value="${discountedWkndCost}"/>~</span>
            </c:if>
          </div>
          <div class="totalFee">
          	<div id="totalFee"></div>
          </div>
      	</div>
      
          <div class="totalFee">
          	<div id="totalFee"></div>
          </div>
      
      <div class="price-reservation">
         <button type="button" name="reservation" onclick="sendOk();">
          예약하기
          </button>
      </div>
          
      </div>
    </div>
    <hr style="margin-bottom: 150px; margin-top: 150px;">
  </div>

<div id="wrap">
  
 <ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="true">상세정보</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane-3" type="button" role="tab" aria-controls="3" aria-selected="false">문의사항 <span class="title-qnaCount">(${dto.questionCount})</span></button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-4" data-bs-toggle="tab" data-bs-target="#tab-pane-4" type="button" role="tab" aria-controls="4" aria-selected="false">배송 및 환불정책</button>
				</li>
</ul>
  
  
  
  
  
  
  
  
  <div class="second-container">
    <div class="available-size">
      <div class="available-mini">
        <h5><i class="fa-solid fa-user-group"></i>&nbsp;탑승가능인원</h5>
        <p>${dto.carMaxNum} 인</p>
      </div>
      <br>
      <div class="available-mini">
        <h5><i class="fa-solid fa-campground"></i>&nbsp;취침가능인원</h5>
        <p>${dto.sleepNum} 인</p>
      </div>
      <div class="available-mini">
        <h5><i class="fa-solid fa-dog"></i>&nbsp;반려동물 동반</h5>
        <p>
        <c:if test="${dto.petOrNot == 1}">가능</c:if>
        <c:if test="${dto.petOrNot != 1}">불가능</c:if>
        </p>
      </div>
     </div>
     </div>
    <br>
    <hr style="margin-top: 30px; margin-bottom: 50px; border:none;">

    <div class="car-options">
      <h4 style="padding: 20px 90px;">보유 옵션</h4>
      <div class="option-detail">
      	<div>
        	<c:if test="${dto.toilet != null}">
          		<p>화장실</p>
          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/toilet.png" alt="toilet">
          	</c:if>
        </div>
        <div>
        	<c:if test="${dto.shower != null}">
          		<p>샤워실</p>
          		
          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/shower.png" alt="shower">
          	</c:if>
        </div>
        <div>
        	<c:if test="${dto.bed != null}">
          		<p>침대</p>
          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/bed.png" alt="bed">
          	</c:if>
        </div>
        <div>
        	<c:if test="${dto.sink != null}">
          		<p>싱크대</p>
          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/sink.png" alt="sink">
        	</c:if>
        </div>
        
        <div>
        	<c:if test="${dto.microwave != null}">
          		<p>전자레인지</p>
           		<img src="${pageContext.request.contextPath}/resources/images/campingcar/microwave.png" alt="microwave">
        	</c:if>
        </div>
        <div>
        	<c:if test="${dto.frige != null}">
          		<p>냉장고</p>
          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/refrigerator.png" alt="refrigerator">
        	</c:if>
        </div>
        <div>
        	<c:if test="${dto.desk != null}">
          		<p>테이블</p>
          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/table.png" alt="table">
        	</c:if>
        </div>
        <div>
        	<c:if test="${dto.waterHeater != null}">
          		<p>온수기</p>
          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/waterHeater.png" alt="waterHeater">
        	</c:if>
        </div>
        <div>
        	<c:if test="${dto.tv != null}">
          		<p>TV</p>
          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/tv.png" alt="tv">
        	</c:if>
        </div>
        <div>
        	<c:if test="${dto.airCondition != null}">
          		<p>에어컨</p>
          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/airconditioner.png" alt="airconditioner">
        	</c:if>
        </div>
        <div>
        	<c:if test="${dto.heater != null}">
          		<p>무시동히터</p>
          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/heater.png" alt="heater">
        	</c:if>
        </div>
        <div>
        	<c:if test="${dto.powerbank != null}">
          		<p>배터리</p>
          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/battery.png" alt="battery">
        	</c:if>
        </div>
        <div>
        	<c:if test="${dto.gasStove != null}">
          		<p>가스레인지</p>
          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/gasStove.png" alt="gasStove">
        	</c:if>
        </div>
      </div>
	<hr style="margin-top: 20px; margin-bottom: 50px; border:none;">
    </div>
</div>



 
 
<hr style="margin-top: 20px; margin-bottom: 40px; border:none;">
<div id="wrap">
	<div class="container">
  <div class="detail_as">
    <div class="as_table">
        <table>
            <colgroup>
                <col width="250">
                <col width="*">
            </colgroup>
            <tbody>
                <tr>
                    <th>캠핑카 업체</th>
                    <td>
                        <b>캠브릿지 한국지점</b>
                        <br>
                        주소 - 서울특별시 마포구 월드컵북로 21 풍성빌딩 2층
                    </td>
                </tr>
                <tr>
                    <th>운전자 대여조건</th>
                    <td>
                        <b>-&nbsp;운전자 나이 만26세 이상</b>
                        <br>
                        <br>
                        <b>-&nbsp;1종보통</b> 면허이상 필요(차량대여 시 실물면허증 소지)
                        <br>
                        -&nbsp;면허취득일 상관없음
                       
                    </td>
                </tr>
                <tr>
                    <th>자동차 보험</th>
                    <td>
                        -&nbsp;렌트카 공제 조합을 통해 대인, 대물, 자손 등의
                        <br>
                        종합보험에 가입되어 있으며, 자차보험은
                        <br>
                        별도로 비용을 지불하고 가입 가능합니다.
                    </td>
                </tr>
                <tr>
                    <th>유료딜리버리</th>
                    <td>
                      -&nbsp; 유료 딜리버리는 <b>1:1 문의</b>를 통해
                      <br>
                      개별적으로 진행 가능합니다.
                    </td>
                </tr>
                <tr>
                  <th>취소 규정</th>
                  <td>
                    -&nbsp; 출발일 기준 7일전 취소시 : 80% 환불 
                    <br>
                    -&nbsp; 출발일 기준 6일~4일전 취소시 : 50% 환불 
                    <br>
                    -&nbsp; 출발일 기준 3일~당일 취소시 : 환불 불가 
               
                  </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
    </div>
</div>

<a href="https://www.flaticon.com/kr/free-icons/" title="화장실 아이콘">화장실 아이콘  제작자: Creaticca Creative Agency - Flaticon</a>
<a href="https://www.flaticon.com/kr/free-icons/" title="화장실 아이콘">화장실 아이콘  제작자: Freepik - Flaticon</a>
<a href="https://www.flaticon.com/kr/free-icons/" title="침실 아이콘">침실 아이콘  제작자: Freepik - Flaticon</a>
<a href="https://www.flaticon.com/kr/free-icons/" title="싱크대 아이콘">싱크대 아이콘  제작자: Eucalyp - Flaticon</a>
<a href="https://www.flaticon.com/kr/free-icons/" title="마이크로파 아이콘">마이크로파 아이콘  제작자: Dreamstale - Flaticon</a>
<a href="https://www.flaticon.com/kr/free-icons/" title="냉장고 아이콘">냉장고 아이콘  제작자: pojok d - Flaticon</a>
<a href="https://www.flaticon.com/kr/free-icons/" title="표 아이콘">표 아이콘  제작자: itim2101 - Flaticon</a>
<a href="https://www.flaticon.com/kr/free-icons/" title="온수기 아이콘">온수기 아이콘  제작자: manshagraphics - Flaticon</a>
<a href="https://www.flaticon.com/kr/free-icons/tu-tv" title="tu tv 아이콘">Tu tv 아이콘  제작자: Icon.verse - Flaticon</a>
<a href="https://www.flaticon.com/kr/free-icons/-" title="공기 조절 아이콘">공기 조절 아이콘  제작자: Freepik - Flaticon</a>
<a href="https://www.flaticon.com/kr/free-icons/" title="히터 아이콘">히터 아이콘  제작자: Linector - Flaticon</a>
<a href="https://www.flaticon.com/kr/free-icons/" title="배터리 아이콘">배터리 아이콘  제작자: kmg design - Flaticon</a>

<script>
$(document).ready(function(){
	  
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');

	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');

	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  })

	})

const controllerURL = '/plus/car/qna/list';	
$.ajax({
   url: controllerURL,
   method: 'GET',
   success: function(data) {
      // 성공적으로 데이터를 가져온 경우, 해당 div에 내용을 삽입
      $('#carqna-page').html(data);
   },
   error: function() {
      // 에러 처리 로직 추가
      console.error('Failed to load the controller content.');
   }
});	
</script>

<script>
    // 주중 및 주말 요금 설정
    const weekdayRate = ${dto.weekCost};
    const weekendRate = ${dto.wkndCost};
    const discountRate = ${dto.discountRate}; // 할인율 변수 추가

    function calculateFee(startDate, endDate) {
        const startDateTime = new Date(startDate).getTime();
        const endDateTime = new Date(endDate).getTime();
        const dayDifference = Math.ceil((endDateTime - startDateTime) / (1000 * 60 * 60 * 24));

        const dayOfWeekStart = new Date(startDate).getDay();
        const dayOfWeekEnd = new Date(endDate).getDay();

        let disTotalFee = 0;
        let totalFee = 0;

        for (let i = 0; i < dayDifference; i++) {
            const currentDayOfWeek = (dayOfWeekStart + i) % 7;

            // 주말(토요일 또는 일요일)인 경우 주말 요금, 그 외의 경우 주중 요금 적용
            let fee = (currentDayOfWeek === 0 || currentDayOfWeek === 6) ? weekendRate : weekdayRate;
            totalFee += parseInt(fee);
            
            
            
            // 할인율이 적용된 경우, 요금에 할인율을 적용
            if (discountRate > 0) {
                const discountAmount = fee * (discountRate / 100);
                fee -= discountAmount;
            }

            disTotalFee += fee;
        }
        $('#inputTotalFee').val(totalFee);
        
        return disTotalFee;
    }

    document.forms["datepickForm"]["end_date"].addEventListener("change", function() {
        const startDate = document.forms["datepickForm"]["start_date"].value;
        const endDate = document.forms["datepickForm"]["end_date"].value;

        // 값이 입력되었을 때만 계산 수행
        if (startDate && endDate) {
            const fee = calculateFee(startDate, endDate);
            
            // totMoney 값을 URL에 추가하여 페이지를 다시 로드
            // window.location.href = "page2.html?totMoney=" + fee;

            // 계산된 fee를 hidden input에 할당
            document.getElementById("inputDisTotalFee").value = fee;

            // 페이지에 결과를 출력
            document.getElementById("totalFee").innerHTML = "선택한 기간의 요금: " + fee.toLocaleString() + "원";

            // AJAX를 사용하여 서버에 fee 값을 전송
            $.ajax({
                url: '/plus/car/reservation/orderPage',
                method: 'POST',
                data: { totMoney: fee },
                success: function(response) {
                    // 성공적으로 처리된 경우, 필요한 로직 수행
                    console.log(response);
                },
                error: function(error) {
                    // 에러 처리 로직 추가
                    console.error('Failed to send fee to the server.');
                }
            });
        }
    });
</script>


<script type="text/javascript">
 function sendOk() {
		// 구매하기
		const f = document.datepickForm;
		
		//const day = document.querySelector("#input_date").value;
		/*
		let cnt = $("form input[name=nums]:checked").length;
	    if (cnt === 0) {
			alert("구매할 상품을 먼저 선택 하세요 !!!");
			return;
	    }
	    
	    $("form input[name=nums]").each(function(index, item){
			if(! $(this).is(":checked")) {
				$(this).closest("tr").remove();
			}
		});
	    */
	    
	    
	    /*
	    let start_date = f.start_date.value;
	    let end_date = "${carReservation.end_date}";
	    */
	    // f.method = "get";
		f.action = "${pageContext.request.contextPath}/car/reservation/orderPage";
		f.submit();
	}
</script>
