<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
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
  justify-content: center;
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
  margin-top: 100px;
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
    justify-content: space-between;
}

.tab_list .tab_item {
    width: 25%;
    text-align: center;
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
			dataType: dataType,
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
        <img src="${pageContext.request.contextPath}/uploads/caravan/${dto.thumbnail}"/>
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
      </div>
     
    <div style="text-align: left; margin-top: 5px; margin-left:5px;">
    	<p># ${dto.description}</p>
    </div>
      
      <div class="calendar">
        <form name="datepickForm" method="post">
          <div class="start-date">
          
            <p style="font-size: medium; font-weight: bold; margin-left: 65px;">대여일</p>
            <input id="start_date" type="date" name="start_date" style="font-size:16px;, font-weight: 450;">
          </div>
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

<div>
		<div class="detail_wrap">
			<div id="tabs1" class="detail_tab detail_tab1">
				<ul class="tab_list">
					<li class="tab_item" onclick="detail();"><span>상세정보</span></li>
					<li class="tab_item" onclick="question();"><span>상품문의 [1개]</span></li>
					<li class="tab_item" onclick="as();"><span>규정 및 주의사항</span></li>
				</ul>
			</div>
			
			<div>
			
			</div>
			
			
			
			
			
			
			
			
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
				
				<div class="detail_img">
					${dto.content}
				</div>
				
			    <div class="car-options">
			      <h4 style="padding: 20px 90px;">보유 옵션</h4>
			      <div class="option-detail">
			      	<div>
			        	<c:if test="${dto.toilet != 0}">
			          		<p>화장실</p>
			          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/toilet.png" alt="toilet">
			          	</c:if>
			        </div>
			        <div>
			        	<c:if test="${dto.shower == 1}">
			          		<p>샤워실</p>
			          		
			          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/shower.png" alt="shower">
			          	</c:if>
			        </div>
			        <div>
			        	<c:if test="${dto.bed != 0}">
			          		<p>침대</p>
			          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/bed.png" alt="bed">
			          	</c:if>
			        </div>
			        <div>
			        	<c:if test="${dto.sink == 1}">
			          		<p>싱크대</p>
			          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/sink.png" alt="sink">
			        	</c:if>
			        </div>
			        
			        <div>
			        	<c:if test="${dto.microwave == 1}">
			          		<p>전자레인지</p>
			           		<img src="${pageContext.request.contextPath}/resources/images/campingcar/microwave.png" alt="microwave">
			        	</c:if>
			        </div>
			        <div>
			        	<c:if test="${dto.frige == 1}">
			          		<p>냉장고</p>
			          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/refrigerator.png" alt="refrigerator">
			        	</c:if>
			        </div>
			        <div>
			        	<c:if test="${dto.desk == 1}">
			          		<p>테이블</p>
			          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/table.png" alt="table">
			        	</c:if>
			        </div>
			        <div>
			        	<c:if test="${dto.waterHeater == 1}">
			          		<p>온수기</p>
			          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/waterHeater.png" alt="waterHeater">
			        	</c:if>
			        </div>
			        <div>
			        	<c:if test="${dto.tv == 1}">
			          		<p>TV</p>
			          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/tv.png" alt="tv">
			        	</c:if>
			        </div>
			        <div>
			        	<c:if test="${dto.airCondition == 1}">
			          		<p>에어컨</p>
			          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/airconditioner.png" alt="airconditioner">
			        	</c:if>
			        </div>
			        <div>
			        	<c:if test="${dto.heater == 1}">
			          		<p>무시동히터</p>
			          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/heater.png" alt="heater">
			        	</c:if>
			        </div>
			        <div>
			        	<c:if test="${dto.powerbank == 1}">
			          		<p>배터리</p>
			          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/battery.png" alt="battery">
			        	</c:if>
			        </div>
			        <div>
			        	<c:if test="${dto.gasStove == 1}">
			          		<p>가스레인지</p>
			          		<img src="${pageContext.request.contextPath}/resources/images/campingcar/gasStove.png" alt="gasStove">
			        	</c:if>
			        </div>
			      </div>
				<hr style="margin-top: 20px; margin-bottom: 50px; border:none;">
			    </div>
			    
			<div class="detail_tab detail_tab2">
				<ul class="tab_list">
					<li class="tab_item" onclick="detail();"><span>상세정보</span></li>
					<li class="tab_item" onclick="question();"><span>상품문의 [1개]</span></li>
					<li class="tab_item" onclick="as();"><span>규정 및 주의사항</span></li>
				</ul>
			</div>
			
			<div class="detail_qna">
				<div class="qna_table">
					<table summary="번호, 평점, 내용, 작성자, 작성일, 조회">
						<colgroup>
							<col width="40">
							<col width="40">
							<col width="*">
							<col width="95">
							<col width="110">
							<col width="40">
						</colgroup>
					</table>
				</div>
				<div class="review_write mt-3 p-2 text-end">
					<button type="button" class="btnMyQuestion btn btn-dark"> 내 Q&amp;A 보기  </button>
					<button type="button" class="btnQuestion btn btn-dark"> 캠핑카 Q&amp;A 작성 </button>
				</div>
				<div class="mt-1 p-2 list-question">
				</div>
				
			</div>
			
			<div class="detail_tab detail_tab3">
				<ul class="tab_list">
					<li class="tab_item" onclick="detail();"><span>상세정보</span></li>
					<li class="tab_item" onclick="question();"><span>상품문의 [1개]</span></li>
					<li class="tab_item" onclick="as();"><span>규정 및 주의사항</span></li>
				</ul>
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


<div class="modal hidden" id="questionDialogModal" tabindex="-1" 
	data-bs-backdrop="static" data-bs-keyboard="false"
	aria-labelledby="questionDialogModalLabel" aria-hidden="true">
	
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="questionDialogModalLabel">캠핑카 문의 하기</h5>
				<button type="button" class="btn-close closeModal" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="qna-form p-2">
					<form name="questionForm" enctype="multipart/form-data">
						<div class="row">
							<div class="col">
								<span class="fw-bold">문의사항 쓰기</span><span> - 상품과 관련없는 글은 삭제 될 수 있습니다.</span>
							</div>
							<div class="col-3 text-end">
								<input type="checkbox" name="secret" id="secret1" class="form-check-input" 
									value="1">
								<label class="form-check-label" for="secret1">비공개</label>
								
							</div>
						</div>
						<div class="p-1">
							<input type="hidden" name="carNum" value="${dto.carNum}">
							<textarea name="question" id="question" class="form-control"></textarea>
						</div>
						<div class="p-1">
							<div class="img-grid">
								<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
							</div>
							<input type="file" name="selectFile" accept="image/*" multiple class="form-control" style="display: none;">
						</div>							
					</form>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btnQuestionSendOk">문의등록 <i class="bi bi-check2"></i> </button>
				<button type="button" class="btn btn-secondary btnQuestionSendCancel" data-bs-dismiss="modal">취소</button>
			</div>			
		</div>
	</div>
</div>







<script type="text/javascript">
	//변수명 변경
	let detail_height = document.querySelector(".detail_tab1").offsetTop;
	let question_height = document.querySelector(".detail_tab2").offsetTop;
	let as_height = document.querySelector(".detail_tab3").offsetTop;
	
	console.log(detail_height);
	console.log(question_height);
	console.log(as_height);
	
	// 함수명 변경
	function detail() {
	   window.scrollTo({top: detail_height, left: 0, behavior: 'smooth'});
	}
	
	function question() {
	   window.scrollTo({top: question_height, left: 0, behavior: 'smooth'});
	}
	
	function as() {
	   window.scrollTo({top: as_height, left: 0, behavior: 'smooth'});
	}
	
</script>

<!-- 문의  -->
<script type="text/javascript">

function listQuestion(page) {
	let carNum = '${dto.carNum}';
	let url = '${pageContext.request.contextPath}/car/qna/list';
	let query = 'carNum='+carNum+'&pageNo='+page;
	
	const fn = function(data) {
		printQuestion(data);
	};
	ajaxFun(url, 'get', query, 'json', fn);
}

function printQuestion(data) {
	console.log(data);
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	let size = data.size;
	let paging = data.paging;
	
	$('.title-qnaCount').html('(' + dataCount + ')');
	let out = '';
	for(let item of data.list) {
		let qnaNum = item.qnaNum;
		let userName = item.userName;
		let question = item.question;
		let question_date = item.question_date;
		let answer = item.answer;
		let answerDate = item.answer_date;
		let answerState = answer_date ? '<span class="text-primary">답변완료</span>' : '<span class="text-secondary">답변대기</span>';
		let listFilename = item.listFilename;
		let secret = item.secret;

		out += '<div class="mt-1 border-bottom">';
		out += '  <div class="mt-2 p-2">' + question + '</div>';
		
		if(listFilename && listFilename.length > 0) {
			out += '<div class="row gx-1 mt-2 mb-1 p-1">';
				for(let f of listFilename) {
					out += '<div class="col-md-auto md-img">';
					out += '  <img class="border rounded" src="${pageContext.request.contextPath}/uploads/carqna/'+f+'">';
					out += '</div>';
				}
			out += '</div>';
		}
		out += '  <div class="row p-2">';
		out += '     <div class="col-auto pt-2 pe-0">' + answerState + '</div>';
		out += '     <div class="col-auto pt-2 px-0">&nbsp;|&nbsp;'+userName+'</div>';
		out += '     <div class="col-auto pt-2 px-0">&nbsp;|&nbsp;<span>'+question_date+'</span>';
		if(secret === 0) {
			out += '       |<span class="notifyQuestion" data-qnaNum="' + qnaNum + '">신고</span>';
		}
		out += '      </div>';
		if(answer) {
			out += '  <div class="col pt-2 text-end"><button class="btn btnAnswerView"> <i class="bi bi-chevron-down"></i> </button></div>';
		}
		out += '  </div>';
		if(answer) {
			out += '  <div class="p-3 pt-0 answer-content" style="display: none;">';
			out += '    <div class="bg-light">';
			out += '      <div class="p-3 pb-0">';
			out += '        <label class="text-bg-primary px-2"> 관리자 </label> <label>' + answer_date + '</label>';
			out += '      </div>';
			out += '      <div class="p-3 pt-1">' + answer + '</div>';
			out += '    </div>';
			out += '  </div>';
		}
		out += '</div>';
	}
	
	if(dataCount > 0) {
		out += '<div class="page-navigation">' + paging + '</div>';
	}

	$('.list-question').html(out);
}

$(function(){
	$('.list-question').on('click', '.btnAnswerView', function(){
		const $btn = $(this);
		const $EL = $(this).closest('.row').next('.answer-content');
		if($EL.is(':visible')) {
			$btn.html(' <i class="bi bi-chevron-down"></i> ');
			$EL.hide(100);
		} else {
			$btn.html(' <i class="bi bi-chevron-up"></i> ');
			$EL.show(100);
		}
	});
});

$(function(){
	var sel_files = [];
	
	$("body").on("click", ".qna-form .img-add", function(){
		$(this).closest(".qna-form").find("input[name=selectFile]").trigger("click");
	});
	
	$("form[name=questionForm] input[name=selectFile]").change(function(e){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			
			this.files = dt.files;
			
			return false;
		}
		
		let $form = $(this).closest("form");
		
		// 유사 배열을  배열로 변환
		const fileArr = Array.from(this.files);
		
		fileArr.forEach((file, index) => {
			sel_files.push(file);
			
			const reader = new FileReader();
			const $img = $("<img>", {"class":"item img-item"});
			$img.attr("data-filename", file.name);
			reader.onload = e => {
				$img.attr("src", e.target.result);		
			};
			reader.readAsDataURL(file);
			$form.find(".img-grid").append($img);
		});
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		this.files = dt.files;
	});
	
	$("body").on("click", ".qna-form .img-item", function(){
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
		for(let i=0; i<sel_files.length; i++) {
			if(filename === sel_files[i].name) {
				sel_files.splice(i, 1);
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		const f = this.closest("form");
		f.selectFile.files = dt.files;
		
		$(this).remove();
	});
	
	$('.btnQuestion').click(function(){
		$("#questionDialogModal").show();
	});

	$('.btnQuestionSendOk').click(function(){
		const f = document.questionForm;
		let s;
		
		s = f.question.value.trim();
		if( ! s ) {
			alert("문의 사항을 입력하세요.")	;
			f.question.focus();
			return false;
		}
		
		if(f.selectFile.files.length > 2) {
			alert("이미지는 최대 2개까지 가능합니다..")	;
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/car/qna/write";
		let query = new FormData(f); 
		
		const fn = function(data) {
			if(data.state === "true") {
				f.reset();
				$(".qna-form .img-item").each(function(){
					$(this).remove();
				});
				sel_files.length = 0;
				
				$("#questionDialogModal").hide();
				
				listQuestion(1);
			}
		};
		
		ajaxFun(url, "post", query, "json", fn, true);		
	});
	
	$('.btnQuestionSendCancel').click(function(){
		const f = document.questionForm;
		f.reset();
		$(".qna-form .img-item").each(function(){
			$(this).remove();
		});
		sel_files.length = 0;
		
		$("#questionDialogModal").hide();
	});	
	
	$('.closeModal').click(function(){
		const f = document.questionForm;
		f.reset();
		$(".qna-form .img-item").each(function(){
			$(this).remove();
		});
		sel_files.length = 0;
		
		$("#questionDialogModal").hide();
	});	
	
	$('.btnMyQuestion').click(function(){
		location.href = '${pageContext.request.contextPath}/car/myPage/review?mode=qna';
	});
});


</script>




<script>
$(document).ready(function(){
	  
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');

	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');

	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  });

})

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
