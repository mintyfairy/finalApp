<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

@charset "utf-8";

* {
    box-sizing: border-box;
    padding: 0;
    margin: 0;
}

.body-container {
	max-width: 1080px;
	margin: 0 auto;
}

.body-title {
    color: #424951;
    padding-top: 0;
    padding-bottom: 5px;
    margin: 0 0 25px 0;
    border-bottom: 1px solid #ddd;
}

.table {
    width: 100%;
    border-spacing: 0;
    border-collapse: collapse;
}

table {
    border-collapse: separate;
    text-indent: initial;
    border-spacing: 2px;
}

.table-list tr>th {
    text-align: center;
}

.table th {
    padding-top: 10px;
    padding-bottom: 10px;
}

.table td {
    padding-top: 10px;
    padding-bottom: 10px;
}

th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
}

.table-list thead {
    color: gray;
}

.page-navigation {
    clear: both;
    padding: 20px 0;
    text-align: center;
}

.body-title h2 {
    font-size: 23px;
    min-width: 300px;
    font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    font-weight: bold;
    margin: 0 0 -5px 0;
    padding-bottom: 5px;
    display: inline-block;
    border-bottom: 3px solid #424951;
}

form {
    display: block;
}

.btn {
    color: #333;
    border: 1px solid #999;
    background-color: #fff;
    padding: 5px 10px;
    border-radius: 4px;
    font-weight: 500;
    cursor: pointer;
    font-size: 14px;
    font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
    vertical-align: baseline;
}

</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">




<div class="body-container">
    <div class="body-title">
		<h2><i class="fa-solid fa-user-group"></i> 고객센터 관리 </h2>
    </div>
    
    <div class="body-main">
		<table class="table">
			<tr>
				<td align="left" width="50%">
					0개(0/0 페이지)
				</td>
				<td align="right">
					&nbsp;
				</td>
			</tr>
		</table>
		
		<table class="table table-border table-list">
			<thead>
				<tr>
					<th width="60">번호</th>
					<th>제목</th>
					<th width="100">작성자</th>
					<th width="100">작성일</th>
					<th width="70">조회수</th>
					<th width="50">첨부</th>
					<th width="50">표시</th>
				</tr>
			</thead>
		</table>

		<div class="page-navigation">
			등록된 게시물이 없습니다.
		</div>
		
		<table class="table">
			<tr>
				<td align="left" width="200">
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/noticeManage/list';" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
				</td>
				<td align="center" style="display: flex; justify-content: space-between; align-items: center;">
						<select name="schType" class="form-select" style="width: 120px;">
							<option value="all">모두</option>
							<option value="userName">작성자</option>
							<option value="reg_date">등록일</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="kwd" value="${kwd}" class="form-control" style="width: 280px;">
						<button type="button" class="btn" onclick="searchList()" style="border: 1px solid #dedede;">검색</button>
					</form>
				</td>
				<td align="right" width="130">
					<button type="button" class="btn"  style="border: 1px solid #dedede;" style="border: 1px solid #dedede;">글올리기</button>
				</td>
			</tr>
		</table>
	</div>
</div>

<div id="member-dialog" style="display: none;"></div>
