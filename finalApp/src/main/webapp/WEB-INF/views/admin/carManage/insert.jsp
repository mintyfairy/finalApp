<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 강좌 질문과답변, selectBox 주의하여 보기  -->
<style type="text/css">
.body-main {
	max-width: 930px;
}

#tab-content{
	width: 100%;
}

table > tr> th {
	font-weight: 400;
}

.table-form tr>td { vertical-align: middle; }
.table-form tr:first-child { border-top: 2px solid #212529; }
.table-form tr>td:first-child { text-align: center; }
.table-form tr>td:nth-child(2) { padding-left: 10px; }
.table-form textarea { height: 170px; resize: none; }

.table-form .option-minus, .table-form .option-minus2 { cursor: pointer; }

.table-form .thumbnail-viewer {
	cursor: pointer;
	border: 1px solid #c2c2c2;
	width: 50px; height: 50px; border-radius: 10px;
	background-image: url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat: no-repeat;
	background-size: cover;
}

.table-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.table-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}

table > tr > td {
	font-size: 12px;
}

</style>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<script type="text/javascript">
$(function(){
	$("#tab-1").addClass("active");

	$("ul.tabs li").click(function() {
		let tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		let url = "${pageContext.request.contextPath}/admin/carManage/car";	
		location.href = url;
	});

});

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});


</script>

<div class="body-container">
	<div class="body-title">
		<h2><i class="fa-solid fa-caravan" style="font-size:23px;"></i>&nbsp;캠핑카관리 </h2>
	</div>
    
    <div class="body-main">
		<div>
			<ul class="tabs">
				<li id="tab-0" data-tab="0"><i class="fa-regular fa-note-sticky"></i>&nbsp;리스트</li>
				<li id="tab-1" data-tab="1"><i class="fa-regular fa-pen-to-square"></i>&nbsp;등록</li>
			</ul>
		</div>
		<div id="tab-content" style="padding: 20px 10px 0;">
			<form name="writeForm" method="post" enctype="multipart/form-data">
				<table class="table table-form">
					<tr>
						<td class="table-light col-sm-2">캠핑카 이름</td>
						<td><input type="text" name="carName" class="form-control" value=""></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">차량구분</td>
						<td>
							<select name="carSize" class="form-select">
								<option value="" ${dto.special==0?"selected":""}>:: 차량 종류 선택 ::</option>
								<option value="0" ${dto.special==0?"selected":""}>모터홈</option>
								<option value="1" ${dto.special==1?"selected":""}>차박형(중형)</option>
								<option value="2" ${dto.special==2?"selected":""}>차박형(소형)</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">주중가격</td>
						<td style="display:flex;">
						<input type="text" name="weekCost" class="form-control" value="" style="width:300px;"><span style="margin:5px;">&nbsp; 원</span>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">주말가격</td>
						<td style="display:flex;">
						<input type="text" name="wkndCost" class="form-control" value="" style="width:300px;"><span style="margin:5px;">&nbsp; 원</span>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">차량번호</td>
						<td><input type="text" name="caravanNum" class="form-control" value=""></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">차량연식</td>
						<td><input type="text" name="carBirth" class="form-control" value=""></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품 진열</td>
						<td>
							<div class="pt-2 pb-2">
								<input type="radio" name="productShow" class="form-check-input" id="productShow1" value="1" ${dto.productShow==1 ? "checked='checked'" : "" }> <label class="form-check-label" for="productShow1">상품진열</label>
								&nbsp;&nbsp;
								<input type="radio" name="productShow" class="form-check-input" id="productShow0" value="0" ${dto.productShow==0 ? "checked='checked'" : "" }> <label class="form-check-label" for="productShow0">진열안함</label>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품설명</td>
						<td>
							<textarea name="carDetail" id="ir1" class="form-control" style="max-width: 95%; height: 290px;">${dto.content}</textarea>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">대표이미지</td>
						<td>
							<div class="thumbnail-viewer"></div>
							<input type="file" name="thumbnailFile" accept="image/*" class="form-control" style="display: none;">
						</td>
					</tr>
					
					<tr>
						<td class="bg-light col-sm-2" scope="row">추가이미지</td>
						<td>
							<div class="img-grid"><img class="item img-add rounded" src="${pageContext.request.contextPath}/resources/images/add_photo.png"></div>
							<input type="file" name="selectFile" accept="image/*" multiple style="display: none;" class="form-control">	
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">할인율</td>
						<td><input type="text" name="discount-rate" class="form-control" value=""></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">탑승가능인원</td>
						<td><input type="text" name="carMaxNum" class="form-control" value=""></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">취침가능인원</td>
						<td><input type="text" name="sleepNum" class="form-control" value=""></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">반려동물</td>
						<td>
							<div class="pt-2 pb-2">
								<input type="radio" name="petOrNot" class="form-check-input" id="pet1" value="1" ${dto.productShow==1 ? "checked='checked'" : "" }> <label class="form-check-label" for="pet1">동반가능</label>
								&nbsp;&nbsp;
								<input type="radio" name="petOrNot" class="form-check-input" id="pet0" value="0" ${dto.productShow==0 ? "checked='checked'" : "" }> <label class="form-check-label" for="pet0">동반불가능</label>
							</div>
						</td>
					</tr>
				</table>
				
				<table class="table table-borderless">
					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">등록완료</button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/carManage/car';">등록취소</button>
						</td>
					</tr>
				</table>
				
				
				
			</form>
		</div> <!-- tab-content -->
		
	</div> <!-- body-main -->
