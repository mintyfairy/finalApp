<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@charset "utf-8";

* {
    padding: 0;
    margin: 0;
}

.container {
	width: 1080px;
	margin: 0;
	padding-left: 250px;
}

.body-title h3 {
    margin: 0;
}

.body-main {
	display: block;
}

.body-container {
	width: 1080px;
    clear: both;
    min-height: 500px;
    margin-top: 60px;
}

*::after, ::before {
    box-sizing: border-box;
}

.table-form tr>td { vertical-align: middle; }
.table-form tr:first-child { border-top: 2px solid #212529; }
.table-form tr>td:first-child { text-align: center; }
.table-form tr>td:nth-child(2) { padding-left: 10px; }
.table-form textarea { height: 170px; resize: none; }

.table-form .option-minus, .table-form .option-minus2 { cursor: pointer; }

.table-form .thumbnail-viewer {
	cursor: pointer;
	border: 1px solid #f5fffa;
	width: 50px; height: 50px; border-radius: 10px;
	background: url('/image/add_photo.png') no-repeat center center;
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
	cursor: pointer;
}


</style>

<script type="text/javascript">
function check() {
	const f = document.productForm;
	let str, b;
	let mode = "${mode}";
	
	if(! f.parentNum.value) {
		alert("카테고리를 선택하세요.");
		f.parentNum.focus();
		return false;
	}

	if(! f.categoryNum.value) {
		alert("카테고리를 선택하세요.");
		f.categoryNum.focus();
		return false;
	}
	
	if(! f.brandNum.value) {
		alert("브랜드를 선택하세요.");
		f.categoryNum.focus();
		return false;
	}
	
	if(! f.productName.value.trim()) {
		alert("상품명을 입력하세요.");
		f.productName.focus();
		return false;
	}
	
	if(! f.special.value) {
		alert("특가상품 여부를 선택하세요.");
		f.categoryNum.focus();
		return false;
	}
	
	if(!/^(\d){1,8}$/.test(f.price.value)) {
		alert("상품가격을 입력 하세요.");
		f.price.focus();
		return false;
	}
	
	if(!/^(\d){1,2}$/.test(f.discountRate.value)) {
		alert("할인율을 입력 하세요.");
		f.discountRate.focus();
		return false;
	}
	
	if(!/^(\d){1,8}$/.test(f.delivery.value)) {
		alert("배송비를 입력 하세요.");
		f.delivery.focus();
		return false;
	}
	
	if(! f.optionName.value.trim()) {
		alert("상위 옵션명 입력 하세요.");
		f.optionName.focus();
		return false;
	}
	
	b = true;
	$("input[name=optionValues]").each(function(){
		if(! $(this).val().trim()) {
			b= false;
			return false;
		}
	});
	
	if(! b) {
		alert("상위 옵션값을 입력 하세요.");
		return false;
	}
	
	if(! f.optionName2.value.trim()) {
		alert("하위 옵션명 입력 하세요.");
		f.optionName2.focus();
		return false;
	}
	
	b = true;
	$("input[name=optionValues2]").each(function(){
		if(! $(this).val().trim()) {
			b= false;
			return false;
		}
	});
	if(! b) {
		alert("하위 옵션값을 입력 하세요.");
		return false;
	}
	
	if(! f.md.value) {
		alert("특가상품 여부를 선택하세요.");
		f.categoryNum.focus();
		return false;
	}
	
	if(! f.starter.value) {
		alert("특가상품 여부를 선택하세요.");
		f.categoryNum.focus();
		return false;
	}
	
	str = f.content.value.trim();
	if( !str || str === "<p><br></p>" ) {
		alert("상품 설명을 입력하세요.");
		f.content.focus();
		return false;
	}

	if(mode === "write" && ! f.thumbnailFile.value) {
		alert("대표 이미지를 등록하세요.");
		f.thumbnailFile.focus();
		return false;
	}
	
	f.action = "${pageContext.request.contextPath}/admin/shopProduct/${mode}";
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

$(function(){
	$("form select[name=parentNum]").change(function(){
		let parentNum = $(this).val();
		
		$("form select[name=categoryNum]").find('option').remove().end()
			.append("<option value=''>:: 카테고리 선택 ::</option>");	
		
		if(! parentNum) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/admin/shopProduct/listSubCategory";
		let query = "parentNum="+parentNum;
		
		const fn = function(data) {
			$.each(data.listSubCategory, function(index, item){
				let categoryNum = item.categoryNum;
				let categoryName = item.categoryName;
				let s = "<option value='"+categoryNum+"'>"+categoryName+"</option>";
				$("form select[name=categoryNum]").append(s);
			});
		};
		ajaxFun(url, "get", query, "json", fn);
		
	});
});

$(function(){
	if(${mode} != 'update') {
		$("form select[name=brandNum]").ready(function(){
			
			$("form select[name=brandNum]").find('option').remove().end()
				.append("<option value=''>:: 브랜드 선택 ::</option>");	
			
			let url = "${pageContext.request.contextPath}/admin/shopProduct/listBrand";
			let query = "";
			
			const fn = function(data) {
				console.log(data);
				$.each(data.listBrand, function(index, item){
					let brandNum = item.brandNum;
					let brandName = item.brandName;
					let s = "<option value='"+brandNum+"'>"+brandName+"</option>";
					$("form select[name=brandNum]").append(s);
				});
			};
			ajaxFun(url, "get", query, "json", fn);
			
		});
	}
});
</script>

<script type="text/javascript">
$(function(){
	$(".btnOptionAdd").click(function(){
		let $el = $(this).closest(".option-area").find(".optionValue-area");
		if($el.find(".input-group").length >= 5) {
			alert("옵션은 최대 5개까지 가능합니다.");
			return false;
		}
		let $option = $(".option-area .optionValue-area .input-group:first-child").clone();
		
		$option.find("input[type=hidden]").remove();
		$option.find("input[name=optionValues]").removeAttr("value");
		$option.find("input[name=optionValues]").val("");
		$el.append($option);
	});
	
	$(".option-area").on("click", ".option-minus", function(){
		let $minus = $(this);
		let $el = $minus.closest(".option-area").find(".optionValue-area");
		
		// 수정에서 등록된 자료 삭제
		let mode = "${mode}";
		if(mode === "update" && $minus.parent(".input-group").find("input[name=detailNums]").length === 1) {
			// 저장된 옵션값중 최소 하나는 삭제되지 않도록 설정
			if($el.find(".input-group input[name=detailNums]").length <= 1) {
				alert("옵션값은 최소 하나이상 필요합니다.");	
				return false;
			}
			
			if(! confirm("옵션값을 삭제 하시겠습니까 ? ")) {
				return false;
			}
			
			let detailNum = $minus.parent(".input-group").find("input[name=detailNums]").val();
			let url = "${pageContext.request.contextPath}/admin/shopProduct/deleteOptionDetail1";
			$.post(url, {detailNum:detailNum}, function(data){
				if(data.state === "true") {
					$minus.closest(".input-group").remove();
				} else {
					alert("옵션값을 삭제할 수 없습니다.");
				}
			}, "json");
			
			return false;			
		}
		
		if($el.find(".input-group").length <= 1) {
			$el.find("input[name=optionValues]").val("");
			return false;
		}
		
		$minus.closest(".input-group").remove();
	});
});

$(function(){
	$(".btnOptionAdd2").click(function(){
		let $el = $(this).closest(".option-area2").find(".optionValue-area2");
		if($el.find(".input-group").length >= 5) {
			alert("옵션 값은 최대 5개까지 가능합니다.");
			return false;
		}
		let $option = $(".option-area2 .optionValue-area2 .input-group:first-child").clone();
		
		$option.find("input[type=hidden]").remove();
		$option.find("input[name=optionValues2]").removeAttr("value");
		$option.find("input[name=optionValues2]").val("");
		$el.append($option);
	});
	
	$(".option-area2").on("click", ".option-minus2", function(){
		let $minus = $(this);
		let $el = $minus.closest(".option-area2").find(".optionValue-area2");
		
		// 수정에서 등록된 자료 삭제
		let mode = "${mode}";
		if(mode === "update" && $minus.parent(".input-group").find("input[name=detailNums2]").length === 1) {
			// 저장된 옵션값중 최소 하나는 삭제되지 않도록 설정
			if($el.find(".input-group input[name=detailNums2]").length <= 1) {
				alert("옵션값은 최소 하나이상 필요합니다.");	
				return false;
			}
			
			if(! confirm("옵션값을 삭제 하시겠습니까 ? ")) {
				return false;
			}
			
			let detailNum = $minus.parent(".input-group").find("input[name=detailNums2]").val();
			let url = "${pageContext.request.contextPath}/admin/shopProduct/deleteOptionDetail2";
			$.post(url, {detailNum:detailNum}, function(data){
				if(data.state === "true") {
					$minus.closest(".input-group").remove();
				} else {
					alert("옵션값을 삭제할 수 없습니다.");
				}
			}, "json");
			
		}
		
		if($el.find(".input-group").length <= 1) {
			$el.find("input[name=optionValues2]").val("");
			return false;
		}
		
		$minus.closest(".input-group").remove();
	});
});
</script>

<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h3><i class="bi bi-app"></i> 상품관리 </h3>
		</div>
		
		<div class="body-main">
		
			<form name="productForm" method="post" enctype="multipart/form-data">
				<table class="table mt-5 table-form">
					<tr>
						<td class="table-light col-sm-2">카테고리</td>
						<td>
							<div class="row">
								<div class="col-6 pe-1">
									<select name="parentNum" class="form-select">
										<option value="">:: 메인 카테고리 선택 ::</option>
										<c:forEach var="vo" items="${listCategory}">
											<option value="${vo.categoryNum}" ${dto.parentNum==vo.categoryNum?"selected":""}>${vo.categoryName}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-6 ps-1">
									<select name="categoryNum" class="form-select">
										<option value="">:: 카테고리 선택 ::</option>
										<c:forEach var="vo" items="${listSubCategory}">
											<option value="${vo.categoryNum}" ${dto.categoryNum==vo.categoryNum?"selected":""}>${vo.categoryName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">브랜드 명</td>
						<td>
							<select name="brandNum" class="form-select">
								<option value="">:: 브랜드 선택 ::</option>
								<c:forEach var="vo" items="${listBrand}">
									<option value="${vo.brandNum}" ${dto.brandNum==vo.brandNum?"selected":""}>${vo.brandName}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품명</td>
						<td>
							<input type="text" name="productName" class="form-control" value="${dto.productName}">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품구분</td>
						<td>
							<select name="special" class="form-select">
								<option value="0" ${dto.special==0?"selected":""}>일반상품</option>
								<option value="1" ${dto.special==1?"selected":""}>특가상품</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품가격</td>
						<td>
							<input type="text" name="price" class="form-control" value="${dto.price}">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">할인율</td>
						<td>
							<input type="text" name="discountRate" class="form-control" value="${dto.discountRate}">
							<small class="form-control-plaintext help-block">할인율이 0인 경우 상품가격이 판매가격입니다.</small>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">배송비</td>
						<td>
							<input type="text" name="delivery" class="form-control" value="${dto.delivery}">
							<small class="form-control-plaintext help-block">배송비가 0인 경우 무료 배송입니다.</small>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">상위 옵션</td>
						<td>
							<div class="mb-2">
								<input type="text" name="optionName" class="form-control" style="width: 250px;" placeholder="옵션명" value="${dto.optionName}">
								<c:if test="${mode=='update'}">
									<input type="hidden" name="optionNum" value="${dto.optionNum}">
								</c:if>
							</div>
							<div class="row option-area">
								<div class="col-auto pe-0 d-flex flex-row optionValue-area">
									<c:forEach var="vo" items="${listOptionDetail}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값' value="${vo.optionValue}">
											<input type="hidden" name="detailNums" value="${vo.detailNum}">
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus'></i>
										</div>
									</c:forEach>
									<c:if test="${empty listOptionDetail || listOptionDetail.size() < 1}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값'>
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus'></i>
										</div>
									</c:if>
								</div>
								<div class="col-auto">
									<button type="button" class="btn btn-light btnOptionAdd">추가</button>
								</div>
							</div>
							<small class="form-control-plaintext help-block">판매 상품이 존재하면 옵션은 삭제 되지 않습니다.</small>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">하위 옵션</td>
						<td>
							<div class="mb-2">
								<input type="text" name="optionName2" style="width: 250px;" class="form-control" placeholder="옵션명" value="${dto.optionName2}">
								<c:if test="${mode=='update'}">
									<input type="hidden" name="optionNum2" value="${dto.optionNum2}">
								</c:if>
							</div>
							<div class="row option-area2">
								<div class="col-auto pe-0 d-flex flex-row optionValue-area2">
									<c:forEach var="vo" items="${listOptionDetail2}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues2' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값' value="${vo.optionValue}">
											<input type="hidden" name="detailNums2" value="${vo.detailNum}">
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus2'></i>
										</div>
									</c:forEach>
									<c:if test="${empty listOptionDetail2 || listOptionDetail2.size() < 1}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues2' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값'>
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus2'></i>
										</div>
									</c:if>
								</div>
								<div class="col-auto">
									<button type="button" class="btn btn-light btnOptionAdd2">추가</button>
								</div>
							</div>
							<small class="form-control-plaintext help-block">판매 상품이 존재하면 옵션은 삭제 되지 않습니다.</small>
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2">md 여부</td>
						<td>
							<div class="pt-2 pb-2">
								<input type="radio" name="md" class="form-check-input" id="md0" value="0" ${dto.md==0 ? "checked='checked'" : "" }> <label class="form-check-label" for="md0">md X</label>
								&nbsp;&nbsp;
								<input type="radio" name="md" class="form-check-input" id="md1" value="1" ${dto.md==1 ? "checked='checked'" : "" }> <label class="form-check-label" for="md1">md O</label>
							</div>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">starter 상품 여부</td>
						<td>
							<div class="pt-2 pb-2">
								<input type="radio" name="starter" class="form-check-input" id="starter0" value="0" ${dto.starter==0 ? "checked='checked'" : "" }> <label class="form-check-label" for="starter0">starter X</label>
								&nbsp;&nbsp;
								<input type="radio" name="starter" class="form-check-input" id="starter1" value="1" ${dto.starter==1 ? "checked='checked'" : "" }> <label class="form-check-label" for="starter1">starter O</label>
							</div>
						</td>
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
							<div class="thumbnail-viewer">
								<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
								<img alt="thumbnail" src="${pageContext.request.contextPath}/uploads/shop/${dto.thumbnail}" width="100" height="100">
							</div>
							<input type="file" name="thumbnailFile" accept="image/*" class="form-control" style="display: none;">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">추가이미지</td>
						<td>
							<div class="img-grid">
								<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
								<c:forEach var="vo" items="${listFile}">
									<img src="${pageContext.request.contextPath}/uploads/shop
									/${vo.filename}"
										class="item delete-img"
										data-fileNum="${vo.fileNum}"
										data-filename="${vo.filename}">
								</c:forEach>
							</div>
							<input type="file" name="addFiles" accept="image/*" multiple class="form-control" style="display: none;">
						</td>
					</tr>
					
				</table>
				
				<table class="table table-borderless">
					<tr>
						<td class="text-center">
							<c:url var="url" value="/admin/shopProduct/main">
								<c:if test="${not empty page}">
									<c:param name="page" value="${page}"/>
								</c:if>
								<c:if test="${special != 0}">
									<c:param name="special" value="${special}"/>
								</c:if>
							</c:url>
							<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=="update"?"수정완료":"등록완료"}</button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${url}';">${mode=="update"?"수정취소":"등록취소"}</button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="productNum" value="${dto.productNum}">
								<input type="hidden" name="thumbnail" value="${dto.thumbnail}">
								<input type="hidden" name="page" value="${page}">
								<input type="hidden" name="productShow" value="${dto.productShow}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>

<script type="text/javascript">
// 대표(썸네일) 이미지
$(function(){
	var img = "${dto.thumbnail}";
	if( img ) {
		img = "${pageContext.request.contextPath}/uploads/product/"+img;
		$(".table-form .thumbnail-viewer").empty();
		$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
	}
	
	$(".table-form .thumbnail-viewer").click(function(){
		$("form[name=productForm] input[name=thumbnailFile]").trigger("click");
	});
	
	$("form[name=productForm] input[name=thumbnailFile]").change(function(){
		let file = this.files[0];
		
		if(! file) {
			$(".table-form .thumbnail-viewer").empty();
			
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/product/"+img;
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
		let url="${pageContext.request.contextPath}/admin/shopProduct/deleteFile";
		$.post(url, {fileNum:fileNum, filename:filename}, function(data){
			$img.remove();
		}, "json");
	});
});

// 추가 이미지
$(function(){
	var sel_files = [];
	
	$("body").on("click", ".table-form .img-add", function(){
		$("form[name=productForm] input[name=addFiles]").trigger("click");
	});
	
	$("form[name=productForm] input[name=addFiles]").change(function(){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.productForm.addFiles.files = dt.files;
			
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
		document.productForm.addFiles.files = dt.files;
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
		document.productForm.addFiles.files = dt.files;		
		
		$(this).remove();
	});
});
</script>

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


