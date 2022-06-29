<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">


<div id="app">
 <section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/bg_1.jpg');">
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
      <div class="col-md-9 ftco-animate pb-5 text-center">
       <p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>Hotel <i class="fa fa-chevron-right"></i></span></p>
       <h1 class="mb-0 bread">booking</h1>
     </div>
   </div>
 </div>
</section>
<section class="ftco-section ftco-no-pb">
 <div class="container">
  <div class="row">
   <div class="col-md-12">
    <div class="search-wrap-1 ftco-animate">
     <form action="search" class="search-property-1" method="get">
      <div class="row no-gutters">
       <div class="col-lg d-flex">
        <div class="form-group p-4 border-0">
         <label for="#"> 어디로 가세요?</label>
         <div class="form-field">
           <div class="icon"><i class="fa-solid fa-location-dot"></i></div>

         <select class="form-control" v-model="area">
		  		<option value="">지역선택</option>
		        <option value="경기도">경기도</option>
		        <option value="강원도">강원도</option>
		        <option value="전라도">전라도</option>
		        <option value="경상도">경상도</option>
		        <option value="제주도">제주도</option>
      	</select>
         </div>
       </div>
     </div>
     <div class="col-lg d-flex">
      <div class="form-group p-4">
       <label for="#">언제 가세요?</label>
       <div class="form-field">
         <div class="icon"><span class="fa fa-calendar"></span></div>
         <input type="date" class="form-control" placeholder="날짜 선택" v-model="bookingDate" name="teeTimeD">
       </div>
     </div>
   </div>
 <div class="col-lg d-flex">
  <div class="form-group p-4">
   <label for="#">몇시에 치세요?</label>
   <div class="form-field">
     <div class="select-wrap">
      <div class="icon"><i class="fa-solid fa-golf-ball-tee"></i></div>
      <select class="form-control" v-model="part" name="partTime">
        <option value="">선택</option>
        <option value="1">오전</option>
        <option value="2">오후</option>
        <option value="3">저녁</option>
        <option value="4">야간</option>
      </select>
    </div>
  </div>
</div>
</div>
<div class="col-lg d-flex">
  <div class="form-group d-flex w-100 border-0">
   <div class="form-field w-100 align-items-center d-flex">
    <input type="submit" value="Search" class="align-self-stretch form-control btn btn-primary">
  </div>
</div>
</div>
</div>
</form>
</div>
</div>
</div>

<!-- 검색어 추가하기 -->
	<div class="row mt-4">
		<div class="col-6 offset-3">
			<button class="btn"></button>
	</div>
</div>
</section>

x
<section class="ftco-section">
 <div class="container">
  <div class="row">
<c:forEach var="golfFieldDto" items="${list}">
   <div class="col-md-4 ftco-animate">
    <div class="project-wrap hotel">
     <a href="detail?fieldNo=${golfFieldDto.fieldNo}" class="img" style="background-image: url(${root}/images/golf-dummy.jpg);">
    </a>
    <div class="text p-2">
      <span class="days"><fmt:formatNumber value="${golfFieldDto.fieldGreenfee}" />원~</span>
      <h3><a href="#">${golfFieldDto.fieldName}</a></h3>
      <p class="location"><span class="fa fa-map-marker"></span>지역</p>
   </div>
 </div>
</div>

</c:forEach>

</div>
<div class="row mt-5">
  <div class="col text-center">
    <div class="block-27">
      <ul>
        <li><a href="#">&lt;</a></li>
        <li class="active"><span>1</span></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">&gt;</a></li>
      </ul>
    </div>
  </div>
</div>
</div>
</section>
</div>

<!-- vueJs -->
 <script src="http://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            data(){
                return {
                	bookingDate: "",
                	area:"",
                	part:"",
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            //- 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            //- 반드시 return을 통해 값을 반환해야 한다
            computed:{

            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
				addArea(){
					
				},
            },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{

            },
        });
        app.mount("#app");
    </script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/project_insert.js"></script>
	<script type="text/javascript">
	$(function() {	
	//날짜 선택 (datepicker) 설정
	var dateFormat = "yy-mm-dd", from = $("#start").datepicker(
			{
				showMonthAfterYear : true, //연도,달 순서로 지정
				changeMonth : true, //달 변경 지정
				dateFormat : "yy-mm-dd", //날짜 포맷
				dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ], //요일 이름 지정
				monthNamesShort : [ "1", "2", "3", "4", "5", "6", "7", "8",
						"9", "10", "11", "12" ], //월 이름 지정
				minDate : '+3D'
			//오늘 이전 날짜를 선택할 수 없음
			}).on("change", function() {
		to.datepicker("option", "minDate", getDate(this)); //종료일의 minDate 지정
	}), to = $("#end").datepicker(
			{
				showMonthAfterYear : true,
				changeMonth : true,
				dateFormat : "yy-mm-dd",
				dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
				monthNamesShort : [ "1", "2", "3", "4", "5", "6", "7", "8",
						"9", "10", "11", "12" ],
				minDate : '+4D' //내일부터 선택가능, 지정형식 예(+1D +1M +1Y)
			}).on("change", function() {
		from.datepicker("option", "maxDate", getDate(this)); //시작일의 maxDate 지정
	});

	function getDate(element) {
		var date;
		try {
			date = $.datepicker.parseDate(dateFormat, element.value);
			if (element.id == 'start') {
				date.setDate(date.getDate() + 1); //종료일은 시작보다 하루 이후부터 지정할 수 있도록 설정
			} else {
				date.setDate(date.getDate() - 1); //시작일은 종료일보다 하루 전부터 지정할 수 있도록 설정
			}
		} catch (error) {
			date = null;
		}
		return date;
	}
	});
	</script>







<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
