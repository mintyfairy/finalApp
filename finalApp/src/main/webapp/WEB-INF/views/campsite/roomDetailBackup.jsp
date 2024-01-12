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
		<div class="container-fluid booking pb-5 " data-wow-delay="0.1s">
            <div class="container">
            	<form name="siteSearchForm" id="siteSearchForm" >
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
			                            <button class="btn btn-primary2 w-100" type="button" onclick="searchSite()">Submit</button>
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
                        <h1 class="mb-4">Welcome to <span class="text-primary text-uppercase">Hotelier</span></h1>
                        <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet</p>
                        <div class="row g-3 pb-4">
                            <div class="col-sm-4 wow fadeIn" data-wow-delay="0.1s">
                                <div class="border rounded p-1">
                                    <div class="border rounded text-center p-4">
                                        <i class="fa fa-hotel fa-2x text-primary mb-2"></i>
                                        <h2 class="mb-1" data-toggle="counter-up">1234</h2>
                                        <p class="mb-0">Rooms</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 wow fadeIn" data-wow-delay="0.3s">
                                <div class="border rounded p-1">
                                    <div class="border rounded text-center p-4">
                                        <i class="fa fa-users-cog fa-2x text-primary mb-2"></i>
                                        <h2 class="mb-1" data-toggle="counter-up">1234</h2>
                                        <p class="mb-0">Staffs</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 wow fadeIn" data-wow-delay="0.5s">
                                <div class="border rounded p-1">
                                    <div class="border rounded text-center p-4">
                                        <i class="fa fa-users fa-2x text-primary mb-2"></i>
                                        <h2 class="mb-1" data-toggle="counter-up">1234</h2>
                                        <p class="mb-0">Clients</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        	<div class="slideshow-container " style="z-index: 55"  >
								
								<c:forEach var="vo" items="${listSiteFile}">
									<div class="mySlides fade">
									    <img src="${pageContext.request.contextPath}/uploads/site/${vo.fileName}" style="bottom : 0 ;width:100%;height: 450px; overflow:hidden;object-fit:cover" 
										onclick="imageViewer('${pageContext.request.contextPath}/uploads/site/${vo.fileName}');">
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
	                                <div class="slideshow-container" style="z-index: 55"  >
								
										<c:forEach var="vo" items="${Room32}">
											<div class="mySlides2">
											    <img src="${pageContext.request.contextPath}/uploads/room/${vo.fileName}" style="bottom : 0 ;width:100%;height: 450px; overflow:hidden;object-fit:cover" 
												>
											</div>
										</c:forEach>
			 							<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			  							<a class="next" onclick="plusSlides(1)">&#10095;</a>
									</div>
	                                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/campsite/room-1.jpg" alt="">
	                            <!-- 이미지구역 -->
	                                <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">${dto.price}원/Night</small>
	                            
	                            </div>
	                            <div class="p-4 mt-2">
	                                <div class="d-flex justify-content-between mb-3">
	                                    <h5 class="mb-0">${dto.detailname }</h5>
	                                    <div class="ps-2">
	                                        <small class="fa fa-star text-primary"></small>
	                                    </div>
	                                </div>
	                                <div class="d-flex mb-3">
	                                    <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>3 Bed</small>
	                                    <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>2 Bath</small>
	                                    <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
	                                </div>
	                                <p class="text-body mb-3">${dto.content}</p>
	                                <div class="d-flex justify-content-between">
	                                    <a class="btn btn-sm btn-primary2 rounded py-2 px-4" onclick="AJAXCART">장바구니에 넣기</a>
	                                    <a class="btn btn-sm btn-dark rounded py-2 px-4 " onclick="location.href ='${pageContext.request.contextPath}/site/book/${dto.detailnum}'">지금 바로 예약하기</a>
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
                    <div class="testimonial-item position-relative bg-white rounded overflow-hidden">
                        <p>후기 111111111111</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded" src="${pageContext.request.contextPath}/resources/images/campsite/testimonial-1.jpg" style="width: 45px; height: 45px;">
                            <div class="ps-3">
                                <h6 class="fw-bold mb-1">Client Name</h6>
                                <small>Profession</small>
                            </div>
                        </div>
                        <i class="fa fa-quote-right fa-3x text-primary position-absolute end-0 bottom-0 me-4 mb-n1"></i>
                    </div>
                    <div class="testimonial-item position-relative bg-white rounded overflow-hidden">
                        <p>후기 222222222222222222222</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded" src="${pageContext.request.contextPath}/resources/images/campsite/testimonial-2.jpg" style="width: 45px; height: 45px;">
                            <div class="ps-3">
                                <h6 class="fw-bold mb-1">Client Name</h6>
                                <small>Profession</small>
                            </div>
                        </div>
                        <i class="fa fa-quote-right fa-3x text-primary position-absolute end-0 bottom-0 me-4 mb-n1"></i>
                    </div>
                    <div class="testimonial-item position-relative bg-white rounded overflow-hidden">
                        <p>후기 33333333333333333333333333333333</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded" src="${pageContext.request.contextPath}/resources/images/campsite/testimonial-3.jpg" style="width: 45px; height: 45px;">
                            <div class="ps-3">
                                <h6 class="fw-bold mb-1">Client Name</h6>
                                <small>Profession</small>
                            </div>
                        </div>
                        <i class="fa fa-quote-right fa-3x text-primary position-absolute end-0 bottom-0 me-4 mb-n1"></i>
                    </div>
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

	