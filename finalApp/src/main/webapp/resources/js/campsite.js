(function ($) {
    "use strict";
	
	var first;
	var second;
	var period=0;
    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Initiate the wowjs
    new WOW().init();
    
    
    // Dropdown on mouse hover
    const $dropdown = $(".dropdown");
    const $dropdownToggle = $(".dropdown-toggle");
    const $dropdownMenu = $(".dropdown-menu");
    const showClass = "show";
    
    $(window).on("load resize", function() {
        if (this.matchMedia("(min-width: 992px)").matches) {
            $dropdown.hover(
            function() {
                const $this = $(this);
                $this.addClass(showClass);
                $this.find($dropdownToggle).attr("aria-expanded", "true");
                $this.find($dropdownMenu).addClass(showClass);
            },
            function() {
                const $this = $(this);
                $this.removeClass(showClass);
                $this.find($dropdownToggle).attr("aria-expanded", "false");
                $this.find($dropdownMenu).removeClass(showClass);
            }
            );
        } else {
            $dropdown.off("mouseenter mouseleave");
        }
    });
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Facts counter
    $('[data-toggle="counter-up"]').counterUp({
        delay: 10,
        time: 2000
    });


  

    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        margin: 25,
        dots: false,
        loop: true,
        nav : true,
        navText : [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsive: {
            0:{
                items:1
            },
            768:{
                items:2
            }
        }
    });
    $(".DetailBox").on("click", ".btnDetail", function(){
		console.log("??")
	})
	//달력 스크립트
	
	$( document ).ready(function() {
		function c(passed_month, passed_year, calNum) {
			var calendar = calNum == 0 ? calendars.cal1 : calendars.cal2;
			makeWeek(calendar.weekline);
			calendar.datesBody.empty();
			var calMonthArray = makeMonthArray(passed_month, passed_year);
			var r = 0;
			var u = false;
			while(!u) {
				if(daysArray[r] == calMonthArray[0].weekday) { u = true } 
				else { 
					calendar.datesBody.append('<div class="blank"></div>');
					r++;
				}
			} 
			for(var cell=0;cell<42-r;cell++) { // 42 date-cells in calendar
				if(cell >= calMonthArray.length) {
					calendar.datesBody.append('<div class="blank"></div>');
				} else {
					var shownDate = calMonthArray[cell].day;
					// Later refactiroing -- iter_date not needed after "today" is found
					var iter_date = new Date(passed_year,passed_month,shownDate); 
					if ( 
						(
							( shownDate != today.getDate() && passed_month == today.getMonth() ) 
							|| passed_month != today.getMonth()
						) 
							&& iter_date < today) {						
						var m = '<div class="past-date">';
					}else if (
								(
									1>4 
								)
							&& iter_date > today){
						var m = '<div class="choosed-date">';
					} else {
						var m = checkToday(iter_date)?'<div class="today">':"<div>";
					}
					calendar.datesBody.append(m + shownDate + "</div>");
				}
			}

			// var color = o[passed_month];
			calendar.calHeader.find("h2").text(passed_year+" "+i[passed_month]);
						//.css("background-color",color)
						//.find("h2").text(i[passed_month]+" "+year);

			// find elements (dates) to be clicked on each time
			// the calendar is generated
			
			//clickedElement = bothCals.find(".calendar_content").find("div");
			var clicked = false;
			selectDates(selected);

			clickedElement = calendar.datesBody.find('div');
			clickedElement.on("click", function(){
				clicked = $(this);
				if (clicked.hasClass('past-date')) { return; }
				//if (clicked.hasClass('choosed-date')) { return; }
				var whichCalendar = calendar.name;
				//console.log(whichCalendar);
				// Understading which element was clicked;
				// var parentClass = $(this).parent().parent().attr('class');
				if (firstClick && secondClick) {
					thirdClicked = getClickedInfo(clicked, calendar);
					var firstClickDateObj = new Date(firstClicked.year, 
												firstClicked.month, 
												firstClicked.date);
					var secondClickDateObj = new Date(secondClicked.year, 
												secondClicked.month, 
												secondClicked.date);
					var thirdClickDateObj = new Date(thirdClicked.year, 
												thirdClicked.month, 
												thirdClicked.date);
					if (secondClickDateObj > thirdClickDateObj
						&& thirdClickDateObj > firstClickDateObj) {
						secondClicked = thirdClicked;
						// then choose dates again from the start :)
						bothCals.find(".calendar_content").find("div").each(function(){
							$(this).removeClass("selected");
						});
						selected = {};
						selected[firstClicked.year] = {};
						selected[firstClicked.year][firstClicked.month] = [firstClicked.date];
						selected = addChosenDates(firstClicked, secondClicked, selected);
					} else { // reset clicks
						selected = {};
						firstClicked = [];
						secondClicked = [];
						firstClick = false;
						secondClick = false;
						bothCals.find(".calendar_content").find("div").each(function(){
							$(this).removeClass("selected");
						});	
					}
				}
				if (!firstClick) {
					firstClick = true;
					firstClicked = getClickedInfo(clicked, calendar);
					selected[firstClicked.year] = {};
					selected[firstClicked.year][firstClicked.month] = [firstClicked.date];
				} else {
					//console.log('second click');
					secondClick = true;
					secondClicked = getClickedInfo(clicked, calendar);
					//console.log(secondClicked);

					// what if second clicked date is before the first clicked?
					var firstClickDateObj = new Date(firstClicked.year, 
												firstClicked.month, 
												firstClicked.date);
					var secondClickDateObj = new Date(secondClicked.year, 
												secondClicked.month, 
												secondClicked.date);

					if (firstClickDateObj > secondClickDateObj) {

						var cachedClickedInfo = secondClicked;
						secondClicked = firstClicked;
						firstClicked = cachedClickedInfo;
						selected = {};
						selected[firstClicked.year] = {};
						selected[firstClicked.year][firstClicked.month] = [firstClicked.date];

					} else if (firstClickDateObj.getTime() ==
								secondClickDateObj.getTime()) {
						selected = {};
						firstClicked = [];
						secondClicked = [];
						firstClick = false;
						secondClick = false;
						$(this).removeClass("selected");
					}


					// add between dates to [selected]
					selected = addChosenDates(firstClicked, secondClicked, selected);
				}
				// console.log(selected);
				selectDates(selected);
			});			

		}
		function selectDates(selected) {
			if (!$.isEmptyObject(selected)) {
				var dateElements1 = datesBody1.find('div');
				var dateElements2 = datesBody2.find('div');

				function highlightDates(passed_year, passed_month, dateElements){
					if (passed_year in selected && passed_month in selected[passed_year]) {
						var daysToCompare = selected[passed_year][passed_month];
						// console.log(daysToCompare);
						for (var d in daysToCompare) {
							dateElements.each(function(index) {
								if (parseInt($(this).text()) == daysToCompare[d]) {
									$(this).addClass('selected');
								}
							});	
						}
						
					}
				}

				highlightDates(year, month, dateElements1);
				highlightDates(nextYear, nextMonth, dateElements2);
			}
		}

		function makeMonthArray(passed_month, passed_year) { // creates Array specifying dates and weekdays
			var e=[];
			for(var r=1;r<getDaysInMonth(passed_year, passed_month)+1;r++) {
				e.push({day: r,
						// Later refactor -- weekday needed only for first week
						weekday: daysArray[getWeekdayNum(passed_year,passed_month,r)]
					});
			}
			return e;
		}
		function makeWeek(week) {
			week.empty();
			for(var e=0;e<7;e++) { 
				week.append("<div>"+daysArray[e].substring(0,3)+"</div>") 
			}
		}

		function getDaysInMonth(currentYear,currentMon) {
			return(new Date(currentYear,currentMon+1,0)).getDate();
		}
		function getWeekdayNum(e,t,n) {
			return(new Date(e,t,n)).getDay();
		}
		function checkToday(e) {
			var todayDate = today.getFullYear()+'/'+(today.getMonth()+1)+'/'+today.getDate();
			var checkingDate = e.getFullYear()+'/'+(e.getMonth()+1)+'/'+e.getDate();
			return todayDate==checkingDate;

		}
		function getAdjacentMonth(curr_month, curr_year, direction) {
			var theNextMonth;
			var theNextYear;
			if (direction == "next") {
				theNextMonth = (curr_month + 1) % 12;
				theNextYear = (curr_month == 11) ? curr_year + 1 : curr_year;
			} else {
				theNextMonth = (curr_month == 0) ? 11 : curr_month - 1;
				theNextYear = (curr_month == 0) ? curr_year - 1 : curr_year;
			}
			return [theNextMonth, theNextYear];
		}
		function b() {
			today = new Date;
			year = today.getFullYear();
			month = today.getMonth();
			var nextDates = getAdjacentMonth(month, year, "next");
			nextMonth = nextDates[0];
			nextYear = nextDates[1];
		}

		var e=480;

		var today;
		var year,
			month,
			nextMonth,
			nextYear;

		//var t=2013;
		//var n=9;
		var r = [];
		var i = ["1월","2월","3월","4월","5월",
				"6월","7월","8월","9월","10월",
				"11월","12월"];
		var daysArray = ["일","월","화",
						"수","목","금","토"];
		var o = ["#16a085","#1abc9c","#c0392b","#27ae60",
				"#FF6860","#f39c12","#f1c40f","#e67e22",
				"#2ecc71","#e74c3c","#d35400","#2c3e50"];
		
		var cal1=$("#calendar_first");
		var calHeader1=cal1.find(".calendar_header");
		var weekline1=cal1.find(".calendar_weekdays");
		var datesBody1=cal1.find(".calendar_content");

		var cal2=$("#calendar_second");
		var calHeader2=cal2.find(".calendar_header");
		var weekline2=cal2.find(".calendar_weekdays");
		var datesBody2=cal2.find(".calendar_content");

		var bothCals = $(".calendar");

		var switchButton = bothCals.find(".calendar_header").find('.switch-month');

		var calendars = { 
						"cal1": { 	"name": "first",
									"calHeader": calHeader1,
									"weekline": weekline1,
									"datesBody": datesBody1 },
						"cal2": { 	"name": "second",
									"calHeader": calHeader2,
									"weekline": weekline2,
									"datesBody": datesBody2	}
						}
		

		var clickedElement;
		var firstClicked,
			secondClicked,
			thirdClicked;
		var firstClick = false;
		var secondClick = false;	
		var selected = {};

		b();
		var defaultYear= today.getFullYear(),defaultMonth= today.getMonth();
		c(month, year, 0);
		c(nextMonth, nextYear, 1);
		switchButton.on("click",function() {
			var clicked=$(this);
			var generateCalendars = function(e) {
				var nextDatesFirst = getAdjacentMonth(month, year, e);
				var nextDatesSecond = getAdjacentMonth(nextMonth, nextYear, e);
				month = nextDatesFirst[0];
				year = nextDatesFirst[1];
				nextMonth = nextDatesSecond[0];
				nextYear = nextDatesSecond[1];

				c(month, year, 0);
				c(nextMonth, nextYear, 1);
			};
			if(clicked.attr("class").indexOf("left")!=-1) { 
				generateCalendars("previous");
			} else { generateCalendars("next"); }
			clickedElement = bothCals.find(".calendar_content").find("div");
			console.log("checking");
			
		});
		$(".defaultButton").on("click",function() {
			period=0;
			var clicked=$(this);
			var generateCalendars = function(e) {
				
				var nextDates = getAdjacentMonth(defaultMonth, defaultYear, e);
				month = defaultMonth;
				year = defaultYear;
				nextMonth = nextDates[0];
				nextYear = nextDates[1];

				c(defaultMonth, defaultYear, 0);
				c(nextMonth, nextYear, 1);
			};
			if(clicked.attr("class").indexOf("left")!=-1) { 
				generateCalendars("previous");
			} else { generateCalendars("next"); }
			clickedElement = bothCals.find(".calendar_content").find("div");
			//console.log("checking");
			bothCals.find(".calendar_content").find("div").each(function(){
							$(this).removeClass("selected");
						});	
		});


		//  Click picking stuff
		function getClickedInfo(element, calendar) {
			var clickedInfo = {};
			var clickedCalendar,
				clickedMonth,
				clickedYear;
			clickedCalendar = calendar.name;
			//console.log(element.parent().parent().attr('class'));
			clickedMonth = clickedCalendar == "first" ? month : nextMonth;
			clickedYear = clickedCalendar == "first" ? year : nextYear;
			clickedInfo = {"calNum": clickedCalendar,
							"date": parseInt(element.text()),
							"month": clickedMonth,
							"year": clickedYear}
			//console.log(clickedInfo);
			period=0;
			return clickedInfo;
		}
		const getDateDiff = (d1, d2) => {
		  const date1 = new Date(d1);
		  const date2 = new Date(d2);
		  
		  const diffDate = date1.getTime() - date2.getTime();
		  
		  return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
		}


		// Finding between dates MADNESS. Needs refactoring and smartening up :)
		function addChosenDates(firstClicked, secondClicked, selected) {
			if (secondClicked.date > firstClicked.date || 
				secondClicked.month > firstClicked.month ||
				secondClicked.year > firstClicked.year) {

				var added_year = secondClicked.year;
				var added_month = secondClicked.month;
				var added_date = secondClicked.date;
				/*console.log("---------------------------");
				console.log(selected);
				
				console.log(Object.keys(selected));
				console.log(Object.keys(Object.keys(selected)));
				console.log(Object.keys(selected)[0][0]);
				console.log(JSON.stringify(selected));*/
				if(Object.keys(selected).length>2){
					let cnt=1;
					for (let i of Object.keys(selected)){
						console.log((cnt++)+"번째 :"+i)
						for(let j= 0; j < i.length; j++){
							console.log(i.j);
						}
					}
				}
			

				if (added_year > firstClicked.year) {	
					// first add all dates from all months of Second-Clicked-Year
					selected[added_year] = {};
					selected[added_year][added_month] = [];
					for (var i = 1; 
						i <= secondClicked.date;
						i++) {
						selected[added_year][added_month].push(i);
					}
			
					added_month = added_month - 1;
					//console.log(added_month);
					while (added_month >= 0) {
						selected[added_year][added_month] = [];
						for (var i = 1; 
							i <= getDaysInMonth(added_year, added_month);
							i++) {
							selected[added_year][added_month].push(i);
						}
						added_month = added_month - 1;
					}

					added_year = added_year - 1;
					added_month = 11; // reset month to Dec because we decreased year
					added_date = getDaysInMonth(added_year, added_month); // reset date as well

					// Now add all dates from all months of inbetween years
					while (added_year > firstClicked.year) {
						selected[added_year] = {};
						for (var i=0; i < 12; i++) {
							selected[added_year][i] = [];
							for (var d = 1; d <= getDaysInMonth(added_year, i); d++) {
								selected[added_year][i].push(d);
							}
						}
						added_year = added_year - 1;
					}
				}
				
				if (added_month > firstClicked.month) {
					if (firstClicked.year == secondClicked.year) {
						console.log("here is the month:",added_month);
						selected[added_year][added_month] = [];
						for (var i = 1; 
							i <= secondClicked.date;
							i++) {
							selected[added_year][added_month].push(i);
						}
						added_month = added_month - 1;
					}
					while (added_month > firstClicked.month) {
						selected[added_year][added_month] = [];
						for (var i = 1; 
							i <= getDaysInMonth(added_year, added_month);
							i++) {
							selected[added_year][added_month].push(i);
						}
						added_month = added_month - 1;
					}
					added_date = getDaysInMonth(added_year, added_month);
				}

				for (var i = firstClicked.date + 1; 
					i <= added_date;
					i++) {
					selected[added_year][added_month].push(i);
				}
			}
				
			first=firstClicked.year+'-'+(firstClicked.month+1)+'-'+firstClicked.date;
			second= secondClicked.year+'-'+(secondClicked.month+1)+'-'+secondClicked.date;
			period=getDateDiff(first, second)+1;
			if(period>5){
				alert("최대 5일까지 예약할 수 있습니다 ");
				return false;
			}
			
			return selected;
		}
	
	
	
		$('.closeModal').click(function(){
			bothCals.find(".calendar_content").find("div").each(function(){
							$(this).removeClass("selected");
						});	
			$(this).closest(".modal").hide();
	    });
		$(document).on("click",".calBook",function(){
				if(period>5){
					alert("5일 이상 예약할 수 없습니다.");
					return false;
				}else if(period<1){
					alert("날짜를 선택하지 않으셨습니다.");
					return false;
				}
				console.log(first+"~"+second);
				console.log(period+"일 예약");
				$(this).closest(".modal").hide();
		    });
		$(document).on("click",".calCart",function(){
				if(period>5){
					alert("5일 이상 예약할 수 없습니다.");
					return false;
				}else if(period<1){
					alert("날짜를 선택하지 않으셨습니다.");
					return false;
				}
				console.log(period);
				console.log(first+"~"+second);
				console.log(period+"일 예약");
				$(this).closest(".modal").hide();
		    })
		});



})(jQuery);


