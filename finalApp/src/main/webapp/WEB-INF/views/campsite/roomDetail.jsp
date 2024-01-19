<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->




        <!-- Page Header Start -->
        <div class="container-fluid page-header mb-5 p-0" style="background-image: url(${pageContext.request.contextPath}/resources/images/campsite/carousel-1.jpg);">
            <div class="container-fluid page-header-inner py-5">
                <div class="container text-center pb-5">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">캠핑장
					</h1>
                  <!--  
					<nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Rooms</li>
                        </ol>
                    </nav>
                   -->
                </div>
            </div>
        </div>
        <!-- Page Header End -->
		<div class="container-fluid booking pb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container">
            	<form name="roomSearchForm" id="roomSearchForm" >
	                <div class="bg-white shadow" style="padding: 35px;">
	                    <div class="row g-2">
	                        <div class="col-md-12">
	                            <div class="row g-2 mb-1">
	                                <div class="col-md-2">	
	                                    <div class="date" id="date1" data-target-input="nearest">
	                                        <input type="date" class="form-control" name="startDate" value="${dto.startDate }"
	                                            placeholder="Check in" data-target="#date1"  />
	                                    </div>
	                                </div>
	                                <div class="col-md-2">
	                                    <div class="date" id="date2" data-target-input="nearest">
	                                        <input type="date" class="form-control" name="endDate"  value="${dto.endDate }"
	                                        placeholder="Check out" data-target="#date2" />
	                                    </div>
	                                </div>
	                                <div class="col-md-2">
	                                     <input type="text" class="form-control" placeholder="최소가격" name="minFee" value="${dto.minFee}">
	                                </div> 
	                                <div class="col-md-auto align-self-center">원 &emsp;~</div>
	                                <div class="col-md-2">
	                                     <input type="text" class="form-control" placeholder="최대가격" name="maxFee" value="${dto.maxFee}">
	                                </div>
	                                <div class="col-md-auto align-self-center">원</div>
	                               	<div class="col-md-2">
			                            <button class="btn btn-primary2 w-100" type="button" onclick="searchRoom(${Sitedto.siteNum})">Submit</button>
			                        </div>
	                            </div>
	                        </div>
	                     </div>
	                  </div>
	                   
	                
                </form>
            </div>
        </div>

        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6">
                        <h6 class="section-title text-start text-primary text-uppercase">About Us</h6>
                        <h1 class="mb-4">Welcome to <span class="text-primary text-uppercase">${Sitedto.siteName}</span></h1>
                        <p class="mb-4">${Sitedto.introduce}</p>
                        <div class="row g-3 pb-4">
                            <div class="col-sm-4 wow fadeIn" data-wow-delay="0.1s">
                                <div class="border rounded p-1">
                                    <div class="border rounded text-center p-4">
                                        <i class="fa fa-hotel fa-2x text-primary mb-2"></i>
                                        <h2 class="mb-1" data-toggle="counter-up">${dataCount}</h2>
                                        <p class="mb-0">개의 방</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 wow fadeIn" data-wow-delay="0.3s">
                                <div class="border rounded p-1">
                                    <div class="border rounded text-center p-4">
                                        <i class="fa fa-star fa-2x text-primary mb-2"></i>
                                        <h2 class="mb-1" data-toggle="counter-up">${Sitedto.avgstar}</h2>
                                        <p class="mb-0">평점</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 wow fadeIn" data-wow-delay="0.5s">
                                <div class="border rounded p-1">
                                    <div class="border rounded text-center p-4">
                                        <i class="fa fa-users fa-2x text-primary mb-2"></i>
                                        <h2 class="mb-1" data-toggle="counter-up">${reviewCount}</h2>
                                        <p class="mb-0">개의 후기</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        	<div class="slideshow-container" style="z-index: 55"  >
								
								<c:forEach var="vo" items="${listSiteFile}">
									<div class="mySlides ">
									    <img src="${pageContext.request.contextPath}/uploads/site/${vo.fileName}" style="bottom : 0 ;width:100%;height: 450px; overflow:hidden;object-fit:cover" 
										>
									</div>
								</c:forEach>
	 							<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	  							<a class="next" onclick="plusSlides(1)">&#10095;</a>
							</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->



        <!-- Room Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-primary text-uppercase">캠브릿지</h6>
                    <h1 class="mb-5">HAppy <span class="text-primary text-uppercase">cAMpING</span></h1>
                </div>
                <div class="row g-4 DetailBox">
                	<c:forEach var="dto" items="${list}">
	                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
	                        <div class="room-item shadow rounded overflow-hidden">
	                            <div class="position-relative">
	                            <!-- 이미지구역 -->
	                                <div class="slideshow-container2 slide${dto.detailNum}" id="slideshow-container2" style="z-index: 55" data-slidenum="${dto.detailNum}" data-slideindex${dto.detailNum}="1">
										<c:forEach var="vo" items="${dto.listFile}" varStatus="status">
											<div class="mySlides${dto.detailNum}" style="display: ${status.index==0?'block':'none'};">
											    <img src="${pageContext.request.contextPath}/uploads/room/${vo}" style="bottom : 0 ;width:100%;height: 450px; overflow:hidden;object-fit:cover" 
												>
											</div>
										</c:forEach>
			 							<a class="prev" onclick="plusSlides2(-1,this)">&#10094;</a>
			  							<a class="next" onclick="plusSlides2(1,this)">&#10095;</a>
									</div>
	                            <!-- 이미지구역 -->
	                                <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">${dto.price}원/Night</small>
	                            
	                            </div>
	                            <div class="p-4 mt-2">
	                                <div class="d-flex justify-content-between mb-3">
	                                    <h5 class="mb-0">${dto.detailName }</h5>
	                                    <div class="ps-2">
	                                        <small class="fa fa-star text-primary">${dto.star}</small>
	                                    </div>
	                                </div>
	                                <div class="d-flex mb-3">
	                                    <small class="border-end me-3 pe-3"><i class="fa-solid fa-person text-primary me-2"></i>${dto.capacity}</small>
	                                    <small class="border-end me-3 pe-3"><i class="fa-solid fa-tent-arrow-left-right text-primary me-2"></i>${dto.area}</small>
	                                    <small><i class="fa-solid fa-grip-lines text-primary me-2"></i>${dto.floorString}</small>
	                                </div>
	                                <p class="text-body mb-3">${dto.content}</p>
	                                <div class="d-flex justify-content-between">
	                                    <a class="btn btn-sm btn-primary2 rounded py-2 px-4" onclick="ajaxCart('${empty sessionScope.member.memberIdx ?0:dto.detailNum}')">장바구니에 넣기</a>
	                                    <a class="btn btn-sm btn-dark rounded py-2 px-4 " onclick="gogoCart('${empty sessionScope.member.memberIdx ?0:dto.detailNum}')">지금 바로 예약하기</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
             
                    
                </div>
            </div>
        </div>
        <!-- Room End -->


        <!-- Testimonial Start -->
        <div class="container-xxl testimonial mt-5 py-5 bg-dark wow zoomIn" data-wow-delay="0.1s" style="margin-bottom: 90px;">
            <div class="container">
                <div class="owl-carousel testimonial-carousel py-5">
                    <c:forEach var="dto" items="${siteReviewList}">
	                    <div class="testimonial-item position-relative bg-white rounded overflow-hidden">
	                        <p>${dto.content }</p>
	                        <div class="d-flex align-items-center">
	                            <img class="img-fluid flex-shrink-0 rounded" src="${pageContext.request.contextPath}/uploads/siteReview/${dto.fileList}" style="width: 45px; height: 45px;">
	                            <div class="ps-3">
	                                <h6 class="fw-bold mb-1">${dto.userName }</h6>
	                                <small>${dto.score }</small>
	                            </div>
	                        </div>
	                        <i class="fa fa-quote-right fa-3x text-primary position-absolute end-0 bottom-0 me-4 mb-n1"></i>
	                    </div>
                    </c:forEach>
	                    
                </div>
            </div>
        </div>
        <!-- Testimonial End -->



        
