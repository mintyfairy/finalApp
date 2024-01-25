<%@ page contentType="text/html; charset=UTF-8" %>
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

table {
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
  table-layout: fixed;
  word-wrap: break-word;
  word-break: keep-all;
  font-size: 12px;
  border-top: 1px solid black;
}

input,
button,
select,
textarea,
a {
  vertical-align: middle;
  font-size: 12px;
}

table thead th {
  padding: 15px 5px;
  color: #101010;
  border-bottom: 1px solid #e9e9e9;
  background: #f7f7f7;
}

table tbody tr th {
  padding: 0 15px;
  text-align: left;
  border-bottom: 1px solid #e9e9e9;
}

table tbody tr td {
  padding: 10px 0;
  border-bottom: 1px solid #e9e9e9;
}

table input[type=text] {
  width: 168px;
  height: 25px;
  line-height: 25px;
  padding: 0 5px;
  border: 1px solid #ddd;
  font-size: 15px;
}


.container {
  padding-top: 10px;
}

.container .wrap {
  width: 760px;
  margin: 0 auto;
}

.container .wrap h3 {
  margin-top: 40px;
  padding-bottom: 10px;
  font-size: 18px;
  font-weight: bold;
}

.detail_info {
  position: relative;
}

.detail_info label {
  position: absolute;
  top: 0;
  right: 0;
  font-size: 12px;
}

.detail_table tr th {
  font-size: 15px;
}

</style>

<div class="container">
  <div class="wrap">
    <h3 class="detail_info">
      예약번호 : ${dto.orderNum}
    </h3>
    
    <div class="detail_wrap">
        <table class="detail_table">
          <colgroup>
            <col width="160">
            <col width="*">
          </colgroup>
          <tbody>
         	 <tr>
              <th>아이디</th>
              <td><input type="text" name="userId" id="userId" value="${dto.userId}" readonly></td>
            </tr>
            <tr>
              <th>이름</th>
              <td><input type="text" name="userName" id="userName" value="${dto.userName}" readonly></td>
            </tr>
            <tr>
              <th>연락처</th>
              <td>
                <input type="text" name="tel" id="tel"  value="${dto.tel}" readonly>
              </td>
            </tr>
            <tr>
              <th>이메일</th>
              <td>
                <input type="text" name="email" id="email" value="${dto.email}" readonly>
              </td>
            </tr>
            <tr>
              <th>대여일</th>
              <td>
                <input type="text" name="start_date" id="start_date" value="${dto.start_date}" readonly>
              </td>
            </tr>
            <tr>
              <th>반납일</th>
              <td>
                <input type="text" name="end_date" id="end_date" value="${dto.end_date}" readonly>
              </td>
            </tr>
            <tr>
              <th>대여차량</th>
              <td>
                <input type="text" name="carName" id="carName" value="${dto.carName}" readonly>
              </td>
            </tr>
            <tr>
              <th>결제금액</th>
              <td>
                <input type="text" name="payment" id="payment"  value="${dto.payment}&nbsp;원" readonly>
              </td>
            </tr>
          </tbody>
        </table>
  	</div>
  </div>

  <div class="wrap">
    <h3 class="detail_info">
      <i class="fa-solid fa-user" style="font-size:15px;"></i>&nbsp;운전자 정보 
    </h3>
    <div class="detail_wrap">
        <table class="detail_table">
          <colgroup>
            <col width="160">
            <col width="*">
          </colgroup>
          <tbody>
            <tr>
              <th>운전자 이름</th>
              <td><input type="text" name="userName" id="userName" value="${dto.userName}" readonly></td>
            </tr>
            <tr>
              <th>연락처</th>
              <td>
                <input type="text" name="tel" id="tel"  value="${dto.tel}" readonly>
              </td>
            </tr>
            <tr>
              <th>이메일</th>
              <td>
                <input type="text" name="email" id="email" value="${dto.email}" readonly>
              </td>
            </tr>
            <tr>
              <th>생년월일</th>
              <td>
                <input type="text" name="birth" id="birth"  value="${dto.birth}" readonly>
              </td>
            </tr>
            <tr>
              <th>면허 취득일자</th>
              <td>
                <input type="text" name="licenseDate" id="licenseDate"  value="${dto2.licenseDate}" readonly>
                <c:if test="${empty dto2.licenseDate}">
                	<span style="color: red;">&nbsp;*&nbsp;운전자 정보를 등록하세요</span>
            	</c:if>
              </td>
            </tr>
            <tr>
              <th>동승운전자 여부</th>
              <td>
                <input type="text" name="addRider" id="addRider"  value="${dto2.addRider==1? 'O':'X'}" readonly>
              </td>
            </tr>
          </tbody>
        </table>
  	</div>
  </div>
  

 
</div>