</div> <!-- body-container -->

<script type="text/javascript">
// 대표(썸네일) 이미지 등록
$(function(){
	var img = "${dto.thumbnail}";
	if( img ) {
		img = "${pageContext.request.contextPath}/uploads/campingCar/thumbnail/"+img;
		$(".table-form .thumbnail-viewer").empty();
		$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
	}
	
	$(".table-form .thumbnail-viewer").click(function(){
		$("form[name=writeForm] input[name=thumbnailFile]").trigger("click");
	});
	
	$("form[name=writeForm] input[name=thumbnailFile]").change(function(){
		let file = this.files[0];
		
		if(! file) {
			$(".table-form .thumbnail-viewer").empty();
			
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/campingCar/thumbnail/"+img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) { // 파일의 내용을 다 읽었으면
			$(".table-form .thumbnail-viewer").empty();
			$(".table-form .thumbnail-viewer").css("background-image", "url("+e.target.result+")");
		};
		reader.readAsDataURL( file );
	});
});

// 추가이미지 등록
$(function(){
	var sel_files = [];
	
	$(".table-form").on("click", ".img-add", function(){
		$("form[name=writeForm] input[name=selectFile]").trigger("click");
	});
	
	$("form[name=writeForm] input[name=selectFile]").change(function(){
		if (! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.writeForm.selectFile.files = dt.files;
			
	    	return false;	
		}
		 for(let file of this.files) {
	        	sel_files.push(file);
	        	
	            const reader = new FileReader();
				const $img = $("<img>", {class:"item img-item"});
				$img.attr("data-filename", file.name);
	            reader.onload = e => {
	            	$img.attr("src", e.target.result);
	            };
				reader.readAsDataURL(file);
	            
	            $(".img-grid").append($img);
	        }
			
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.writeForm.selectFile.files = dt.files;		
	});
});

// 추가이미지 등록중 삭제하기
/*
	$(".table-form").on("click", ".img-item", function(event) {
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
	    for(let i = 0; i < sel_files.length; i++) {
	    	if(filename === sel_files[i].name){
	    		sel_files.splice(i, 1);
	    		break;
			}
	    }
	
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.writeForm.selectFile.files = dt.files;
		
		$(this).remove();
	});

  */
</script>
