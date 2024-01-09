<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@charset "utf-8";

* {
    margin: 0;
    padding: 0;
    text-decoration: none;
    color: #333;
    box-sizing: border-box;
}

ol,
ul {
    list-style: none;
}

.container {
    margin-bottom: 60px;
    padding-top: 160px;
}

.container .wrap {
    width: 1080px;
    margin: 0 auto;
}

.container .wrap .title {
    text-align: center;
    margin-bottom: 40px;
}

.container .wrap .customer_wrap {
    height: 180px;
    margin-bottom: 70px;
    padding: 20px 0;
    border: 1px solid black;
}

.customer_list {
    display: flex;
    height: 100%;
}

.customer_list .customer_item {
    flex-basis: 33.33%;
    height: 100%;
    padding: 20px 13px 20px 0;  
    border-right: 1px solid #dedede;
}

.customer_list .customer_item:last-child {
    border: none;
}

.customer_list .customer_item h6 {
    margin-bottom: 20px;
    padding-left: 36px;
    font-weight: 600;
}

.detail_list {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-items: center;
}

.detail_list .detail_item a {
    position: relative;
    text-decoration: none;
    color: #8a8a8a;
    display: block;
    font-size: 12px;
    padding: 7px;
}

.detail_list .detail_item a::after {
    position: absolute;
    top: 10px;
    right: -2px;
    content: '';
    display: block;
    width: 2px;
    height: 11px;
    background-color: #8a8a8a;
}

.my_info {
    height: 212px;
    margin-bottom: 120px;
    padding: 20px 0;
    border: 1px solid #dedede;
}

.my_info .my_list {
    height: 100%;
    display: flex;
    flex-wrap: nowrap;
}

.my_info .my_list .my_item {
    height: 100%;
}

#identity {
    width: 732px;
    border-right: 1px dashed #dedede;
}

#my_value {
    width: 30%;
}

#my_wrap {
    height: 100%;
    display: flex;
    padding-left: 0;
}

#my_photo {
    width: 168px;
    height: 100%;
}

#personal {
    width: 561px;
    height: 100%;
    padding-left: 10px;
}

#my_value {
    width: 314px;   
}

#personal .name {
    font-size: 14px;
    margin-bottom: 6px;
}

#personal .name .modify {
    display: inline-block;
    border: 1px solid black;
    text-decoration: none;
    color: #333;
    font-size: 12px;
    padding: 2px 8px;
    text-align: center;
}

#personal p {
    font-size: 14px;
}

#my_value {
    padding: 20px;
}

#my_value p:first-child {
    font-weight: 600;
}

.latest {
    position: relative;
}

.latest h5 {
    font-weight: 600;
}

.latest a {
    position: absolute;
    top: 0;
    right: 0;
    text-decoration: none;
    color: #9a9a9a;
    font-size: 14px;
}

.my_table {
    margin-bottom: 50px;
}

.latest_order table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
    word-wrap: break-word;
    word-break: keep-all;
    font-size: 12px;
    text-align: center;
}

.latest_board table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
    word-wrap: break-word;
    word-break: keep-all;
    font-size: 12px;
    text-align: center;
}

.interested table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
    word-wrap: break-word;
    word-break: keep-all;
    font-size: 12px;
    text-align: center;
}
</style>

