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

/* 옵션 CSS */

legend {
	font-size: 14px;
}

p,
label {
  font:
    1rem 'Fira Sans',
    sans-serif;
}

input {
  margin: 0.4rem;
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

$(function(){
	let mode = "${mode}";
	if(mode === "insert") {
		$("carShow1").prop("checked", true);
	}
});

function check() {
	const f = document.writeForm;
	let mode = "${mode}";
	f.action = "${pageContext.request.contextPath}/admin/carManage/${mode}";
	return true;
}
</script>

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




<div class="body-container">
	<div class="body-title">
		<h2><i class="fa-solid fa-caravan" style="font-size:23px;"></i>&nbsp;캠핑카관리 </h2>
	</div>
    
    <div class="body-main">
		<div>
			<ul class="tabs">
				<li id="tab-0" data-tab="0"><i class="fa-regular fa-note-sticky"></i>&nbsp;리스트</li>
				<li id="tab-1" data-tab="1"><i class="fa-regular fa-pen-to-square"></i>&nbsp;${mode=="update"?"수정":"등록"}</li>
			</ul>
		</div>
		<div id="tab-content" style="padding: 20px 10px 0;">
			<form name="writeForm" method="post" enctype="multipart/form-data">
				<table class="table table-form">
					<tr>
						<td class="table-light col-sm-2">캠핑카 이름</td>
						<td><input type="text" name="carName" value="${dto.carName}" class="form-control" ></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">차량구분</td>
						<td>
							<select name="carSize" class="form-select">
								<option value="" >:: 차량 종류 선택 ::</option>
								<option value="모터홈" ${dto.carSize=="모터홈"?"selected":""}>모터홈</option>
								<option value="차박형(중형)" ${dto.carSize=="차박형(중형)"?"selected":""}>차박형(중형)</option>
								<option value="차박형(소형)" ${dto.carSize=="차박형(소형)"?"selected":""}>차박형(소형)</option>
							</select>
						</td>
					</tr>
					<tr> 
						<td class="table-light col-sm-2">주중가격</td>
						<td style="display:flex;">
						<input type="text" name="weekCost" value="${dto.weekCost}" class="form-control"  style="width:300px;"><span style="margin:5px;">&nbsp;원</span>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">주말가격</td>
						<td style="display:flex;">
						<input type="text" name="wkndCost" value="${dto.wkndCost}" class="form-control" style="width:300px;"><span style="margin:5px;">&nbsp;원</span>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">차량번호</td>
						<td><input type="text" name="caravanNum" value="${dto.caravanNum}" class="form-control"></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">차량연식</td>
						<td><input type="text" name="carBirth" value="${dto.carBirth}" class="form-control"></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품 진열</td>
						<td>
							<div class="pt-2 pb-2">
								<input type="radio" name="carShow" class="form-check-input" id="carShow1" value="1" ${dto.carShow==1 ? "checked='checked'" : "" }> <label class="form-check-label" for="carShow1">상품진열</label>
								&nbsp;&nbsp;
								<input type="radio" name="carShow" class="form-check-input" id="carShow0" value="0" ${dto.carShow==0 ? "checked='checked'" : "" }> <label class="form-check-label" for="carShow0">진열안함</label>
								&nbsp;&nbsp;
								<input type="radio" name="carShow" class="form-check-input" id="carShow0" value="2" ${dto.carShow==2 ? "checked='checked'" : "" }> <label class="form-check-label" for="carShow0">단종</label>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">한줄설명</td>
						<td><input type="text" name="description" class="form-control" value="${dto.description}"></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품설명</td>
						<td>
							<textarea name="content" id="ir1" class="form-control" style="max-width: 95%; height: 290px;">${dto.content}</textarea>
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
						<td class="table-light col-sm-2">추가이미지</td>
						<td>
							<div class="img-grid">
								<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
								<c:forEach var="vo" items="${listFile}">
									<img src="${pageContext.request.contextPath}/uploads/caravan/${vo.imageFilename}"
										class="item delete-img"
										data-fileNum="${vo.carImagenum}"
										data-filename="${vo.imageFilename}">
								</c:forEach>
							</div>
							<input type="file" name="addFiles" accept="image/*" multiple class="form-control" style="display: none;">
						</td>
					</tr>
					
					<!-- 
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
								<c:forEach var="vo" items="${listFile}">
									<img src="${pageContext.request.contextPath}/uploads/campingcar/caravan/${vo.imageFilename}"
										class="item delete-img"
										data-fileNum="${vo.carImagenum}"
										data-filename="${vo.imageFilename}">
								</c:forEach>
							<input type="file" name="addFiles" accept="image/*" multiple style="display: none;" class="form-control" value="${addFiles}">
						</td>
					</tr>
					 -->
					
					<tr>
						<td class="table-light col-sm-2">할인율</td>
						<td><input type="text" name="discountRate" class="form-control" value="${dto.discountRate}"></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">탑승가능인원</td>
						<td><input type="text" name="carMaxNum" class="form-control" value="${dto.carMaxNum}"></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">취침가능인원</td>
						<td><input type="text" name="sleepNum" class="form-control" value="${dto.sleepNum}"></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">반려동물</td>
						<td>
							<div class="pt-2 pb-2">
								<input type="radio" name="petOrNot" class="form-check-input" id="pet1" value="1" ${dto.carShow==1 ? "checked='checked'" : "" }> <label class="form-check-label" for="pet1">동반가능</label>
								&nbsp;&nbsp;
								<input type="radio" name="petOrNot" class="form-check-input" id="pet0" value="0" ${dto.carShow==0 ? "checked='checked'" : "" }> <label class="form-check-label" for="pet0">동반불가능</label>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상세옵션</td>
						<td>
							<fieldset>
							  <legend>옵션을 선택해주세요. (복수선택 가능)</legend>
							  <div>
							  <span>
							    <input type="checkbox" id="toilet" value= "1"  name="toilet" ${dto.toilet==1? "checked='checked'" : ""} />
							    <label for="toilet">화장실</label>
							  </span>
							  <span>
							    <input type="checkbox" id="shower" name="shower" value= "1" ${dto.shower==1? "checked='checked'" : ""} />
							    <label for="shower">샤워가능</label>
							  </span>
							  <span>
							    <input type="checkbox" id="bed" name="bed" value= "1" ${dto.bed==1? "checked='checked'" : ""}/>
							    <label for="bed">침대</label>
							  </span>
							  <span>
							    <input type="checkbox" id="sink" name="sink" value= "1" ${dto.sink==1? "checked='checked'" : ""}/>
							    <label for="sink">싱크대</label>
							  </span>
							  <span>
							    <input type="checkbox" id="microwave" name="microwave" value= "1" ${dto.microwave==1? "checked='checked'" : ""}/>
							    <label for="microwave">전자레인지</label>
							  </span>
							  </div>
							  <div>
							  <span>
							    <input type="checkbox" id="frige" name="frige" value= "1" ${dto.frige==1? "checked='checked'" : ""}/>
							    <label for="fridge">냉장고</label>
							  </span>
							  <span>
							    <input type="checkbox" id="waterHeater" name="waterHeater" value= "1" ${dto.waterHeater==1? "checked='checked'" : ""}/>
							    <label for="waterHeater">온수기</label>
							  </span>
							  <span>
							    <input type="checkbox" id="desk" name="desk" value= "1" ${dto.desk==1? "checked='checked'" : ""}/>
							    <label for="desk">식탁</label>
							  </span>
							  <span>
							    <input type="checkbox" id="tv" name="tv" value= "1" ${dto.tv==1? "checked='checked'" : ""}/>
							    <label for="tv">TV</label>
							  </span>
							  <span>
							    <input type="checkbox" id="airCondition" name="airCondition" value= "1" ${dto.airCondition==1? "checked='checked'" : ""}/>
							    <label for="airCondition">에어컨</label>
							  </span>
							  </div>
							  <div>
							  <span>
							    <input type="checkbox" id="heater" name="heater" value= "1" ${dto.heater==1? "checked='checked'" : ""}/>
							    <label for="heater">히터</label>
							  </span>
							  <span>
							    <input type="checkbox" id="powerBank" name="powerBank" value= "1" ${dto.powerBank==1? "checked='checked'" : ""}>
							    <label for="powerbank">파워뱅크</label>
							  </span>
							  <span>
							    <input type="checkbox" id="induction" name="induction" value= "1" ${dto.induction==1? "checked='checked'" : ""}/>
							    <label for="induction">인덕션</label>
							  </span>
							  <span>
							    <input type="checkbox" id="gasStove" name="gasStove" value= "1" ${dto.gasStove==1? "checked='checked'" : ""}/>
							    <label for="gasStove">가스레인지</label>
							  </span>
							  </div>
							</fieldset>
						</td>
					</tr>
				</table>
				
				<table class="table table-borderless">
					<tr>
						<td class="text-center">
							<c:url var="url" value="/admin/carManage/car">
								<c:if test="${not empty page}">
									<c:param name="page" value="${page}"/>
								</c:if>
							</c:url>
							<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=="update"?"수정완료":"등록완료"}</button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${url}';">${mode=="update"?"수정취소":"등록취소"}</button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="carNum" value="${dto.carNum}">
								<input type="hidden" name="thumbnail" value="${dto.thumbnail}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
				
				
				
			</form>
		</div> <!-- tab-content -->
		
	</div> <!-- body-main -->
