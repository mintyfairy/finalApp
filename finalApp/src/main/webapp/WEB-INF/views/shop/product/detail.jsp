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
    padding-top: 110px;
    margin-bottom: 140px;
}

.container .wrap {
    width: 1080px;
    margin: 0 auto;
}

.product_info_wrap {
    display: flex;
    justify-content: space-between;
}

.product_info_wrap .product_thumb {
    flex-basis: 50%;
}

.product_info_wrap .product_info {
    flex-basis: 47%;
}

.product_info .product_title {
    position: relative;
    border-bottom: 1px solid #efefef;
    margin-bottom: 28px;
}

.product_info .product_title .brand {
    display: block;
    font-size: 18px;
    margin-bottom: 5px;
}

.product_info .product_title .product_name {
    font-size: 28px;
    margin-bottom: 28px;
}

.product_info .product_title .like_btn {
    position: absolute;
    top: 0;
    right: 0;
}

.product_value {
    margin-bottom: 72px;
}

.product_value div {
    display: flex;
    align-items: center;
    flex-wrap: nowrap;
}

.product_value .product_price {
    margin-bottom: 14px;
}

.product_value div p:first-child {
    width: 130px;
    font-size: 13px;
    font-weight: bold;
}

.product_value .product_delivery {
    margin-bottom: 28px;
}

.product_value .product_delivery p:nth-child(2) {
    font-size: 13px;
}

.product_value .brand_name {
    color: #575757;
    font-size: 15px;
    margin-bottom: 15px;
}

.product_value .cnt_price {
    display: flex;
    justify-content: space-between;
    margin-bottom: 28px;
    padding-right: 30px;
    padding-bottom: 28px;
    border-bottom: 1px solid #efefef;
}

.product_value .cnt_price .qty input {
    width: 60px;
    height: 35px;
    padding-left: 15px;
    font-size: 13px;
    text-align: left;
    border-radius: 0;
    border: 1px solid #e6e6e6;
}

.product_value .cnt_price .qty button {
    width: 35px;
    height: 35px;
    font-size: 20px;
    cursor: pointer;
    background-color: #fff;
    border-radius: 0;
    border: 1px solid #e6e6e6;
}

.product_value .total_price {
    display: flex;
    justify-content: space-between;
}

.btn_list {
    display: flex;
}

.btn_list a {
    display: block;
    width: 138px;
    height: 60px;
    margin-left: 7px;
    color: black;
    text-align: center;
    line-height: 60px;
    background-color: #fff;
    border: 1px solid #efefef;
}

.btn_list a:first-child {
    width: 224px;
    color: #fff;
    background-color: #000;
    border: 1px solid black;
}

.detail_wrap {
    padding-top: 100px;
}

.detail_wrap .detail_tab .tab_list {
    display: flex;
}

.tab_list .tab_item {
    width: 25%;
}

.tab_list .tab_item a {
    display: block;
    height: 60px;
    font-size: 15px;
    color: #9f9f9f;
    line-height: 60px;
    text-align: center;
    border-bottom: 2px solid #e5e5e5;
}

.tab_list .tab_item a:active {
    color: #000;
    border-bottom: 2px solid #000;
}

.detail_wrap .detail_img {
    padding-top: 60px;
    padding-bottom: 100px;
    text-align: center;
}

.detail_review {
    margin-bottom: 100px;
    padding-top: 60px;
}

.detail_review .review_table table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
    word-wrap: break-word;
    word-break: keep-all;
    border-top: 1px solid black;
}

.detail_review .review_table table tbody tr {
    border-bottom: 1px solid #e5e5e5;
}

.detail_review .review_table table tbody tr td {
    padding: 15px 0;
    text-align: center;
    font-size: 13px;
    font-weight: bold;
}

.detail_review .review_write {
    position: relative;
    margin-top: 20px;
}

.detail_review .review_write a {
    position: absolute;
    right: 0;
    display: block;
    width: 108px;
    height: 38px;
    font-size: 13px;
    color: #000;
    text-align: center;
    line-height: 38px;
    border: 1px solid #231f20;
    background: #fff;
}

.detail_qna {
    margin-bottom: 100px;
    padding-top: 60px;
}

table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
    word-wrap: break-word;
    word-break: keep-all;
    border-top: 1px solid black;
}

.detail_qna .qna_table table tbody tr {
    border-bottom: 1px solid #e5e5e5;
}

.detail_qna .qna_table table tbody tr td {
    padding: 15px 0;
    text-align: center;
    font-size: 13px;
    font-weight: bold;
}

.detail_qna .qna_write {
    position: relative;
    margin-top: 20px;
}