<!-- 

						
 -->

        <!-- 달력... 안쓰기로 했다. -->
        <a href="#" class="btn btn-lg btn-primary2 btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
	
	
	
	<div class="modal hidden " id="periodModal" tabindex="-1" role="dialog" aria-labelledby="periodModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-xl">
	    <div class="modal-content">
	      
	     <div class="container">
	     		
  				
				<div class="row justify-content-center">
				<div class="col-md-6 text-center my-5">
				<h2 class="heading-section">예약 일자 선택</h2>
				</div>
				</div>
				
				<div class="row">
				<div class="col-md-12">
				<div class="calendar-section">
				<div class="row no-gutters">
				<div class="col-md-6">
				<div class="calendar calendar-first" id="calendar_first">
				<div class="calendar_header">
				<button class="switch-month switch-left">
				<i class="fa fa-chevron-left"></i>
				</button>
				<h2 class="calMode"></h2>
				<button class="switch-month switch-right">
				<i class="fa fa-chevron-right"></i>
				</button>
				</div>
				<div class="calendar_weekdays"><div>Sun</div><div>Mon</div><div>Tue</div><div>Wed</div><div>Thu</div><div>Fri</div><div>Sat</div></div>
				<div class="calendar_content">
				</div>
				</div>
				</div>
				<div class="col-md-6">
				<div class="calendar calendar-second" id="calendar_second">
				<div class="calendar_header">
				<button class="switch-month switch-left">
				<i class="fa fa-chevron-left"></i>
				</button>
				<h2>J</h2>
				<button class="switch-month switch-right">
				<i class="fa fa-chevron-right"></i>
				</button>
				</div>
				<div class="calendar_weekdays"><div>Sun</div><div>Mon</div><div>Tue</div><div>Wed</div><div>Thu</div><div>Fri</div><div>Sat</div></div>
				<div class="calendar_content">
					
				</div>
				</div>
				</div>
				</div> 
				<div class="modal-footer row">
					<div class="col">
						<button type="button" class="btn btn-primary2 calAJAXbtn "></button> 
					</div>
					<div class="col text-center">
						<button type="button" class="btn btn-primary2 defaultButton">오늘 날짜로</button> 	
					</div>
					<div class="col text-end">
	    		   		 <button type="button" class="btn btn-primary2 closeModal">닫기</button>
					</div>
	    			<div class="col-12 helpBOx"></div>
	    		</div>
				</div>
				</div>
				</div>
		</div>
	    </div>
	  </div>
	    		    
	</div>
