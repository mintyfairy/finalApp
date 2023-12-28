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
    margin: 70px 0;
    padding: 20px;
}

.body-title h3 {
    margin: 0;
}

.body-main {
	display: block;
    margin-top: 20px;
}

.body-container {
	max-width: 1080px;
    clear: both;
    margin: 0 auto;
    min-height: 500px;
    padding-top: 20px;
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
											<option value="${vo.categoryNum}" ${parentNum==vo.categoryNum?"selected":""}>${vo.categoryName}</option>
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
							<select name="special" class="form-select">
								<option value="0" ${dto.special==0?"selected":""}>가스웨어</option>
								<option value="1" ${dto.special==1?"selected":""}>거버</option>
								<option value="2" ${dto.special==2?"selected":""}>나인스토라</option>
								<option value="0" ${dto.special==0?"selected":""}>노마드</option>
								<option value="1" ${dto.special==1?"selected":""}>더벤</option>
								<option value="2" ${dto.special==2?"selected":""}>듀랑고</option>
								<option value="0" ${dto.special==0?"selected":""}>라시에스타</option>
								<option value="1" ${dto.special==1?"selected":""}>레드오크</option>
								<option value="2" ${dto.special==2?"selected":""}>마운틴 스미스</option>
								<option value="0" ${dto.special==0?"selected":""}>마티니</option>
								<option value="1" ${dto.special==1?"selected":""}>바운스</option>
								<option value="2" ${dto.special==2?"selected":""}>브루클린윅스</option>
								<option value="0" ${dto.special==0?"selected":""}>세이즈</option>
								<option value="1" ${dto.special==1?"selected":""}>씨엠 26</option>
								<option value="2" ${dto.special==2?"selected":""}>에어포스</option>
								<option value="0" ${dto.special==0?"selected":""}>오리지널 스와트</option>
								<option value="1" ${dto.special==1?"selected":""}>자칼</option>
								<option value="2" ${dto.special==2?"selected":""}>잭다니엘</option>
								<option value="0" ${dto.special==0?"selected":""}>카고컨테이너</option>
								<option value="1" ${dto.special==1?"selected":""}>커쇼</option>
								<option value="2" ${dto.special==2?"selected":""}>타이탄</option>
								<option value="0" ${dto.special==0?"selected":""}>테라노바</option>
								<option value="1" ${dto.special==1?"selected":""}>프리즘</option>
								<option value="2" ${dto.special==2?"selected":""}>폭스나이프</option>
								<option value="1" ${dto.special==1?"selected":""}>휴너스도르프</option>
								<option value="2" ${dto.special==2?"selected":""}>힐레베르브</option>
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
								<option value="2" ${dto.special==2?"selected":""}>기획상품</option>
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
						<td class="table-light col-sm-2">md 여부</td>
						<td>
							<div class="pt-2 pb-2">
								<input type="radio" name="mdShow" class="form-check-input" id="productShow1" value="1" ${dto.productShow==1 ? "checked='checked'" : "" }> <label class="form-check-label" for="productShow1">md X</label>
								&nbsp;&nbsp;
								<input type="radio" name="mdShow" class="form-check-input" id="productShow0" value="0" ${dto.productShow==0 ? "checked='checked'" : "" }> <label class="form-check-label" for="productShow0">md O</label>
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
									<img src="${pageContext.request.contextPath}/uploads/product/${vo.filename}"
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
							<c:url var="url" value="/admin/product/main">
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
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>