<div class="container">
    <div class="wrap">
        <h2 class="title">MY PAGE</h2>
        <div class="customer_wrap">
            <ul class="customer_list">
                <li id="shopping_info" class="customer_item">
                    <h6><i class="bi bi-info-circle-fill"></i> SHOPPING INFO</h6>
                    <ul class="detail_list">
                        <li class="detail_item">
                            <a href="#">주문내역</a>
                        </li>
                        <li class="detail_item">
                            <a href="#">쿠폰내역</a>
                        </li>
                        <li class="detail_item">
                            <a href="#">적립금내역</a>
                        </li>
                        <li class="detail_item">
                            <a href="#">예치금내역</a>
                        </li>
                        <li class="detail_item">
                            <a href="#">오늘본상품</a>
                        </li>
                        <li class="detail_item">
                            <a href="#">상품 보관함</a>
                        </li>
                        <li class="detail_item">
                            <a href="#">선물함</a>
                        </li>
                    </ul>
                </li>
                <li id="shopping_question" class="customer_item">
                    <h6><i class="bi bi-question-circle-fill"></i> SHOPPING QUESTION</h6>
                    <ul class="detail_list">
                        <li class="detail_item">
                            <a href="#">내 게시글 보기</a>
                        </li>
                        <li class="detail_item">
                            <a href="#">E-mail 문의</a>
                        </li>
                        <li class="detail_item">
                            <a href="#">1:1게시판</a>
                        </li>
                    </ul>
                </li>
                <li id="customer_info" class="customer_item">
                    <h6><i class="bi bi-emoji-smile-fill"></i> CUSTOMER INFO</h6>
                    <ul class="detail_list">
                        <li class="detail_item">
                            <a href="#">회원정보변경</a>
                        </li>
                        <li class="detail_item">
                            <a href="#">회원정보탈퇴신청</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="my_info">
            <ul class="my_list">
                <li id="identity" class="my_item">
                    <ul id="my_wrap">
                        <li id="my_photo">
                            <svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor"
                                class="bi bi-info-square" viewBox="0 0 16 16">
                                <path
                                    d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                <path
                                    d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
                            </svg>
                        </li>
                        <li id="personal">
                            <p class="name">이름[아이디]님
                                <a href="#" class="modify">수정</a>
                            </p>
                            <p>전화</p>
                            <p>이메일&nbsp;&nbsp;&nbsp;&nbsp;${메일주소}</p>
                            <p>주소</p>
                        </li>
                    </ul>
                </li>
                <li id="my_value" class="my_item">
                    <p>총 주문금액 : &nbsp;&nbsp;&nbsp;${total_price}</p>
                    <p>적립금 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bonus}</p>
                </li>
            </ul>
        </div>

        <div class="latest">
            <h5>최근 주문 정보</h5>
            <a href="#">+ MORE</a>
        </div>

        <div class="latest_order my_table">
            <table summary="주문일자, 상품명, 결제금액, 주문상세">
                <colgroup>
                    <col width="150">
                    <col width="*">
                    <col width="140">
                    <col width="140">
                </colgroup>
                <thead style="border-top: 1px solid black;">
                    <tr height="50">
                        <th>DATE</th>
                        <th>PRODUCT</th>
                        <th>COST</th>
                        <th>DETAIL</th>
                    </tr>
                </thead>
                <tbody>
                    <tr height="50">
                        <td colspan="4">주문내역 1건</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="latest">
            <h5>최근 등록 게시글</h5>
            <a href="#">+ MORE</a>
        </div>

        <div class="latest_board my_table">
            <table summary="등록일자, 제목, 게시판">
                <colgroup>
                    <col width="150">
                    <col width="*">
                    <col width="200">
                </colgroup>
                <thead style="border-top: 1px solid black;">
                    <tr height="50">
                        <th>DATE</th>
                        <th>SUBJECT</th>
                        <th>BOARD</th>
                    </tr>
                </thead>
                <tbody>
                    <tr height="50">
                        <td colspan="3">주문내역 1건</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="latest">
            <h5>관심 상품 정보</h5>
            <a href="#">+ MORE</a>
        </div>

        <div class="interested my_table">
            <table summary="등록일자, 상품명, 상품금액">
                <colgroup>
                    <col width="150">
                    <col width="*">
                    <col width="200">
                </colgroup>
                <thead style="border-top: 1px solid black;">
                    <tr height="50">
                        <th>DATE</th>
                        <th>PRODUCT</th>
                        <th>COST</th>
                    </tr>
                </thead>
                <tbody>
                    <tr height="50">
                        <td colspan="3">관심상품 1건</td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <div class="latest">
            <h5>장바구니 정보</h5>
            <a href="#">+ MORE</a>
        </div>

        <div class="cart my_table">
            <table summary="등록일자, 상품명, 상품금액">
                <colgroup>
                    <col width="150">
                    <col width="*">
                    <col width="200">
                </colgroup>
                <thead style="border-top: 1px solid black;">
                    <tr height="50">
                        <th>DATE</th>
                        <th>PRODUCT</th>
                        <th>COST</th>
                    </tr>
                </thead>
                <tbody>
                    <tr height="50">
                        <td colspan="3">관심상품 1건</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>