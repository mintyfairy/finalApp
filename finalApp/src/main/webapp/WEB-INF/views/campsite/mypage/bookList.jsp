<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 850px;
}

.nav-tabs .nav-link {
	min-width: 170px;
	background: #f3f5f7;
	border-radius: 0;
	border-right: 1px solid #dbdddf;
	color: #333;
	font-weight: 600;
}
.nav-tabs .nav-link.active {
	background: #3d3d4f;
	color: #fff;
}
 .active, .dot:hover {
  background-color: white;
}
.tab-pane { min-height: 300px; }

.md-img { width: 100px; height: 100px; object-fit: cover; }

.payment-dropdown, .payment-delete { cursor: pointer; }
.payment-dropdown:hover, .payment-delete:hover { color: #0d6efd; }

.payment-menu {
	display: none; position: absolute; width: 100px; min-height: 65px; background:#fff; border: 1px solid #d5d5d5; border-radius: 3px; z-index: 9999;
}
.payment-menu-item { text-align: center; cursor: pointer; padding: 7px; }
.payment-menu-item:nth-child(1) { border-bottom: 1px solid #d5d5d5; }
.payment-menu-item:hover { color: #0d6efd; font-weight: 500; }

.review-form textarea { width: 100%; height: 75px; resize: none; }
.review-form .star { font-size: 0; letter-spacing: -4px; }
.review-form .star a {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	 color: #ccc; text-decoration: none;
}
.review-form .star a:first-child { margin-left: 0; }
.star a.on { color: #FFBB00; }

.review-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.review-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
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

// 예약상세, 예약취소, 반품, 교환 메뉴
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
		// 예약 내역 삭제 - 예약자화면에 보이지 않게 설정(userDelete 컬럼을 1로 설정)
		if(! confirm("예약내역을 삭제하시겠습니까 ?")) {
			return false;
		}		
		
		let orderDetailNum = $(this).attr("data-orderDetailNum");

		let qs = "orderDetailNum=" + orderDetailNum + "&page=${page}";
		location.href = "${pageContext.request.contextPath}/myPage/updateOrderHistory?" + qs;
	});
});

$(function(){
	$(".payment-confirmation").click(function(){
		// 구매 확정
		if(! confirm("구메확정을 진행하시겠습니까 ?")) {
			return false;
		}
		
		let orderDetailNum = $(this).attr("data-orderDetailNum");
		let url = "${pageContext.request.contextPath}/myPage/confirmation?orderDetailNum="+orderDetailNum+"&page=${page}";
		location.href = url;
	});
});

$(function(){
	$(".order-details").click(function(){
		// 예약 상세 정보
		let orderDetailNum = $(this).attr("data-orderDetailNum");
		alert(orderDetailNum);
	});
});

$(function(){
	$(".order-cancel").click(function(){
		// 구매(예약) 취소
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
		// 예약취소/교환요청/반품요청 완료
		const f = document.userOrderDetailForm;

		if(! f.stateMemo.value.trim()) {
			alert('요청 사유를 입력 하세세요');
			f.stateMemo.focus();
			return false;
		}
		
		f.action = '${pageContext.request.contextPath}/myPage/orderDetailUpdate';
		f.submit();
	});
});
</script>

<div class="container">
	<div class="body-container">	

		<div class="tab-content pt-2" id="myTabContent">
			<div class="tab-pane fade show active" id="tab-pane-1" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
				<div class="mt-3 pt-3 border-bottom">
					<p class="fs-4 fw-semibold">예약 내역</p> 
				</div>
				<div class="mt-3">

					<c:forEach var="dto" items="${list}">
						<div class="mt-3 p-2 border-bottom payment-list">
							<div class="row pb-2">
								<div class="col-6">
								</div>
								<div class="col-6 text-end">
									<label class='payment-delete' title="예약내역삭제" data-orderDetailNum="${dto.bookNum}"><i class="bi bi-x-lg"></i></label>
								</div>
							</div>
							<div class="row">
								<div class="col-auto">
									<img class="border rounded md-img" src="${pageContext.request.contextPath}/uploads/room/${dto.filename}">
								</div>
								<div class="col">
									<div class="pt-1">
										<label class="text-black-50">${dto.order_date} 구매</label>
									</div>
									<div class="fw-semibold pt-2">${dto.detailName}</div>
									<div class="pt-1">
										기간 : ${dto.startDate} ~ ${dto.endDate}
									</div>
									<div class="pt-1">
										<label> 주문금액 : </label>
										<label class="fw-semibold ps-3"><fmt:formatNumber value="${dto.bookPrice}"/>원</label>
									</div>
								</div>
							</div>
							<div class="mt-3 p-3 text-end">
								
								<button type="button" class="btn border btnReviewWriteForm" style="width: 130px;"> 리뷰작성 </button>
								
															
								
							</div>
							
							<c:if test="${dto.writeReview == 0}">
								<!-- 리뷰쓰기 -->
								<div class="review-form border border-secondary p-3 mt-2" style="display: none;">
									<form name="reviewForm">
										<div class="p-1">
											<p class="star">
												<a href="#" class="on"><i class="bi bi-star-fill"></i></a>
												<a href="#" class="on"><i class="bi bi-star-fill"></i></a>
												<a href="#" class="on"><i class="bi bi-star-fill"></i></a>
												<a href="#" class="on"><i class="bi bi-star-fill"></i></a>
												<a href="#" class="on"><i class="bi bi-star-fill"></i></a>
												<input type="hidden" name="score" value="5">
												<input type="hidden" name="productNum" value="${dto.bookNum}">
											</p>
										</div>
										<div class="p-1">
											<textarea name="review" class="form-control"></textarea>
										</div>
										<div class="p-1">
											<div class="img-grid">
												<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
											</div>
											<input type="file" name="selectFile" accept="image/*" multiple class="form-control" style="display: none;">
										</div>
										<div class="p-1 text-end">
											<button type="button" class="btn btn-dark btnReviewSend ps-5 pe-5">등록하기</button>
										</div>
									</form>
								</div>
							</c:if>
							
						</div>
					</c:forEach>
					
					<div class="page-navigation">
						${dataCount == 0 ? "예약 내역이 없습니다." : paging }
					</div>

				</div>				
			</div>
		
		</div>

	</div>
</div>

<!-- 구매취소/교환요청/반품요청 대화상자  -->
<div class="modal fade" id="orderDetailUpdateDialogModal" tabindex="-1" aria-labelledby="orderDetailUpdateDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDetailUpdateDialogModalLabel">예약취소</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="p-1">
					<form name="userOrderDetailForm" method="post" class="row justify-content-center">
						<div class="col-7 p-1">
							<input type="text" name="stateMemo" class="form-control" placeholder="사유를 입력 하세요">
						</div>
						<div class="col-auto p-1">
							<input type="hidden" name="page" value="${page}">
							<input type="hidden" name="orderDetailNum">
							<input type="hidden" name="detailState">
							<button type="button" class="btn btn-light btnUserOrderDetailUpdateOk"> 요청하기 </button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
// 리뷰 쓰기 버튼
$(function(){
	$(".btnReviewWriteForm").click(function(){
		const $review = $(this).closest(".payment-list").find(".review-form");
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

// 이미지
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
		let $plist = $(this).closest(".payment-list");
		
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
