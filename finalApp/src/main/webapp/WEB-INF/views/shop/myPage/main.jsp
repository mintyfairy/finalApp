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

ol, ul {
	list-style: none;
}

.container {
	margin-bottom: 60px;
	padding-top: 50px;
}

.container .wrap {
	width: 1080px;
	margin: 20px auto;
}

.container .wrap .title {
	text-align: center;
	margin-bottom: 40px;
}

.container .wrap .customer_wrap {
	height: 180px;
	margin-bottom: 70px;
	padding: 20px 0;
	border: 1px solid black;
}

.customer_list {
	display: flex;
	height: 100%;
}

.customer_list .customer_item {
	flex-basis: 33.33%;
	height: 100%;
	padding: 20px 13px 20px 0;
	border-right: 1px solid #dedede;
}

.customer_list .customer_item:last-child {
	border: none;
}

.customer_list .customer_item h6 {
	margin-bottom: 20px;
	padding-left: 36px;
	font-weight: 600;
}

.detail_list {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-items: center;
}

.detail_list .detail_item a {
	position: relative;
	text-decoration: none;
	color: #8a8a8a;
	display: block;
	font-size: 12px;
	padding: 7px;
}

.detail_list .detail_item a::after {
	position: absolute;
	top: 10px;
	right: -2px;
	content: '';
	display: block;
	width: 2px;
	height: 11px;
	background-color: #8a8a8a;
}

.my_info {
	height: 212px;
	margin-bottom: 120px;
	padding: 20px 0;
	border: 1px solid #dedede;
}

.my_info .my_list {
	height: 100%;
	display: flex;
	flex-wrap: nowrap;
}

.my_info .my_list .my_item {
	height: 100%;
}

#identity {
	width: 732px;
	border-right: 1px dashed #dedede;
}

#my_value {
	width: 30%;
}

#my_wrap {
	height: 100%;
	display: flex;
	padding-left: 0;
}

#my_photo {
	width: 168px;
	height: 100%;
}

#personal {
	width: 561px;
	height: 100%;
	padding-left: 10px;
}

#my_value {
	width: 314px;
}

#personal .name {
	font-size: 14px;
	margin-bottom: 6px;
}

#personal .name .modify {
	display: inline-block;
	border: 1px solid black;
	text-decoration: none;
	color: #333;
	font-size: 12px;
	padding: 2px 8px;
	text-align: center;
}

#personal p {
	font-size: 14px;
}

#my_value {
	padding: 20px;
}

#my_value p:first-child {
	font-weight: 600;
}

.latest {
	position: relative;
}

.latest h5 {
	font-weight: 600;
}

.latest a {
	position: absolute;
	top: 0;
	right: 0;
	text-decoration: none;
	color: #9a9a9a;
	font-size: 14px;
}

.my_table {
	margin-bottom: 50px;
}

.latest_order table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	table-layout: fixed;
	word-wrap: break-word;
	word-break: keep-all;
	font-size: 12px;
	text-align: center;
}

.latest_board table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	table-layout: fixed;
	word-wrap: break-word;
	word-break: keep-all;
	font-size: 12px;
	text-align: center;
}

.interested table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	table-layout: fixed;
	word-wrap: break-word;
	word-break: keep-all;
	font-size: 12px;
	text-align: center;
}

.review_wrap {
	position: relative;
}

.payment-delete {
	position: absolute;
	top: 0;
	right: -15px;
}

.payment-menu {
	display: none;
	position: absolute;
	width: 100px;
	min-height: 65px;
	background: #fff;
	border: 1px solid #d5d5d5;
	border-radius: 3px;
	z-index: 9999;
}

.payment-menu-item {
	text-align: center;
	cursor: pointer;
	padding: 7px;
}

.payment-menu-item:nth-child(1) {
	border-bottom: 1px solid #d5d5d5;
}

.payment-menu-item:hover {
	color: #0d6efd;
	font-weight: 500;
}

.review-form textarea {
	width: 100%;
	height: 75px;
	resize: none;
}

.review-form .star {
	font-size: 0;
	letter-spacing: -4px;
}

.review-form .star a {
	font-size: 22px;
	letter-spacing: 1px;
	display: inline-block;
	color: #ccc;
	text-decoration: none;
}

.review-form .star a:first-child {
	margin-left: 0;
}

.star a.on {
	color: #FFBB00;
}
.star a.on > i {
	color: #FFBB00;
}

