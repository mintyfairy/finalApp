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


        <!-- Booking Start -->
        <div class="container-fluid booking pb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container">
                <div class="bg-white shadow" style="padding: 35px;">
                    <div class="row g-2">
                        <div class="col-md-12">
                            <div class="row g-2 mb-1">
                                <div class="col-md-3">	
                                    <div class="date" id="date1" data-target-input="nearest">
                                        <input type="date" class="form-control" name="startDate"
                                            placeholder="s" data-target="#date1"  />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="date" id="date2" data-target-input="nearest">
                                        <input type="date" class="form-control" name="endDate" 
                                        placeholder="Check out" data-target="#date2" />
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <select class="form-select" name="siteLocal">
                                        <option selected> 지역 </option>
                                        <option value="1">Adult 1</option>
                                        <option value="2">Adult 2</option>
                                        <option value="3">Adult 3</option>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <select class="form-select" name="siteEnvironment">
                                        <option selected> 환경 </option>
                                        <option value="1">Child 1</option>
                                        <option value="2">Child 2</option>
                                        <option value="3">Child 3</option>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <select class="form-select" name="siteCategory">
                                        <option selected> 분류 </option>
                                        <option value="1">Child 1</option>
                                        <option value="2">Child 2</option>
                                        <option value="3">Child 3</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                       
                    </div>
                    <div class="row g-2">
                        <div class="col-md-10">
							<div class="row g-2">
                                <div class="col-md-4 dropdown ">
									  <button type="button" class="form-select " data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
									    부대시설
									  </button>
									  <form class="dropdown-menu p-4 ">
									    <div class="mb-3">
									      <div class="form-check">
									        <input type="checkbox" class="form-check-input" id="dropdownCheck1">
									        <label class="form-check-label" for="dropdownCheck1">
									          Remember me
									        </label>
									      </div>
									      <div class="form-check">
									        <input type="checkbox" class="form-check-input" id="dropdownCheck2">
									        <label class="form-check-label" for="dropdownCheck2">
									          Remember me2
									        </label>
									      </div>
									      <div class="form-check">
									        <input type="checkbox" class="form-check-input" id="dropdownCheck3">
									        <label class="form-check-label" for="dropdownCheck3">
									          Remember me3
									        </label>
									      </div>
									    </div>
									  </form>
                                </div>
                               
                            
                                <div class="col-md-3">
                                     <input type="text" class="form-control" placeholder="가격">
                                </div> 
                                <div class="col-md-1 align-self-center">원 &emsp;~</div>
                                <div class="col-md-3">
                                     <input type="text" class="form-control" placeholder="가격">
                                </div>
                                <div class="col-md-1 align-self-center">원</div>
                            </div>
                        </div>
                         <div class="col-md-2">
                            <button class="btn btn-primary2 w-100">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Booking End -->


        <!-- Room Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-primary text-uppercase">캠브릿지</h6>
                    <h1 class="mb-5">HAppy <span class="text-primary text-uppercase">cAMpING</span></h1>
                </div>
              	  <!-- Testimonial Start -->
        <div class="container-xxl testimonial mt-5 py-5 bg-dark wow zoomIn" data-wow-delay="0.1s" style="margin-bottom: 90px;">
            <div class="container">
                <div class="owl-carousel testimonial-carousel py-5">
                    <div class="testimonial-item position-relative bg-white rounded overflow-hidden">
                        <p>광고업체 1</p>
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
                        <p>광고업체 222222222222222222222</p>
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
                        <p>광고업체 33333333333333333333333333333333</p>
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
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="room-item shadow rounded overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/campsite/room-1.jpg" alt="">
                                <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">$100/Night</small>
                            </div>
                            <div class="p-4 mt-2">
                                <div class="d-flex justify-content-between mb-3">
                                    <h5 class="mb-0">Junior Suite</h5>
                                    <div class="ps-2">
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                    </div>
                                </div>
                                <div class="d-flex mb-3">
                                    <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>3 Bed</small>
                                    <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>2 Bath</small>
                                    <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                </div>
                                <p class="text-body mb-3">Erat ipsum justo amet duo et elitr dolor, est duo duo eos lorem sed diam stet diam sed stet lorem.</p>
                                <div class="d-flex justify-content-between">
                                    <a class="btn btn-sm btn-primary2 rounded py-2 px-4" href="${pageContext.request.contextPath}/site/places/1">View Detail</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
        </div>
        <!-- Room End -->


      



        


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary2 btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