</div> <!-- body-container -->

<script type="text/javascript">
// 대표(썸네일) 이미지
$(function(){
	var img = "${dto.thumbnail}";
	if( img ) {
		img = "${pageContext.request.contextPath}/uploads/caravan/"+img;
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
				img = "${pageContext.request.contextPath}/uploads/caravan/"+img;
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

// 수정에서 등록된 추가 이미지 삭제
$(function(){
	$(".delete-img").click(function(){
		if(! confirm("이미지를 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		let $img = $(this);
		let fileNum = $img.attr("data-fileNum");
		let filename = $img.attr("data-filename");
		let url="${pageContext.request.contextPath}/admin/carManage/deleteFile";
		$.post(url, {carImagenum:fileNum, filename:filename}, function(data){
			$img.remove();
		}, "json");
	});
});

// 추가 이미지
$(function(){
	var sel_files = [];
	
	$(".table-form").on("click", ".img-add", function(){
		$("form[name=writeForm] input[name=addFiles]").trigger("click");
	});
	
	$("form[name=writeForm] input[name=addFiles]").change(function(){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.writeForm.addFiles.files = dt.files;
			
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
		document.writeForm.addFiles.files = dt.files;
	});
	
	$("body").on("click", ".table-form .img-item", function(){
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
		document.writeForm.addFiles.files = dt.files;		
		
		$(this).remove();
	});
});
</script>

<!-- 에디터 연결 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 try {
		if(! check()) {
			return;
		}
		
		elClickedObj.submit();
		
	} catch(e) {
	}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}


</script>