.review-form .img-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.review-form .img-grid .item {
	object-fit: cover;
	width: 50px;
	height: 50px;
	border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
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
			dataType:dataType,
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

// 주문상세, 주문취소, 반품, 교환 메뉴
$(function(){
	$("body").on("click", ".payment-dropdown", function(){
		const $menu = $(this).next(".payment-menu");
		if($menu.is(':visible')) {
			$menu.fadeOut(100);
		} else {
			$(".payment-menu").hide();
			$menu.fadeIn(100);

			let pos = $(this).offset();
			$menu.offset( {left:pos.left-70, top:pos.top+30} );
		}
	});
	$("body").on("click", function(evt) {
		if($(evt.target.parentNode).hasClass("payment-dropdown")) {
			return false;
		}
		$(".payment-menu").hide();
	});
});

$(function(){
	$(".payment-delete").click(function(){
		// 주문 내역 삭제 - 주문자화면에 보이지 않게 설정(userDelete 컬럼을 1로 설정)
		if(! confirm("주문내역을 삭제하시겠습니까 ?")) {
			return false;
		}		
		
		let orderDetailNum = $(this).attr("data-orderDetailNum");

		let qs = "orderDetailNum=" + orderDetailNum + "&page=${page}";
		location.href = "${pageContext.request.contextPath}/shop/myPage/updateOrderHistory?" + qs;
	});
});

$(function(){
	$(".payment-confirmation").click(function(){
		// 구매 확정
		if(! confirm("구메확정을 진행하시겠습니까 ?")) {
			return false;
		}
		
		let orderDetailNum = $(this).attr("data-orderDetailNum");
		let url = "${pageContext.request.contextPath}/shop/myPage/confirmation?orderDetailNum="+orderDetailNum+"&page=${page}";
		location.href = url;
	});
});

$(function(){
	$(".order-details").click(function(){
		// 주문 상세 정보
		let orderDetailNum = $(this).attr("data-orderDetailNum");
		alert(orderDetailNum);
	});
});

$(function(){
	$(".order-cancel").click(function(){
		// 구매(주문) 취소
		let orderDetailNum = $(this).attr("data-orderDetailNum");

		const f = document.userOrderDetailForm;
		f.orderDetailNum.value = orderDetailNum;
		f.detailState.value = 4;

		$("#orderDetailUpdateDialogModalLabel").html("구매취소");
		$("#orderDetailUpdateDialogModal").modal("show");
		
	});
});

$(function(){
	$(".return-request").click(function(){
		// 반품 요청
		let orderDetailNum = $(this).attr("data-orderDetailNum");
		
		const f = document.userOrderDetailForm;
		f.orderDetailNum.value = orderDetailNum;
		f.detailState.value = 10;
		
		$("#orderDetailUpdateDialogModalLabel").html("반품요청");
		$("#orderDetailUpdateDialogModal").modal("show");
	});
});

$(function(){
	$(".exchange-request").click(function(){
		// 교환 요청
		let orderDetailNum = $(this).attr("data-orderDetailNum");

		const f = document.userOrderDetailForm;
		f.orderDetailNum.value = orderDetailNum;
		f.detailState.value = 6;
		
		$("#orderDetailUpdateDialogModalLabel").html("교환요청");
		$("#orderDetailUpdateDialogModal").modal("show");
		
	});
});

$(function(){
	$('.btnUserOrderDetailUpdateOk').click(function(){
		// 주문취소/교환요청/반품요청 완료
		const f = document.userOrderDetailForm;

		if(! f.stateMemo.value.trim()) {
			alert('요청 사유를 입력 하세세요');
			f.stateMemo.focus();
			return false;
		}
		
		f.action = '${pageContext.request.contextPath}/shop/myPage/orderDetailUpdate';
		f.submit();
	});
});
</script>

<div class="container">
	<div class="wrap">
		<h2 class="title">MY PAGE</h2>
		<div class="customer_wrap">
			<ul class="customer_list">
				<li id="shopping_info" class="customer_item">
					<h6>
						<i class="bi bi-info-circle-fill"></i> SHOPPING INFO
					</h6>
					<ul class="detail_list">
						<li class="detail_item"><a href="#">주문내역</a></li>
						<li class="detail_item"><a href="#">쿠폰내역</a></li>
						<li class="detail_item"><a href="#">적립금내역</a></li>
						<li class="detail_item"><a href="#">예치금내역</a></li>
						<li class="detail_item"><a href="#">오늘본상품</a></li>
						<li class="detail_item"><a href="#">상품 보관함</a></li>
						<li class="detail_item"><a href="#">선물함</a></li>
					</ul>
				</li>
				<li id="shopping_question" class="customer_item">
					<h6>
						<i class="bi bi-question-circle-fill"></i> SHOPPING QUESTION
					</h6>
					<ul class="detail_list">
						<li class="detail_item"><a href="#">내 게시글 보기</a></li>
						<li class="detail_item"><a href="#">E-mail 문의</a></li>
						<li class="detail_item"><a href="#">1:1게시판</a></li>
					</ul>
				</li>
				<li id="customer_info" class="customer_item">
					<h6>
						<i class="bi bi-emoji-smile-fill"></i> CUSTOMER INFO
					</h6>
					<ul class="detail_list">
						<li class="detail_item"><a href="#">회원정보변경</a></li>
						<li class="detail_item"><a href="#">회원정보탈퇴신청</a></li>
					</ul>
				</li>
			</ul>
		</div>

		<div class="my_info">
			<ul class="my_list">
				<li id="identity" class="my_item">
					<ul id="my_wrap">
						<li id="my_photo"><svg xmlns="http://www.w3.org/2000/svg"
								width="120" height="120" fill="currentColor"
								class="bi bi-info-square" viewBox="0 0 16 16">
						<path
									d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />	
						<path
									d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />			
                        </svg></li>
						<li id="personal">
							<p class="name">
								이름[아이디]님 <a href="#" class="modify">수정</a>
							</p>
							<p>전화</p>
							<p>이메일&nbsp;&nbsp;&nbsp;&nbsp;</p>
							<p>주소</p>
						</li>
					</ul>
				</li>
				<li id="my_value" class="my_item">
					<p>총 주문금액 : &nbsp;&nbsp;&nbsp;${dto.total_price}</p>
					<p>적립금 :
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
				</li>
			</ul>
		</div>

		<div class="latest" id="myTabContent">
			<div class="tab-pane fade show active" id="tab-pane-1"
				role="tabpanel" aria-labelledby="tab-1" tabindex="0">
				<div class="mt-3 pt-3 border-bottom">
					<h5>최근 주문 정보</h5>
					<a href="#">+ MORE</a>
				</div>
			</div>
		</div>

		<div class="latest_order my_table">
			<c:forEach var="dto" items="${list}">
				<div class="review_wrap">
					<table summary="주문일자, 상품명, 결제금액, 주문상세">
						<colgroup>
							<col width="150">
							<col width="*">
							<col width="140">
							<col width="140">
						</colgroup>
						<thead style="border-top: 1px solid black;">
							<tr height="50">
								<th>DATE</th>
								<th>PRODUCT</th>
								<th>COST</th>
								<th>DETAIL</th>
							</tr>
							<tr height="50">
								<th>${dto.orderDate}</th>
								<th>${dto.productName}</th>
								<th>${dto.payment}</th>
								<th>${dto.optionValue}/${dto.optionValue2}</th>
							</tr>
						</thead>
					</table>


					<div class="col-6 text-end">
						<label class='payment-delete' title="주문내역삭제"
							data-orderDetailNum="${dto.orderDetailNum}"><i
							class="bi bi-x-lg"></i></label>
					</div>
					<div class="mt-3 p-3 text-end">
						<c:if
							test="${dto.reviewWrite==0 && (dto.detailState==1 || dto.detailState==2)}">
							<button type="button" class="btn border btnReviewWriteForm"
								style="width: 130px;">리뷰쓰기</button>
						</c:if>
						<button type="button" class="btn border" style="width: 130px;"
							data-orderDetailNum="${dto.orderDetailNum}">배송조회</button>
						<c:if test="${dto.detailState==0}">
							<button type="button" class="btn border payment-confirmation"
								style="width: 130px;"
								data-orderDetailNum="${dto.orderDetailNum}">구매확정</button>
						</c:if>
						<button type="button" class="btn border" style="width: 130px;"
							onclick="location.href='${pageContext.request.contextPath}/shop/product/${dto.productNum}';">
							재구매</button>

						<button type="button" class="btn border payment-dropdown"
							title="주문상세">
							<i class="bi bi-three-dots"></i>
						</button>
						<div class="payment-menu">
							<div class="payment-menu-item order-details"
								data-orderDetailNum="${dto.orderDetailNum}">주문상세</div>
							<c:if test="${dto.detailState==0 && dto.orderState==1}">
								<div class="payment-menu-item order-cancel"
									data-orderDetailNum="${dto.orderDetailNum}">구매취소</div>
							</c:if>
							<c:if
								test="${dto.detailState==0 && dto.orderState==5 && dto.afterDelivery < 3}">
								<div class="payment-menu-item return-request"
									data-orderDetailNum="${dto.orderDetailNum}">반품요청</div>
								<div class="payment-menu-item exchange-request"
									data-orderDetailNum="${dto.orderDetailNum}">교환요청</div>
							</c:if>
							<div class="payment-menu-item"
								data-orderDetailNum="${dto.orderDetailNum}">1:1 문의</div>
						</div>
					</div>

					<c:if test="${dto.reviewWrite == 0}">
						<!-- 리뷰쓰기 -->
						<div class="review-form border border-secondary p-3 mt-2" style="display: none;">
							<form name="reviewForm">
								<div class="p-1">
									<p class="star">
										<a href="#" class="on"><i class="bi bi-star-fill"></i></a> <a
											href="#" class="on"><i class="bi bi-star-fill"></i></a> <a
											href="#" class="on"><i class="bi bi-star-fill"></i></a> <a
											href="#" class="on"><i class="bi bi-star-fill"></i></a> <a
											href="#" class="on"><i class="bi bi-star-fill"></i></a> <input
											type="hidden" name="score" value="5"> <input
											type="hidden" name="productNum" value="${dto.productNum}">
									</p>
								</div>
								<div class="p-1">
									<textarea name="review" class="form-control"></textarea>
								</div>
								<div class="p-1">
									<div class="img-grid">
										<img class="item img-add"
											src="${pageContext.request.contextPath}/resources/images/add_photo.png">
									</div>
									<input type="file" name="selectFile" accept="image/*" multiple
										class="form-control" style="display: none;">
								</div>
								<div class="p-1 text-end">
									<input type="hidden" name="num" value="${dto.orderDetailNum}">
									<button type="button"
										class="btn btn-dark btnReviewSend ps-5 pe-5">등록하기</button>
								</div>
							</form>
						</div>
					</c:if>
				</div>
			</c:forEach>

			<div class="page-navigation">${dataCount == 0 ? "주문 내역이 없습니다." : paging }
			</div>

		</div>
	</div>
</div>

<script>
//리뷰 쓰기 버튼
$(function(){
	$(".btnReviewWriteForm").click(function(){
		const $review = $(this).closest(".review_wrap").find(".review-form");
		if($review.is(':visible')) {
			$review.fadeOut(100);
		} else {
			$review.fadeIn(100);
		}
	});
});

// 별
$(function(){
	$(".review-form .star a").click(function(e){
		let b = $(this).hasClass("on");
		$(this).parent().children("a").removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
		
		if( b ) {
			$(this).removeClass("on");
		}
		
		let s = $(this).closest(".review-form").find(".star .on").length;
		$(this).closest(".review-form").find("input[name=score").val(s);

		// e.preventDefault(); // 화면 위로 이동 안되게
		return false;
	});
});

//이미지
$(function(){
	var sel_files = [];
	
	$("body").on("click", ".review-form .img-add", function(){
		$(this).closest(".review-form").find("input[name=selectFile]").trigger("click");
	});
	
	$("form[name=reviewForm] input[name=selectFile]").change(function(e){
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
	
	$("body").on("click", ".review-form .img-item", function(){
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
});


$(function(){
	// 리뷰 등록 완료
	$(".btnReviewSend").click(function(){
		let $plist = $(this).closest(".review_wrap").find(".review-form");
		
		const f = this.closest("form");
		let s;
		
		if(f.score.value === "0") {
			alert("평점은 1점부터 가능합니다.")	;
			return false;
		}
		
		s = f.review.value.trim();
		if( ! s ) {
			alert("리뷰를 입력하세요.")	;
			f.review.focus();
			return false;
		}
		
		if(f.selectFile.files.length > 5) {
			alert("이미지는 최대 5개까지 가능합니다..")	;
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/review/write";
		// FormData : form 필드와 그 값을 나타내는 일련의 key/value 쌍을 쉽게 생성하는 방법을 제공 
		// FormData는 Content-Type을 명시하지 않으면 multipart/form-data로 전송
		let query = new FormData(f); 
		
		const fn = function(data) {
			if(data.state === "true") {
				$plist.find(".btnReviewWriteForm").remove();
				$plist.find(".review-form").remove();
			}
		};
		
		ajaxFun(url, "post", query, "json", fn, true);
	});
});
</script>