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
            	<form name="siteSearchForm" id="siteSearchForm" >
	                <div class="bg-white shadow" style="padding: 35px;">
	                    <div class="row g-2">
	                        <div class="col-md-12">
	                            <div class="row g-2 mb-1">
	                                <div class="col-md-3">	
	                                    <div class="date" id="date1" data-target-input="nearest">
	                                        <input type="date" class="form-control" name="startDate" value="${dto.startDate }"
	                                            placeholder="Check in" data-target="#date1"  />
	                                    </div>
	                                </div>
	                                <div class="col-md-3">
	                                    <div class="date" id="date2" data-target-input="nearest">
	                                        <input type="date" class="form-control" name="endDate"  value="${dto.endDate }"
	                                        placeholder="Check out" data-target="#date2" />
	                                    </div>
	                                </div>
	                                <div class="col-md-2">
	                                    <select class="form-select" name="siteLocal" >
	                                        <option value=""> 지역 </option>
	                                        <option value="1" ${dto.siteLocal==1?"selected":""}>서울</option>
	                                        <option value="2" ${dto.siteLocal==2?"selected":""}>인천</option>
	                                        <option value="3" ${dto.siteLocal==3?"selected":""}>경기</option>
	                                        <option value="4" ${dto.siteLocal==4?"selected":""}>강원</option>
	                                        <option value="5"  ${dto.siteLocal==5?"selected":""}>대전</option>
	                                        <option value="6"  ${dto.siteLocal==6?"selected":""}>세종</option>
	                                        <option value="7"  ${dto.siteLocal==7?"selected":""}>충북</option>
	                                        <option value="8"  ${dto.siteLocal==8?"selected":""}>충남</option>
	                                        <option value="9"  ${dto.siteLocal==9?"selected":""}>대구</option>
	                                        <option value="10"  ${dto.siteLocal==10?"selected":""}>울산</option>
	                                        <option value="11"  ${dto.siteLocal==11?"selected":""}>경북</option>
	                                        <option value="12"  ${dto.siteLocal==12?"selected":""}>경남</option>
	                                        <option value="13"  ${dto.siteLocal==13?"selected":""}>전북</option>
	                                        <option value="14"  ${dto.siteLocal==14?"selected":""}>전남</option>
	                                        <option value="15"  ${dto.siteLocal==15?"selected":""}>제주</option>
	                                    </select>
	                                </div>
	                                <div class="col-md-2">
	                                    <select class="form-select" name="siteEnvironment" >
	                                        <option value=""> 환경 </option>
	                                        <option value="1" ${dto.siteEnvironment==1?"selected":""}>산</option>
	                                        <option value="2" ${dto.siteEnvironment==2?"selected":""}>강</option>
	                                        <option value="3" ${dto.siteEnvironment==3?"selected":""}>바다</option>
	                                        <option value="4" ${dto.siteEnvironment==4?"selected":""}>도심</option>
	                                        <option value="5" ${dto.siteEnvironment==5?"selected":""}>계곡</option>
	                                        <option value="6" ${dto.siteEnvironment==6?"selected":""}>호수</option>
	                                        <option value="7" ${dto.siteEnvironment==7?"selected":""}>평야</option>
	                                        <option value="8" ${dto.siteEnvironment==8?"selected":""}>기타</option>
	                                    </select>
	                                </div>
	                                <div class="col-md-2">
	                                    <select class="form-select" name="siteCategory">
	                                        <option value=""> 분류 </option>
	                                        <option value="1" ${dto.siteCategory==1?"selected":""}>오토캠핑</option>
	                                        <option value="2" ${dto.siteCategory==2?"selected":""}>글램핑</option>
	                                        <option value="3" ${dto.siteCategory==3?"selected":""}>카라반</option>
	                                        <option value="4" ${dto.siteCategory==4?"selected":""}>방갈로</option>
	                                        <option value="5" ${dto.siteCategory==5?"selected":""}>차박</option>
	                                    </select>
	                                </div>
	                            </div>
	                        </div>
	                       
	                    </div>
	                    <div class="row g-2">
	                        <div class="col-md-10">
								<div class="row g-2">
	                                <div class="col-md-3 dropdown ">
										  <button type="button" class="form-select " data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
										    부대시설
										  </button>
										  <div class="dropdown-menu p-4 ">
										    <div class="mb-3">
										      <div class="form-check">
										        <input type="checkbox" name="siteOption" class="form-check-input" id="dropdownCheck1"  value=${dto.siteOption[0]==1 ? "'1' checked='checked'" : "'0'" }>
										        <label class="form-check-label" for="dropdownCheck1">
										          전기
										        </label>
										      </div>
										      <div class="form-check">
										        <input type="checkbox" name="siteOption" class="form-check-input" id="dropdownCheck2" value=${dto.siteOption[1]==1 ? "'1' checked='checked'" : "'0'" }>
										        <label class="form-check-label" for="dropdownCheck2">
										          와이파이
										        </label>
										      </div>
										      <div class="form-check">
										        <input type="checkbox" name="siteOption" class="form-check-input" id="dropdownCheck3" value=${dto.siteOption[2]==1 ? "'1' checked='checked'" : "'0'" }>
										        <label class="form-check-label" for="dropdownCheck3">
										          비비큐 장비
										        </label>
										      </div>
										      <div class="form-check">
										        <input type="checkbox" name="siteOption" class="form-check-input" id="dropdownCheck4" value=${dto.siteOption[3]==1 ? "'1' checked='checked'" : "'0'" }>
										        <label class="form-check-label" for="dropdownCheck3">
										          운동장
										        </label>
										      </div>
										      <div class="form-check">
										        <input type="checkbox" name="siteOption" class="form-check-input" id="dropdownCheck5" value=${dto.siteOption[4]==1 ? "'1' checked='checked'" : "'0'" }>
										        <label class="form-check-label" for="dropdownCheck3">
										          화장실
										        </label>
										      </div>
										      <div class="form-check">
										        <input type="checkbox" name="siteOption" class="form-check-input" id="dropdownCheck6" value=${dto.siteOption[5]==1 ? "'1' checked='checked'" : "'0' " }>
										        <label class="form-check-label" for="dropdownCheck3">
										          샤워장
										        </label>
										      </div>
										    </div>
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
	                                <div class="col-md-auto">
	                                     <input type="text" class="form-control" placeholder="캠핑장 이름 검색" name="siteKwd"  value="${dto.siteKwd}">
	                                </div>
	                            </div>
	                        </div>
	                         <div class="col-md-2">
	                            <button class="btn btn-primary2 w-100" type="button" onclick="searchSite()">Submit</button>
	                        </div>
	                    </div>
	                </div>
                </form>
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
                	<
                	<c:forEach var="dto" items="${Adlist}">
	                    <div class="testimonial-item position-relative bg-white rounded overflow-hidden"  title="이 캠핑장은 광고업체입니다.">
	                        <p style="height:100%;overflow: hidden;text-overflow: clip;white-space:nowrap;">${dto.introduce}</p>
	                        <div class="d-flex align-items-center adclickdiv" data-siteNum='${dto.siteNum }' onclick="location.href ='${pageContext.request.contextPath}/site/places/${dto.siteNum}'">
	                            <img class="img-fluid flex-shrink-0 rounded" src="${pageContext.request.contextPath}/uploads/site/${dto.thumbnail}" alt="" style="width: 45px; height: 45px;">
	                            <div class="ps-3">
	                                <h6 class="fw-bold mb-1">${dto.siteName}</h6>
	                                <img class="img-fluid flex-shrink-0 rounded" src="${pageContext.request.contextPath}/resources/images/campsite/adMark.png" alt="" style="width: 30px; height: 19px;">
	                                <small>${dto.addr1}</small>
	                            </div>
	                        </div>
	                        <i class="fa fa-quote-right fa-3x text-primary position-absolute end-0 bottom-0 me-4 mb-n1"></i>
	                    </div>
	                </c:forEach>
                    
                </div>
            </div>
        </div>
        
        
        <!-- Testimonial End
       			<div class="row g-4 " >${dataCount}개 검색 완료 </div> -->
                <div class="row g-4 list-content" data-pageNo="0" data-totalPage="0"> </div>
                
                <div class="sentinel" data-loading="false"></div> 
                    
               
            </div>
        </div>
        <!-- Room End -->
                    <!-- 
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s"> <div class="room-item shadow rounded overflow-hidden">
                            <div class="p-4 mt-2"><div class="d-flex justify-content-between mb-3">
                                    <h5 class="mb-0">Junior Suite</h5>
                                    <div class="ps-2">
                                        <small class="fa fa-star text-primary">4</small> 
                                    </div></div> <div class="d-flex mb-3">
                                    
                                    <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>3 Bed</small>
                                    <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>2 Bath</small>
                                    <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                   
                                </div>
                                <p class="text-body mb-3">${dto.siteLocal}</p>
                                <div class="d-flex justify-content-between">
                                    <a class="btn btn-sm btn-primary2 rounded py-2 px-4" href="${pageContext.request.contextPath}/site/places/1">View Detail</a>
                                </div>
                            </div>
                        </div>
                    </div>
                      -->
                    


      



        


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary2 btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        <script>
        console.log('aa')
        
        document.querySelector('.adclickdiv').addEventListener('click', function(){
        	console.log(this.data('adclickdiv'))
        	location.href="${pageContext.request.contextPath}/site/places/"+this.data('siteNum')
        });
        function login() {
        	location.href = '${pageContext.request.contextPath}/member/login';
        }
        function searchSite() {
        	const f= document.siteSearchForm;
        	let list=f.siteOption;
        	if(f.startDate.value ||f.endDate.value){
        		if (!f.startDate.value){
        			alert('시작일을 선택해주세요')
        			return;
        		}
        		if (!f.endDate.value){
        			alert('종료일을 선택해주세요')
        			return;
        		}
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
        	for(var i=0; i<list.length; i++){
        		if(list[i].checked){
        			list[i].value="1";
        		}else{
        			list[i].value="0";
        		}
        		list[i].checked=true;
        	}
        	query=$('form[name=siteSearchForm]').serialize();
        	console.log(query)
        	f.action = "${pageContext.request.contextPath}/site/list";
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
        				sentinelNode.setAttribute('data-loading', 'true');
        				
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
        	
        	if(file) {
        		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
        		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
        	}
        	
        	$.ajax(url, settings);
        }

        function loadContent(page) {
        	let formData = $('form[name=siteSearchForm]').serialize();
        	formData+="&pageNo="+page;
        	let siteOptionList= document.siteSearchForm.querySelectorAll('[name=siteOption]')
        	let list="";
        	for (let item of siteOptionList){
        		list+=item.value
        	}
        	formData+="&siteOptionList="+list;
        	let url = '${pageContext.request.contextPath}/site/scroll';
        	console.log(formData)
        	const fn = function(data) {
        		
        		addNewContent(data);
        	};
        	ajaxFun(url, 'post', formData, 'json', fn);
        }

        function addNewContent(data) {
        	const listNode = document.querySelector('.list-content');
        	const sentinelNode = document.querySelector('.sentinel'); // 센터널 노드(화면의 마지막인지 감시할 마지막 노드)
        	

        	let dataCount = data.dataCount;
        	let pageNo = data.pageNo;
        	let total_page = data.total_page;
        	
        	listNode.setAttribute('data-pageNo', pageNo);
        	listNode.setAttribute('data-totalPage', total_page);
        	
        	sentinelNode.style.display = 'none';
        	
        	if(parseInt(dataCount) === 0) {
        		listNode.innerHTML = '';
        		return;
        	}
        	console.log(data)
        	console.log(data.list)
        	let htmlText="";
        	if (data.list==null) {
        		htmlText += '  <h1 class="mb-5 text-center "> 검색결과가 없습니다</h1>';
        		listNode.insertAdjacentHTML('beforeend', htmlText);
        		return;
        	}
        	let count=data.dataCount
        	for(let item of data.list) {
        		let siteNum = item.siteNum;
        		let siteName = item.siteName;
        		let introduce = item.introduce;
        		let star = item.avgstar;
        		let thumbnail = item.thumbnail;
        		let query="?";
        		console.log(data.dto)
        		if (data.dto.startDate!=null){
        			query+="startDate="+data.dto.startDate;
        			query+="&endDate="+data.dto.endDate;
        		}
        		if (data.dto.minFee!=null){
        			query+="&minFee="+data.dto.minFee;
        		}
        		if (data.dto.maxFee!=null){
        			query+="&maxFee="+data.dto.maxFee;
        		}
        		htmlText =  '<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s"> <div class="room-item shadow rounded overflow-hidden"><div class="position-relative">';
        		htmlText += '  <img class="img-fluid" src="${pageContext.request.contextPath}/uploads/site/'+thumbnail+'" alt="">';
        		htmlText += '        </div><div class="p-4 mt-2"><div class="d-flex justify-content-between mb-3">';
        		htmlText += '        <h5 class="mb-0">'+siteName+'</h5>';
        		htmlText += '     <div class="ps-2">';
        		htmlText += ' 	<small class="fa fa-star text-primary">'+star+'</small>';
        		htmlText += '	</div></div> <div class="d-flex mb-3"></div>';
        		htmlText += '	<div class="text-body container" style="height:85px ">'+introduce+'</div>';
        		htmlText += '	<div class="d-flex justify-content-between">';
        		htmlText += '	<a class="btn btn-sm btn-primary2 rounded py-2 px-4" href="${pageContext.request.contextPath}/site/places/'+siteNum+query+'">View Detail</a>';
        		htmlText += ' </div></div></div> </div>';
        		
        		// 인써트 어제이슨트 함수로 마지막에 HTML 추가
        		listNode.insertAdjacentHTML('beforeend', htmlText);
        	}
        	
        	if(pageNo < total_page) {
        		sentinelNode.setAttribute('data-loading', 'false');
        		sentinelNode.style.display = 'block';
        		
        		io.observe(sentinelNode);
        	}
        }

        // 인터섹션 업저버를 이용한 무한 스크롤
        const sentinelNode = document.querySelector('.sentinel'); // 센터널 노드(화면의 마지막인지 감시할 마지막 노드)
        const ioCallback = (entries, io) => {
          entries.forEach((entry) => {
            if (entry.isIntersecting) { // 관찰 대상의 교차(겹치는)상태(Boolean) : 화면에 보이면
            	
            	// 현재 페이지가 로딩중이면 빠져 나감
            	let loading = sentinelNode.getAttribute('data-loading');
            
            	if(loading !== 'false') {
            		return;
            	}

            	io.unobserve(entry.target); // 기존 관찰하던 요소는 더 이상 관찰하지 않음
            
            	const listNode = document.querySelector('.list-content');
        		let pageNo = parseInt(listNode.getAttribute('data-pageNo'));
        		let total_page = parseInt(listNode.getAttribute('data-totalPage'));
        		if(pageNo === 0 || pageNo < total_page) {
        			pageNo++;
        			loadContent(pageNo);
        		}
            }
          });
        };

        const io = new IntersectionObserver(ioCallback); // 관찰자 초기화
        io.observe(sentinelNode); // 관찰할 대상(요소) 등록

        </script>
    </div>