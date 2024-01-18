<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div style="max-width: 800px;">
	<form name="AdSiteForm" method="post" enctype="multipart/form-data">
		<table class="table mt-3 write-form">
			<tr>
				<td class="bg-light col-sm-2" scope="row">광고 시작일</td>
				<td>
					<input type="date" name="startP" class="form-control" value="">
				</td>
			</tr>
			
			<tr>
				<td class="bg-light col-sm-2" scope="row">광고 시작일</td>
				<td>
					<input type="date" name="endP" class="form-control" value="">
				</td>
			</tr>
	
			<tr>
				<td class="bg-light col-sm-2" scope="row">금액</td>
				<td>
					<p> 일당 5만원</p>
					<input type="hidden" name="adFeePerDay" class="form-control" value="50000">
				</td>
			</tr>
			
			
	
		</table>
		
		<table class="table table-borderless">
				<tr>
				<td class="text-center">
					<button type="button" class="btn btn-dark btnSendOk">등록하기&nbsp;<i class="bi bi-check2"></i></button>
					<button type="reset" class="btn btn-light">다시입력</button>
					<button type="button" class="btn btn-light btnModalClose">등록취소&nbsp;<i class="bi bi-x"></i></button>
					
					<input type="hidden" name="siteNum" value="${siteNum}">
					
				</td>
			</tr>
		</table>
	</form>
</div>


