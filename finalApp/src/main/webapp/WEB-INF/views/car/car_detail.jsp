<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
@charset "utf-8";

* { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

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
  margin: 50px 100px auto;

}

#wrap2 {
  
  width: 1080px;
  box-sizing: border-box;
  margin: 50px 100px auto;
  padding-left: 90px;
}

.first-container {
  height: 600px;
  padding: 25px;
  display: flex;
  justify-content: space-between;
}

.thumbnail-addImages {
  box-sizing: border-box;
  border: none;
  padding-left: 80px;
  
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
  height: 550px; 
  padding-left: 70px;
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
  
  
}

.calendar > form {
  display: flex;
  width: 100%;
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

.calendar > p {
  font-size: 50px;
  margin-top: 10px;
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
  margin-top: 15px;
  width: 400px;
  height: 80px;
  box-sizing: border-box;
  border: none;
}
.price {
  font-size: 20px;
  font-weight: 700;
  box-sizing: border-box;
  border: none;
  text-align: center;
  margin-top: 10px;
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
}

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
    padding-top: 110px;
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

/*탭*/

ol,
ul {
    list-style: none;
}

.container-detail {
    padding-top: 110px;
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

.container-detail{
	width: 1080px;
	margin: 0 auto;
}
</style>

<script type="text/javascript">
 function sendOk() {
		// 구매하기
		const f = document.datepickForm;
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
		
		f.action = "${pageContext.request.contextPath}/car/orderPage";
		f.submit();
	}
 


</script>


<div id="wrap">

  <div class="first-container">
    <div class="thumbnail-addImages">
      <div class="thumbnail">
        <img src="${pageContext.request.contextPath}/resources/images/campingcar/campingcar.jpg"/>
      </div>
      <div class="addImages">
        <img src="${pageContext.request.contextPath}/resources/images/campingcar/bed.png" alt="bed">
        <img src="${pageContext.request.contextPath}/resources/images/campingcar/bed.png" alt="bed">
      </div>
    </div>
    <div class="car-detail">
      <div class="carName-liked">
        <p style="font-size: 25px; font-weight: 600;">
          ${dto.carName}
        </p>
        <i class="fa-regular fa-heart"></i>
      </div>
     
    <div style="text-align: center; margin-top: 5px;">
    	<p>${dto.description}</p>
    </div>
      
      <div class="calendar">
        <form name="datepickForm" method="post">
          <div class="start-date">
          
            <p style="font-size: medium; font-weight: bold; margin-left: 65px;">대여일</p>
            <input id="date" type="date" name="start">
          </div>
          <p style="margin-top: 40px; font-size: large; font-weight: 600;"> | </p>
          <div class="end-date">
            <p style="font-size: medium; font-weight: bold; margin-left: 65px;">반납일</p>
            <input id="date" type="date" name="end">
            <input type="hidden" name="carNum" value="${dto.carNum}">
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
          
          <span>주중 : ${dto.weekCost}</span>
          <span>&nbsp;&nbsp;</span>
          <span>주말 : ${dto.wkndCost}</span>
          </div>
          </div>
          <button type="button" name="reservation" onclick="sendOk();">
          예약하기
          </button>
          
      </div>
   
    </div>
  </div>

<div id="wrap2">
  <div class="second-container">
    <div class="available-size">
      <div style="text-align: center;">
        <h3 style="padding: 15px;">탑승가능인원</h3>
        <p style="font-size: 18px;">${dto.carMaxNum}</p>
      </div>
      <br>
      <div style="text-align: center;">
        <h3 style="padding: 15px;">취침가능인원</h3>
        <p style="font-size: 18px;">${dto.sleepNum}</p>
      </div>
      <div style="text-align: center;">
        <h3 style="padding: 15px;">반려동물동반가능여부</h3>
        
        <p style="font-size: 18px;"><c:if test="${dto.petOrNot == 1 ? '가능':'불가능'}" /></p>
      </div>
     </div>
     </div>
    <br>
    <hr style="margin-top: 20px; margin-bottom: 20px;">

    <div class="car-options">
      <h2 style="padding-left: 30px;">보유 옵션</h2>
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
    </div>
</div>

    <div class="container-detail">
      <div class="detail_wrap">
          <div class="detail_tab">
              <ul class="tab_list">
                  <li class="tab_item"><a href="#">상세정보</a></li>
                  <li class="tab_item"><a href="#">상품후기0</a></li>
                  <li class="tab_item"><a href="#">상품문의0</a></li>
                  <li class="tab_item"><a href="#">배송/교환/반품/AS</a></li>
              </ul>
          </div>
          <div class="detail_img">
              <img src="https://via.placeholder.com/538x540" alt="detail_img">
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
                      <tbody>
                          <tr>
                              <td colspan="6">등록된 리뷰가 없습니다.</td>
                          </tr>
                      </tbody>
                  </table>
              </div>
              <div class="qna_write">
                  <a href="#">글쓰기</a>
              </div>
          </div>
  </div>

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
                        <b>-&nbsp;2종보통</b> 면허이상 필요(차량대여 시 실물면허증 소지)
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