.detail_qna .qna_write a {
    position: absolute;
    right: 0;
    display: block;
    width: 108px;
    height: 38px;
    font-size: 13px;
    color: #000;
    text-align: center;
    line-height: 38px;
    border: 1px solid #231f20;
    background: #fff;
}

.detail_as .as_table table tbody tr th {
    font-size: 16px;
    font-weight: 500;
    border-bottom: 1px solid #e6e6e6;
    background: #f9f9f9;
}

.detail_as .as_table table tbody tr td {
    padding: 45px 20px;
    font-size: 13px;
    border-bottom: 1px solid #e6e6e6;
}
</style>

<div class="container">
    <div class="wrap">
        <div class="product_info_wrap">
            <div class="product_thumb">
                <img src="https://via.placeholder.com/538x540" alt="thumb" width="538">
            </div>
            <div class="product_info">
                <div class="product_title">
                    <strong class="brand">브랜드명</strong>
                    <h3 class="product_name">제품명</h3>
                    <a href="#" class="like_btn">
                        <img src="../image/like_btn.png" alt="like_btn">
                    </a>
                </div>
                <div class="product_value">
                    <div class="product_price">
                        <p>판매가</p>
                        <h3 id="price">10,000원</h3>
                    </div>
                    <div class="product_delivery">
                        <p>배송비</p>
                        <p>총 결제금액이 50,000원 미만시 배송비 3,000원이 청구됩니다.</p>
                    </div>
                    <p class="brand_name">[브랜드명]상품명</p>
                    <div class="cnt_price">
                        <div class="qty">
                            <input id="qty_value" type="text" name="qty" value="1">
                            <button type="button" name="minus" id="minus_btn" onclick="minus()">-</button>
                            <button type="button" name="plus" id="plus_btn" onclick="plus()">+</button>
                        </div>
                        <h3>10,000원</h3>
                    </div>
                    <div class="total_price">
                        <h2>TOTAL</h2>
                        <h2 id="tot">10,000원</h2>
                    </div>
                </div>
                <div class="btn_list">
                    <a href="#">바로 구매하기</a>
                    <a href="#">장바구니</a>
                    <a href="#">관심상품</a>
                </div>
            </div>
        </div>

        <div class="detail_wrap">
            <div class="detail_tab">
                <ul class="tab_list">
                    <li class="tab_item"><a href="#">상세정보</a></li>
                    <li class="tab_item"><a href="#">상품후기0</a></li>
                    <li class="tab_item"><a href="#">상품문의0</a></li>
                    <li class="tab_item"><a href="#">배송/교환/반품/AS</a></li>
                </ul>
            </div>
            <div class="detail_img">
                <img src="https://via.placeholder.com/538x540" alt="detail_img">
            </div>
            <div class="detail_tab">
                <ul class="tab_list">
                    <li class="tab_item"><a href="#">상세정보</a></li>
                    <li class="tab_item"><a href="#">상품후기0</a></li>
                    <li class="tab_item"><a href="#">상품문의0</a></li>
                    <li class="tab_item"><a href="#">배송/교환/반품/AS</a></li>
                </ul>
            </div>
            <div class="detail_review">
                <div class="review_table">
                    <table summary="번호, 평점, 내용, 작성자, 작성일, 조회">
                        <colgroup>
                            <col width="40">
                            <col width="40">
                            <col width="*">
                            <col width="95">
                            <col width="110">
                            <col width="40">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td colspan="6">등록된 리뷰가 없습니다.</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="review_write">
                    <a href="#">글쓰기</a>
                </div>
            </div>
            <div class="detail_tab">
                <ul class="tab_list">
                    <li class="tab_item"><a href="#">상세정보</a></li>
                    <li class="tab_item"><a href="#">상품후기0</a></li>
                    <li class="tab_item"><a href="#">상품문의0</a></li>
                    <li class="tab_item"><a href="#">배송/교환/반품/AS</a></li>
                </ul>
            </div>
            <div class="detail_qna">
                <div class="qna_table">
                    <table summary="번호, 평점, 내용, 작성자, 작성일, 조회">
                        <colgroup>
                            <col width="40">
                            <col width="40">
                            <col width="*">
                            <col width="95">
                            <col width="110">
                            <col width="40">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td colspan="6">등록된 리뷰가 없습니다.</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="qna_write">
                    <a href="#">글쓰기</a>
                </div>
            </div>
            <div class="detail_tab">
                <ul class="tab_list">
                    <li class="tab_item"><a href="#">상세정보</a></li>
                    <li class="tab_item"><a href="#">상품후기0</a></li>
                    <li class="tab_item"><a href="#">상품문의0</a></li>
                    <li class="tab_item"><a href="#">배송/교환/반품/AS</a></li>
                </ul>
            </div>
            <div class="detail_as">
                <div class="as_table">
                    <table>
                        <colgroup>
                            <col width="250">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>배송안내</th>
                                <td>
                                    <b>제품 수령 후 구성품을 꼭 확인해주세요.</b>
                                    <br>"
                                    수령 후 30일이 지난 제품의 구성품 누락 및 오배송에 대한 문의는 당사에서 해결해 드리기 어려우니, "
                                    <br>"반드시 수령 후 구성품과 제품확인으로 문제가 없는지 확인해주시기 바랍니다."
                                    <br>
                                    <br>
                                    <b>제품 사진은 촬영시 카메라 플래쉬, 모니터에 따라 실제 제품 이미지와 다소 차이가 있을 수 있습니다.</b>
                                    <br>
                                    <br>
                                    <b>제품 실측 사이즈는 측정에 따라 실제 사이즈와 약간의 오차가 발생할 수 있습니다.</b>
                                    <br>
                                    <br>
                                    <b>주문상품 배송은 결제 확인 후 2~5일 정도 소요되며, 제품에 따라 배송일이 지연될 수 있음을 양해바랍니다.</b>
                                    <br>
                                    <br>
                                    <b>택배사는 로젠택배를 이용하고 있으며, 배송 및 택배 관련 문의는 1588-9988 로젠택배로 문의하시기 바랍니다.</b>
                                    <br>
                                    <br>
                                    <b>총 결제금액 50,000원 미만시 배송비 3,000원이 청구됩니다.(도서 산간지역 별도 적용)</b>
                                    <br>
                                    <br>
                                    <b>제품에 따라 묶음배송 불가상품이 있으며, 주문금액과 상관없이 별도 배송비가 부과될 수 있습니다.</b>
                                </td>
                            </tr>
                            <tr>
                                <th>교환/반품안내</th>
                                <td>
                                    <b>교환/반품이 가능한 경우</b>
                                    <br>
                                    "
                                    - 단순변심으로 인한 교환/반품은 왕복배송비를 고객님께서 지불해 주셔야 합니다."
                                    <br>
                                    "
                                    - 초기불량, 배송오류는 오캠몰에서 왕복 택배비를 부담하여 교환 및 반품처리 해드립니다."
                                    <br>
                                    <br>
                                    <b>교환/반품이 불가능한 경우</b>
                                    <br>
                                    "
                                    - 상품 수령 후 7일을 초과한 경우 변심 또는 제품 만에 대한 교환/반품은 불가합니다.(디자인,사이즈,실측정보,소재,색상,스크래치,실밥 등)"
                                    <br>
                                    "
                                    - 고객부주의 또는 제품 사용으로 상품훼손 등 상품 가치가 떨어진 경우 교환/반품이 불가합니다."
                                    <br>
                                    "
                                    - 브랜드 박스 개봉 및 훼손, 상품태그 제거 등 상품 가치가 떨어진 경우 교환/반품이 불가합니다."
                                    <br>
                                    "
                                    - 상품 초기불량 확인 후 고객의 과실에 의한 상품훼손 및 사용으로 상품 가치가 떨어진 경우 교환/반품이 불가합니다."
                                    <br>
                                    "- 세탁,수선 등 취급부주의로 인하여 상품이 훼손된 경우 교환/반품이 불가합니다."

                                </td>
                            </tr>
                            <tr>
                                <th>A/S안내</th>
                                <td>
                                    <b>제품 A/S는 반드시 손상된 제품이 입고되어야 A/S가 가능합니다.</b>
                                    <br>
                                    <br>
                                    <b>본사제품의 경우 제품 결함에 의한 수리는 제품 구입일로부터 30일간 무상 A/S를 받으실 수 있습니다.</b>
                                    <br>
                                    "그외 A/S는 모두 유상 수리로 진행되며, 일부 손상 정도에 따라 A/S가 불가할 수 있습니다."
                                    <br>
                                    <br>
                                    <b>자세한 A/S 정책은 AS라운지의 게시판을 참고해 주시기 바랍니다.</b>
                                </td>
                            </tr>
                            <tr>
                                <th>교환/반품/AS 주소</th>
                                <td>
                                    <b>주소 : (13550) 경기도 성남시 분당구 대왕판교로 361번길(궁내동) 오캠몰</b>
                                    <br>
                                    <b> 연락처 : 031-712-4371</b>
                                    <br>
                                    <br>
                                    " 교환/반품/AS접수는 로젠택배(1588-9988)로 전화하셔서 배송 운송장 번호 또는 개별접수로 반송해 주시면 됩니다."
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
let qty = document.getElementById("qty_value");
qty.value = 1;

function plus() {
    qty.value = parseInt(qty.value) + 1;
}

function minus() {
    if (parseInt(qty.value) > 1) {
        qty.value = parseInt(qty.value) - 1;
    }
}
</script>