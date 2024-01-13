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
  text-align: center;
}


.body-main {
	max-width: 700px;
}

.main{
  width: 1080px; 
  height: 120px;
  margin: 0 auto; 
  display: flex;
  justify-content: space-between;
}

.main .name1 {
  font-size: 30px;
  font-weight: bold;
}

.main div {
  margin: 0 20px;
  text-align:center;
}

.accordion {
  width: 1080px;
  margin: 0 auto;

}

button[type=button] {
  height: 80px;
}


.accordion-body {
  height: 80px;
  line-height: 100%;
  
}


</style>

<div class="main">
<div>
	<p class="name1" style="line-height:80px; float:right;"><i class="fa-regular fa-comment-dots"></i> 자주묻는질문 </p>
</div>
</div>	

<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        점검/정비는 어떻게 진행되나요?
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        차량 출고 전 자체적으로 점검 진행합니다.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        방문이 불가한 지역/장소가 있나요?
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        방문 불가능 지역 : 도서산간 및 오지, 정비를 위한 공간 확보가 어려운 곳 (대로변, 일부 지하주차장 등)
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        예약일정을 변경하고 싶어요
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        예약 취소 후 재 예약 부탁드립니다. <br>
        희망 변경일자에 예약이 찬 경우에는 이용하실 수 없습니다.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
        결제카드, 결제일을 변경하고 싶어요.
      </button>
    </h2>
    <div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        결제 취소 후 재 결제 부탁드립니다.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
        차종에 대한 질문은 어디에 하면 되나요?
      </button>
    </h2>
    <div id="collapseFive" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        차에 관한 내용은 상품상세 화면에 자세히 안내되어 있습니다.<br>
        상품 문의 또는 1:1 고객센터를 이용해 주세요.
      </div>
    </div>
  </div>
</div>
 