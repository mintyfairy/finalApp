<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 950px;
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
</style>
<div id="loadingLayout" style="display:none; position: absolute; left: 0; top:0; width: 100%; height: 100%; z-index: 9000; background: #eee;">
	<div class="loader"></div>
</div>
<script type="text/javascript">
$(function(){
	let mode = "${mode}";
	if(mode === "write") {
		let special = "${special}";
		$("select[name=special]").val(special);
		
		$("#siteOption1").prop("checked", true);
	}
});



function check() {
	const f = document.productForm;
	let str, b;
	let mode = "${mode}";
	
	
	if(! f.siteName.value.trim()) {
		alert("이름을 입력하세요.");
		f.siteName.focus();
		return false;
	}
	

	if(mode === "write" && ! f.thumbnailFile.value) {
		alert("대표 이미지를 등록하세요.");
		f.thumbnailFile.focus();
		return false;
	}
	let list=f.siteOptionList;
	console.log(list);
	for(var i=0; i<list.length; i++){
		if(list[i].checked){
			list[i].value="1";
		}else{
			list[i].value="0";
		}
		list[i].checked=true;
		//console.log(list[i].value);
	}
	f.action = "${pageContext.request.contextPath}/admin/siteManage/site/${mode}";
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

<div class="container">
	<div class="body-container">
		<div class="body-title"> 
			<h3><i class="bi bi-app"></i> 캠핑장 관리 </h3>
		</div>
		
		<div class="body-main">
		
			<form name="productForm" method="post" enctype="multipart/form-data">
				<table class="table mt-5 table-form">
					<tr>
						<td class="table-light col-sm-2">카테고리</td>
						<td>
							<div class="row">
								<div class="col-6 pe-1">
									<select name="category" class="form-select">
										<option value="" >:: 분류 ::</option>
										<option value="1" ${dto.category==1?"selected":""}>오토캠핑</option>
                                        <option value="2" ${dto.category==2?"selected":""}>글램핑</option>
                                        <option value="3" ${dto.category==3?"selected":""}>카라반</option>
                                        <option value="4" ${dto.category==4?"selected":""}>방갈로</option>
                                        <option value="5" ${dto.category==5?"selected":""}>차박</option>
									</select>
								</div>
								<div class="col-6 ps-1">
									<select name="environment" class="form-select">
										<option value="">:: 환경 ::</option>
										<option value="1" ${dto.environment==1?"selected":""}>산</option>
                                        <option value="2" ${dto.environment==2?"selected":""}>강</option>
                                        <option value="3" ${dto.environment==3?"selected":""}>바다</option>
                                        <option value="4" ${dto.environment==4?"selected":""}>도심</option>
                                        <option value="5" ${dto.environment==5?"selected":""}>계곡</option>
                                        <option value="6" ${dto.environment==6?"selected":""}>호수</option>
                                        <option value="7" ${dto.environment==7?"selected":""}>평야</option>
                                        <option value="8" ${dto.environment==8?"selected":""}>기타</option>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">업체명</td>
						<td>
							<input type="text" name="siteName" class="form-control" value="${dto.siteName}">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">지역구분</td>
						<td>
							<select name="siteLocal" class="form-select">
										<option selected> 지역 </option>
                              			<option value="1" ${dto.siteLocal==1?"selected":""}>서울</option>
                               			<option value="2" ${dto.siteLocal==2?"selected":""}>인천</option>
                                        <option value="3" ${dto.siteLocal==3?"selected":""}>경기</option>
                                        <option value="4" ${dto.siteLocal==4?"selected":""}>강원</option>
                                        <option value="5" ${dto.siteLocal==5?"selected":""}>대전</option>
                                        <option value="6" ${dto.siteLocal==6?"selected":""}>세종</option>
                                        <option value="7" ${dto.siteLocal==7?"selected":""}>충북</option>
                                        <option value="8" ${dto.siteLocal==8?"selected":""}>충남</option>
                                        <option value="9" ${dto.siteLocal==9?"selected":""}>대구</option>
                                        <option value="10" ${dto.siteLocal==10?"selected":""}>울산</option>
                                        <option value="11" ${dto.siteLocal==11?"selected":""}>경북</option>
                                        <option value="12" ${dto.siteLocal==12?"selected":""}>경남</option>
                                        <option value="13" ${dto.siteLocal==13?"selected":""}>전북</option>
                                        <option value="14" ${dto.siteLocal==14?"selected":""}>전남</option>
                                        <option value="15" ${dto.siteLocal==15?"selected":""}>제주</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">입실시간</td>
						<td>
							<input type="time" name="checkIn" class="form-control" value="${dto.checkIn}">
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2">퇴실시간</td>
						<td>
							<input type="time" name="checkOut" class="form-control" value="${dto.checkOut}">
						</td>
					</tr>
					
					
					
					<tr>
						<td class="table-light col-sm-2">캠핑장옵션</td>
						<td>
							<div class="pt-2 pb-2">
								<input type="checkbox" name="siteOptionList" class="form-check-input"  value="0" ${dto.siteOptionList[0]==1 ? "checked='checked'" : "" }> <label class="form-check-label" >전기</label>
								&nbsp;&nbsp;
								<input type="checkbox" name="siteOptionList" class="form-check-input"  value="0" ${dto.siteOptionList[1]==1 ? "checked='checked'" : "" }> <label class="form-check-label" >와이파이</label>
								&nbsp;&nbsp;
								<input type="checkbox" name="siteOptionList" class="form-check-input"  value="0" ${dto.siteOptionList[2]==1 ? "checked='checked'" : "" }> <label class="form-check-label" > 비비큐 장비 대여</label>
								&nbsp;&nbsp;
								<input type="checkbox" name="siteOptionList" class="form-check-input"  value="0" ${dto.siteOptionList[3]==1 ? "checked='checked'" : "" }> <label class="form-check-label" >운동장</label>
								&nbsp;&nbsp;
								<input type="checkbox" name="siteOptionList" class="form-check-input" value="0" ${dto.siteOptionList[4]==1 ? "checked='checked'" : "" }> <label class="form-check-label" >화장실</label>
								&nbsp;&nbsp;
								<input type="checkbox" name="siteOptionList" class="form-check-input"  value="0" ${dto.siteOptionList[5]==1 ? "checked='checked'" : "" }> <label class="form-check-label" >샤워장</label>
								
							</div>
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2">캠핑장 설명</td>
						<td>
							<textarea name="introduce" id="ir1" class="form-control" style="max-width: 95%; height: 290px;">${dto.introduce}</textarea>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2" ><label  for="zip">우편번호</label></td>
						<td>
							<div class="row mb-3">
		                        <div class="col-sm-5">
		                           <div class="input-group">
		                               <input type="text" name="zip" id="zip" class="form-control" placeholder="우편번호" value="${dto.zip}" readonly>
		                               <button class="btn btn-light" type="button" style="margin-left: 3px;" onclick="daumPostcode();">우편번호 검색</button>
		                           </div>
		                    	</div>
		                    </div>
              
                    
						</td>
					
					</tr>
					<tr>
						<td class="table-light col-sm-2" ><label  for="addr1">주소</label></td>
						<td>
							<div class="row mb-3">
			                    <div class="col-sm-10">
			                           <div>
			                               <input type="text" name="addr1" id="addr1" class="form-control" placeholder="기본 주소" value="${dto.addr1}" readonly>
			                           </div>
			                           <div style="margin-top: 5px;">
			                             <input type="text" name="addr2" id="addr2" class="form-control" placeholder="상세 주소" value="${dto.addr2}">
			                      		</div>
			                    </div>
		                    </div>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">대표이미지</td>
						<td>
							<div class="thumbnail-viewer">
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
									<img src="${pageContext.request.contextPath}/uploads/site/${vo.fileName}"
										class="item delete-img"
										data-fileNum="${vo.fileNum}"
										data-fileName="${vo.fileName}">
								</c:forEach>
							</div>
							<input type="file" name="addFiles" accept="image/*" multiple class="form-control" style="display: none;">
						</td>
					</tr>
					
				</table>
				
				<table class="table table-borderless">
					<tr>
						<td class="text-center">
							<c:url var="url" value="/admin/siteManage/main">
								<c:if test="${not empty page}">
									<c:param name="page" value="${page}"/>
								</c:if>
							</c:url>
							<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=="update"?"수정완료":"등록완료"}</button>
							
							<button type="button" class="btn btn-light" onclick="location.href='${url}';">${mode=="update"?"수정취소":"등록취소"}</button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="siteNum" value="${dto.siteNum}">
								<input type="hidden" name="thumbnail" value="${dto.thumbnail}">
								<input type="hidden" name="page" value="${page}">
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
		img = "${pageContext.request.contextPath}/uploads/site/"+img;
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
				img = "${pageContext.request.contextPath}/uploads/site/"+img;
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
		let fileName = $img.attr("data-fileName");
		let url="${pageContext.request.contextPath}/admin/siteManage/deleteFile/site";
		$.post(url, {fileNum:fileNum, fileName:fileName}, function(data){
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
			$img.attr("data-fileName", file.name);
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
		
		let fileName = $(this).attr("data-fileName");
		
		for(let i=0; i<sel_files.length; i++) {
			if(fileName === sel_files[i].name) {
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr1').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr2').focus();
        }
    }).open();
}


</script>