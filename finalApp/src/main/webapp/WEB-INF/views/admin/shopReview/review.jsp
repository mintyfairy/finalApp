<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
* {
    margin: 0;
    padding: 0;
    text-decoration: none;
    box-sizing: border-box;
}

ol,
ul {
    list-style: none;
}

table th,
td {
    text-align: center;
}

.body-container {
	max-width: 1080px;
	margin: 0 auto;
}

.table .ellipsis {
    position: relative;
    min-width: 200px;
}

.table .ellipsis span {
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    position: absolute;
    left: 9px;
    right: 9px;
    cursor: pointer;
}

.table .ellipsis:before {
    content: '';
    display: inline-block;
}

.score-star {
    font-size: 0;
    letter-spacing: -4px;
}

.score-star .item {
    font-size: 22px;
    letter-spacing: 1px;
    display: inline-block;
    color: #ccc;
    text-decoration: none;
    vertical-align: middle;
}

.score-star .item:first-child {
    margin-left: 0;
}

.score-star .on {
    color: #00D8FF;
}

.md-img img {
    width: 150px;
    height: 150px;
    cursor: pointer;
    object-fit: cover;
}

.item-basic-content {
    cursor: pointer;
}

.item-detail-content {
    display: none;
}

.answer-form textarea {
    width: 100%;
    height: 75px;
    resize: none;
}

.answerReview,
.deleteReview {
    cursor: pointer;
    padding-left: 5px;
}

.answerReview:hover,
.deleteReview:hover {
    font-weight: 500;
    color: #2478FF;
}

div {
    display: block;
}

.body-container {
    max-width: 1080px;
    clear: both;
    margin: 0 auto 10px;
    min-height: 500px;
    padding-top: 20px;
}

.container {
    --bs-gutter-x: 1.5rem;
    --bs-gutter-y: 0;
}

.body-title {
    color: #424951;
    padding-top: 10px;
    padding-bottom: 5px;
    margin: 0 0 25px 0;
    border-bottom: 1px solid #ddd;
}

.body-title h3 {
    font-size: 23px;
    min-width: 300px;
    font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    font-weight: bold;
    margin: 0 0 -5px 0;
    padding-bottom: 5px;
    display: inline-block;
    border-bottom: 3px solid #424951;
}

.board-list tr>th,
.board-list tr>td {
    text-align: center;
}

.table-borderless>:not(caption)>*>* {
    border-bottom-width: 0;

}

.table>:not(caption)>*>* {
    padding: 0.5rem 0.5rem;
    color: var(--bs-table-color-state, var(--bs-table-color-type, var(--bs-table-color)));
    background-color: var(--bs-table-bg);
    border-bottom-width: var(--bs-border-width);
    box-shadow: inset 0 0 0 9999px var(--bs-table-bg-state, var(--bs-table-bg-type, var(--bs-table-accent-bg)));
}



body {
    font-size: 14px;
    font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    margin: 0;
    font-weight: var(--bs-body-font-weight);
    font-weight: var(--bs-body-line-height);
    color: black
}

.board-list-header {
    padding-top: 7px;
    padding-bottom: 7px;
}

.page-navigation {
    clear: both;
    padding: 20px 0;
    text-align: center;
}

.row {
    display: flex;
    flex-wrap: wrap;
    margin-top: calc(-1 * var(--bs-gutter-y));
    margin-right: calc(-.5 * var(--bs-gutter-x));
    margin-left: calc(-.5 * var(--bs-gutter-x));
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">




<div class="body-container">
    <div class="body-title">
		<h2><i class="fa-solid fa-user-group"></i> 쇼핑몰리뷰및문의관리 </h2>
    </div>
    
    <div class="body-main">
        <div class="row board-list-header">
            <div class="col-auto me-auto ">
                <div class="btn-group" role="group">
                    <button type="button" class="btn btnSearctList ${mode==1?'fw-semibold text-primary':'' }"
                        data-mode="1"> 전체 </button>
                    <button type="button" class="btn btnSearctList ${mode==2?'fw-semibold text-primary':'' }"
                        data-mode="2"> 답변완료 </button>
                    <button type="button" class="btn btnSearctList ${mode==3?'fw-semibold text-primary':'' }"
                        data-mode="3"> 미답변 </button>
                </div>
            </div>
            <div class="col-auto pt-2">
                <span>0개(0/0 페이지)</span>
            </div>
        </div>

        <table class="table table-borderless board-list">
            <colgroup>
                <col width="100">
                <col width="*">
                <col width="130">
                <col width="150">
            </colgroup>
            <thead class="table-light">
                <tr class="border-bottom1">
                    <th>답변상태</th>
                    <th>내용</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="dto" items="${list}" varStatus="status">
                    <tr class="item-basic-content border-bottom">

                    </tr>
                    <tr class="item-detail-content">
                        <td colspan="6" class="left p-0">
                            <div class="border-bottom p-2 px-3">
                                <div class="bg-light p-2">
                                    <div>
                                        <div class="p-2 pb-0 fw-semibold">
                                            ${dto.productName}(${dto.optionValue}/${dto.optionValue2})
                                        </div>

                                        <div class="row p-2">
                                            <div class="col-auto pt-0 ps-2 pe-1 score-star">
                                                <c:forEach var="n" begin="1" end="5">
                                                    <span class="item fs-6 ${dto.score>=n ? 'on' : ''}"><i
                                                            class="bi bi-star-fill"></i></span>
                                                </c:forEach>
                                            </div>
                                            <div class="col text-end">
                                                <span>${dto.review_date}</span>
                                                |<span class="deleteReview" data-num="${dto.num}">삭제</span>
                                                |<span class="answerReview" data-num="${dto.num}"
                                                    data-showReview="${dto.showReview}">답변</span>
                                            </div>
                                        </div>

                                        <div class="p-2">${dto.review}</div>

                                        <c:if test="${not empty dto.listFilename}">
                                            <div class="row gx-1 mt-2 mb-1 p-1">
                                                <c:forEach var="filename" items="${dto.listFilename}">
                                                    <div class="col-md-auto md-img">
                                                        <img class="border rounded"
                                                            src="${pageContext.request.contextPath}/uploads/review/${filename}">
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </c:if>

                                    </div>

                                    <c:if test="${not empty dto.answer}">
                                        <div class="p-2 pt-0 border-top">
                                            <div class="bg-light">
                                                <div class="p-3 pb-0">
                                                    <label class="text-bg-primary px-2"> 관리자 </label>
                                                    <label>${dto.answer_date}</label>
                                                </div>
                                                <div class="p-3 pt-1 pb-1 answer-content">${dto.answer}</div>
                                            </div>
                                        </div>
                                    </c:if>

                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="page-navigation">
            등록된 게시물이 없습니다.
        </div>

    </div>
 </div>

<div id="member-dialog" style="display: none;"></div>
