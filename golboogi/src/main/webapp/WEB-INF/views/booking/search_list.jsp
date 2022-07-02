<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<div id="app">
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${root}/images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center"
				style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/">Home <i
								class="fa fa-chevron-right"></i></a></span> <span>Hotel <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">booking</h1>
				</div>
			</div>
		</div>
	</section>
	<div class="col-4 offset-4">
		 <input type="text" id="booking-datePicker" class="form-control" value="${param.teeTimeD}" v-on:input="location"/>			
	</div>
	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row">
				<div class="col-md-8 offset-md-2">
					<div class="pt-5 mt-5">
						<h3 class="mb-5 text-center"
							style="font-size: 20px; font-weight: bold;">${param.teeTimeD}</h3>
						<hr>
						<ul class="comment-list">
							<c:forEach var="teetimeVO" items="${list}">
								<li class="comment">
									<div class="vcard bio">
										<img src="${root}/images/golf-dummy.jpg" height="50px">
									</div>
									<div class="comment-body">
										<h3>${teetimeVO.fieldName}</h3>
										<div class="meta" style="font-size: 9px">
											<c:choose>
												<c:when test="${teetimeVO.partTime == 1}">
													<fmt:formatNumber value="${teetimeVO.fieldGreenfee-20000}" />
												</c:when>
												<c:when
													test="${teetimeVO.partTime == 2 || teetimeVO.partTime == 4}">
													<fmt:formatNumber value="${teetimeVO.fieldGreenfee-10000}" />
												</c:when>
												<c:otherwise>
													<fmt:formatNumber value="${teetimeVO.fieldGreenfee}" />
												</c:otherwise>
											</c:choose>
										</div>
										<p>
											<a class="reply" href="">${teetimeVO.teeTimeT}</a>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<!--vue jis도 lazy loading을 사용한다-->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"
	integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="http://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script>
	$('#booking-datePicker').datepicker({
	   format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
	   startDate: '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
	   endDate: '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
	   autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
	   calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
	   clearBtn: false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
	   datesDisabled: ['2019-06-24', '2019-06-26'], //선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
	   daysOfWeekDisabled: [0, 6], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
	   daysOfWeekHighlighted: [3], //강조 되어야 하는 요일 설정
	   disableTouchKeyboard: false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
	   immediateUpdates: false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
	   multidate: false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
	   multidateSeparator: ',', //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
	   templates: {
	      leftArrow: '&laquo;',
	      rightArrow: '&raquo;',
	   }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
	   showWeekDays: true, // 위에 요일 보여주는 옵션 기본값 : true
	   title: '테스트', //캘린더 상단에 보여주는 타이틀
	   todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
	   toggleActive: true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
	   weekStart: 0, //달력 시작 요일 선택하는 것 기본값은 0인 일요일
	   language: 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	})
	.show('changeDate', function (e) {
	   /* 이벤트의 종류 */
	   //show : datePicker가 보이는 순간 호출
	   //hide : datePicker가 숨겨지는 순간 호출
	   //clearDate: clear 버튼 누르면 호출
	   //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
	   //changeMonth : 월이 변경되면 호출
	   //changeYear : 년이 변경되는 호출
	   //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
	
	   console.log(e);
	   // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시) 위와 같은 형태로 보인다.
	});
</script>
<script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성해둔다
            data(){
                return {
                	teeTimeD:"",
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            //- 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            //- 반드시 return을 통해 값을 반환해야 한다
            computed:{
				
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
            	location(){
            		window.location.href="http://localhost:8080/booking/search?teeTimeD="+this.teeTimeD;
            	}
            },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{

            },
            mounted(){

            }, 
            created(){
       
            },
        });
        app.mount("#app");
    </script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>