<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div style="background-image:url('/image/메인\ 배경.jpg'); background-repeat : no-repeat; background-size : cover;">
  <div>
    <div class="" style="width: 670px; height: 960px; background: #FFFFFF; border: 1px solid #AACDFF; box-shadow: 7px 7px 39px rgba(0, 104, 255, 0.25);  margin: auto; padding: 20px;">
        <div class="container">
            <div class="body-container" style="max-width: 850px;">	
              <div class="body-title">
                <h3 style="font-family: 'Noto Sans CJK KR';
                font-style: normal;
                font-weight: 700;
                font-size: 32px;
                line-height: 47px;
            
                color: #0068FF;
                justify-content: space-evenly;"><i class="bi bi-person-square"></i>회원가입</h3>
              </div>
              
                <div class="alert alert-info" role="alert">
                    <i class="bi bi-person-check-fill"></i> 캠브릿지와 함께 즐거운 캠핑생활을 시작해보세요.
                </div>
                      
              <div class="body-main">
          
                <form name="memberForm" method="post">
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="userId">아이디</label>
                    <div class="col-sm-10 userId-box">
                      <div class="row">
                        <div class="col-5 pe-1">
                          <input type="text" name="userId" id="userId" class="form-control" value="" 
                              placeholder="">
                        </div>
                        <div class="col-3 ps-1">
                         
                            <button type="button" class="btn btn-light" onclick="" style="width: 150px;">아이디중복검사</button>
                         
                        </div>
                      </div>
                     
                        <small class="form-control-plaintext help-block" style=" color: lightgrey">
                      * 아이디는 영숫자 5~10자 이내입니다.</small>
                      
                    </div>
                  </div>
                 
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="userPwd">패스워드</label>
                    <div class="col-sm-10">
                            <input type="password" name="userPwd" id="userPwd" class="form-control" autocomplete="off" placeholder="패스워드">
                            <small class="form-control-plaintext" style=" color: lightgrey">* 패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</small>
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label" for="userPwd2">패스워드 확인</label>
                        <div class="col-sm-10">
                            <input type="password" name="userPwd2" id="userPwd2" class="form-control" autocomplete="off" placeholder="패스워드 확인">
                            <small class="form-control-plaintext" style=" color: lightgrey">* 패스워드를 한번 더 입력해주세요.</small>
                        </div>
                    </div>
                 
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label" for="userName">이름</label>
                        <div class="col-sm-10">
                            <input type="text" name="userName" id="userName" class="form-control" value="">
                        </div>
                    </div>
                 
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label" for="birth">생년월일</label>
                        <div class="col-sm-10">
                            <input type="date" name="birth" id="birth" class="form-control" value="" placeholder="생년월일">
                            <small class="form-control-plaintext" style=" color: lightgrey">* 생년월일을 선택해주세요.</small>
                        </div>
                    </div>
                
                    <div class="row mb-3">
                      <label class="col-sm-2 col-form-label" for="selectEmail">이메일</label>
                      <div class="col-sm-10 row">
                    
                    <div class="col input-group">
                      <input type="text" name="email1" class="form-control" maxlength="30" value="" >
                        <span class="input-group-text p-1" style="border: none; background: none;">@</span>
                      <input type="text" name="email2" class="form-control" maxlength="30" value="">
                    </div>
                    <div class="col-3 pe-0">
                      <select name="selectEmail" id="selectEmail" class="form-select" onchange="changeEmail();">
                        <option value="">선 택</option>
                        <option value="naver.com" ${dto.email2=="naver.com" ? "selected" : ""}>naver.com</option>
                        <option value="gmail.com" ${dto.email2=="gmail.com" ? "selected" : ""}>gmail.com</option>
                        <option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected" : ""}>hanmail.net</option>
                        <option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected" : ""}>hotmail.com</option>
                        <option value="direct">직접입력</option>
                      </select>
                      </div>
          
                  </div>
                    
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label" for="tel1">전화번호</label>
                        <div class="col-sm-10 row">
                          <div class="col-sm-3 pe-1">
                            <select name="selectTel1" id="selectTel1" class="form-select" onchange="changeEmail();">
                              <option value="">선 택</option>
                               <option value="010" ${dto.tel1=="010 ? "selected" : ""}>010</option>
                               <option value="011" ${dto.tel1=="011 ? "selected" : ""}>011</option>
                               <option value="019" ${dto.tel1=="019 ? "selected" : ""}>019</option>
                               <option value="02" ${dto.tel1=="02 ? "selected" : ""}>02</option>
                            </select> 
                          </div>
                          <div class="col-sm-1 px-1" style="width: 2%;">
                            <p class="form-control-plaintext text-center">-</p>
                          </div>
                          <div class="col-sm-3 px-1">
                            <input type="text" name="tel2" id="tel2" class="form-control" value="" maxlength="4">
                          </div>
                          <div class="col-sm-1 px-1" style="width: 2%;">
                            <p class="form-control-plaintext text-center">-</p>
                          </div>
                          <div class="col-sm-3 ps-1">
                            <input type="text" name="tel3" id="tel3" class="form-control" value="" maxlength="4">
                          </div>
                        </div>
                    </div>
                
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label" for="zip">우편번호</label>
                        <div class="col-sm-5">
                           <div class="input-group">
                               <input type="text" name="zip" id="zip" class="form-control" placeholder="우편번호" value="" readonly>
                               <button class="btn btn-light" type="button" style="margin-left: 3px;" onclick="">우편번호 검색</button>
                             </div>
                    </div>
                    </div>
              
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label" for="addr1">주소</label>
                        <div class="col-sm-10">
                           <div>
                               <input type="text" name="addr1" id="addr1" class="form-control" placeholder="기본 주소" value="" readonly>
                             </div>
                           <div style="margin-top: 5px;">
                             <input type="text" name="addr2" id="addr2" class="form-control" placeholder="상세 주소" value="">
                      </div>
                    </div>
                    </div>
              
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label" for="agree">약관 동의</label>
                    <div class="col-sm-8" style="padding-top: 5px;">
                      <input type="checkbox" id="agree" name="agree"
                        class="form-check-input"
                        checked
                        style="margin-left: 0;"
                        onchange="form.sendButton.disabled = !checked">
                      <label class="form-check-label">
                        <a href="#" class="text-decoration-none">이용약관 및 개인정보 수집</a>에 동의합니다.
                      </label>
                    </div>
                    </div>
                     
                    <div class="row mb-3">
                        <div class="text-center">
                            <button type="button" name="sendButton" class="btn btn-primary" onclick="memberOk();"> 회원가입 <i class="bi bi-check2"></i></button>
                            <button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/';"> 가입취소<i class="bi bi-x"></i></button>
                      <input type="hidden" name="userIdValid" id="userIdValid" value="false">
                        </div>
                    </div>
                
                    <div class="row">
                    <p class="form-control-plaintext text-center"></p>
                    </div>
                </form>
          
              </div>
            </div>
          
        </div>
    </div>
  </div>  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</div>