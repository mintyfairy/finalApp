<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 1000px;
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
.tab-pane { min-height: 300px; }

.score-star { font-size: 0; letter-spacing: -4px; }
.score-star .item {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	color: #ccc; text-decoration: none; vertical-align: middle;
}
.score-star .item:first-child{ margin-left: 0; }
.score-star .on { color: #00D8FF; }

.md-img img { width: 150px; height: 150px; cursor: pointer; object-fit: cover; }
.deleteReview, .deleteQuestion { cursor: pointer; padding-left: 5px; }
.deleteReview:hover, .deleteQuestion:hover { font-weight: 500; color: #2478FF; }
</style>



<div class="container">
	<div class="body-container">	
		<div class="body-main">

			<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link ${mode=='review'?'active':'' }" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="false"> 리뷰 </button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link ${mode=='qna'?'active':'' }" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="2" aria-selected="false"> 상품문의 </button>
				</li>
			</ul>
			
			<div class="tab-content pt-2" id="myTabContent">
				<div class="tab-pane fade ${mode=='review'?'active show':'' }" id="tab-pane-1" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
					<div class="mt-3 pt-3 border-bottom">
						<p class="fs-4 fw-semibold">상품 리뷰</p> 
					</div>
					
					<div class="mt-2 list-review"></div>
				</div>
				
				
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
// review -------------
function listReview(page) {
	let url = '${pageContext.request.contextPath}/review/list2';
	let query = 'pageNo='+page;
	
	const fn = function(data) {
		printReview(data);
	};
	ajaxFun(url, 'get', query, 'json', fn);	
}

function printReview(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	let size = data.size;
	let paging = data.paging;
	
	let out = '';
	for(let item of data.list) {
		let num = item.num;
		let userName = item.userName;
		let score = item.score;
		let review = item.review;
		let review_date = item.review_date;
		let answer = item.answer;
		let answer_date = item.answer_date;
		let listFilename = item.listFilename;
		
		let productName = item.productName;
		let optionValue = item.optionValue;
		let optionValue2 = item.optionValue2;
		
		out += '<div class="mt-3 border-bottom">';
		out += '  <div class="p-2 fw-semibold">';
		out +=        productName+'('+ optionValue+'/'+optionValue2+')';
		out += '  </div>';
		out += '  <div class="row p-2">';
		out += '    <div class="col-auto pt-0 ps-2 pe-1 score-star">';
		for(let i=1; i<=5; i++) {
			out += '  <span class="item fs-6 ' + (score>=i ? 'on' : '') + '"><i class="bi bi-star-fill"></i></span>';
		}
		out += '    </div>';
		out += '    <div class="col text-end"><span>'+review_date+'</span>';
		out += '       |<span class="deleteReview" data-num="'+num+'">삭제</span></div>';	
		out += '  </div>';
		out += '  <div class="mt-2 p-2">' + review + '</div>';

		if(listFilename && listFilename.length > 0) {
			out += '<div class="row gx-1 mt-2 mb-1 p-1">';
				for(let f of listFilename) {
					out += '<div class="col-md-auto md-img">';
					out += '  <img class="border rounded" src="${pageContext.request.contextPath}/uploads/review/'+f+'">';
					out += '</div>';
				}
			out += '</div>';
		}
		
		if(answer) {
			out += '  <div class="p-3 pt-0">';
			out += '    <div class="bg-light">';
			out += '      <div class="p-2 pb-0">';
			out += '        <label class="text-bg-primary px-2"> 관리자 </label> <label>' + answer_date + '</label>';
			out += '      </div>';
			out += '      <div class="p-2 pt-1">' + answer + '</div>';
			out += '    </div>';
			out += '  </div>';
		}
		out += '</div>';
	}
	if(dataCount > 0) {
		out += '<div class="page-navigation">' + paging + '</div>';
	}
	
	$('.list-review').html(out);	
}

$(function(){
	$('.list-review').on('click', '.deleteReview', function(){
		let num = $(this).attr('data-num');
		alert(num);
	});
});




</script>