<script>
function searchRoom(a) {
	const f= document.roomSearchForm;
	
	query=$('form[name=roomSearchForm]').serialize();
	console.log(query)
	f.action = "${pageContext.request.contextPath}/site/places/"+a;
	f.submit();
}
function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const sentinelNode = document.querySelector('.sentinel');
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
		    	} else if(jqXHR.status === 401) {
		    		return false;
		    	} else if(jqXHR.status === 402) {
		    		alert('권한이 없습니다.');
		    		return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	$.ajax(url, settings);
}
function ajaxCart(dnum){
	if (dnum==0){
		alert('로그인해주세요')
		return;
	}
	f=document.roomSearchForm
	sdate= f.startDate.value;
	edate= f.endDate.value;
	if (!f.startDate.value){
		alert('시작일도 선택해주세요')
		return;
	}
	if (!f.endDate.value){
		alert('종료일도 선택해주세요')
		return;
	}
	let today = new Date();
	let date1 = new Date(f.startDate.value);
	let date2 = new Date(f.endDate.value);
	if (date1<=today){
    	alert('오늘 날짜 이후를 입력하세요.');
		f.startDate.focus();
		return false;
    }
    if (date2<=date1){
    	alert('종료일은 시작일 이후여야합니다');
		f.endDate.focus();
		return false;
    }
    if(Math.ceil(Math.abs(date2 - date1) / (1000 * 60 * 60 * 24))>7){
    	alert('최대 7일까지 예약가능합니다.');
		return false;
    	
    }
	formData= $('form[name=roomSearchForm]').serialize();
	formData+='&detailNum='+dnum
 	let url="${pageContext.request.contextPath}/campsite/saveCart"
 	const fn = function(data) {
		if(confirm('카트에 담았습니다. 카트로 이동하시겠습니까?')){
			location.href="${pageContext.request.contextPath}/campsite/cart";
		}
	};
	ajaxFun(url, 'post', formData, 'json', fn);
}
function gogoCart(dnum){
	if (dnum==0){
		alert('로그인해주세요')
		return;
	}
	f=document.roomSearchForm
	sdate= f.startDate.value;
	edate= f.endDate.value;
	if (!f.startDate.value){
		alert('시작일을 선택해주세요')
		return;
	}
	if (!f.endDate.value){
		alert('종료일을 선택해주세요')
		return;
	}
	let today = new Date();
	let date1 = new Date(f.startDate.value);
	let date2 = new Date(f.endDate.value);
	if (date1<=today){
    	alert('오늘 날짜 이후를 입력하세요.');
		f.startDate.focus();
		return false;
    }
    if (date2<=date1){
    	alert('종료일은 시작일 이후여야합니다');
		f.endDate.focus();
		return false;
    }
    if(Math.ceil(Math.abs(date2 - date1) / (1000 * 60 * 60 * 24))>7){
    	alert('최대 7일까지 예약가능합니다.');
		return false;
    	
    }
	
	
	formData= $('form[name=roomSearchForm]').serialize();
	formData+='&detailNum='+dnum
	console.log(formData)
 	let url="${pageContext.request.contextPath}/campsite/saveCart"
 	const fn = function(data) {
		if(data.state=='GET'){
			location.href="${pageContext.request.contextPath}/campsite/cart";
		}
	};
	ajaxFun(url, 'get', formData, 'json', fn);
}
</script>
	