var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1} 
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none"; 
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  if(slides[slideIndex-1]!=null){
  
  	slides[slideIndex-1].style.display = "block";
  } 
} 






function plusSlides2(n,e) {
  let aa=$(e).closest('.slideshow-container2');
  num=aa.data('slidenum') 
  let data1=$(e).closest('.slideshow-container2').data('slideindex'+num);
  console.log(data1)
  aa.data('slideindex'+num,data1+n)
  index=$(e).closest('.slideshow-container2').data('slideindex'+num)
  showroomSlides2(index,num);
}


function showroomSlides2(n,slidenum) {
  let i;
  let slides = document.getElementsByClassName("mySlides"+slidenum);
  console.log(slides)
  let index = $(document.querySelector(".slide"+slidenum)).data('slideindex'+slidenum);
  let indexchange = document.querySelector(".slide"+slidenum);
  
  console.log(index+"입갤"+slides.length)
  if (index > slides.length) {
  	$(indexchange).data('slideindex'+slidenum,1)
  	index = $(document.querySelector(".slide"+slidenum)).data('slideindex'+slidenum);
  } 
  if (index < 1) {
  	$(indexchange).data('slideindex'+slidenum,slides.length)
  	index = $(document.querySelector(".slide"+slidenum)).data('slideindex'+slidenum);
  	}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none"; 
  }
  if(slides[index-1]!=null){
  
  	slides[index-1].style.display = "block";
  } 
  console.log(index+"결과")
} 


document.querySelector('.slideshow-container2').onload = function(){
	console.log($(this).data("slidenum"))
	showroomSlides2(1,$(this).data("slidenum"))
}



//무의미
$(function(){
	$('.btnCart').click(function(){
		
      $("#periodModal").find(".calAJAXbtn").html("장바구니에 넣기");
      $("#periodModal").find(".calAJAXbtn").addClass("calCart");
      $("#periodModal").find(".calAJAXbtn").removeClass("calBook");
      $("#periodModal").show();
    });
	$('.btnBook').click(function(){
		
      $("#periodModal").find(".calAJAXbtn").html("지금 예약하기");
      $("#periodModal").find(".calAJAXbtn").addClass("calBook");
      $("#periodModal").find(".calAJAXbtn").removeClass("calCart");
      $("#periodModal").show();
		
    });
})

