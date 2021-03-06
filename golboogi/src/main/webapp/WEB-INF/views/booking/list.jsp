<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!-- datepicker ui -->
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<style>
.prepay{
	background-color: #ff7675;
	color: white;
	border-radius: 2px;
	padding: 3px 3px 3px 3px;
}
</style>
<div id="app">
	<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span>booking <i class="fa fa-chevron-right"></i></span>
					</p>
					<p class="mb-0" style="font-size: 15px">부킹, 모든 골프장 예약은 골북이로 통합니다.</p>
				</div>
			</div>
		</div>
	</section>	
	<section class="ftco-section ftco-no-pb">
		<form action="search" class="search-property-1" method="get" v-on:submit="sendSearch">
			<div class="container">
				<!-- <div class="row"><button class="col-1 btn">강원도</button></div> -->
				<div class="row">
					<div class="col-md-12">
						<div class="search-wrap-1 ftco-animate">
							<div class="row no-gutters">
								<div class="col-lg d-flex">
									<div class="form-group p-4 border-0">
										<label for="#"> 어디로 가세요?</label>
										<div class="form-field">
											<div class="icon">
												<i class="fa-solid fa-location-dot"></i>
											</div>

											<select class="form-control" v-model="area" v-bind:name="checkFieldArea">
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
											 <input type="text" class="form-control" id="datepicker" placeholder="날짜 선택" 
											 name="teeTimeD" autocomplete="off" readonly>
										</div>
									</div>
								</div>
								<div class="col-lg d-flex">
									<div class="form-group p-4">
										<label for="#">몇시에 치세요?</label>
										<div class="form-field">
											<div class="select-wrap">
												<div class="icon">
													<i class="fa-solid fa-golf-ball-tee"></i>
												</div>
												<select class="form-control" v-model="part" v-bind:name="checkPartTime">
													<option value="" selected>선택</option>
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
								  <div class="form-group p-4">
								   <label for="#">가격대</label>
								   <div class="form-field">
								     <div class="select-wrap">
								      <div class="icon"><span class="fa fa-chevron-down"></span></div>
								      <select class="form-control" v-model="price" v-bind:name="checkGreenfee">
								        <option value="" selected>선택</option>
								        <option value="150000">~150,000원</option>
								        <option value="200000">~200,000원</option>
								        <option value="300000">~300,000원</option>
								      </select>
								    </div>
								  </div>
								</div>
								</div>
								<div class="col-lg d-flex">
									<div class="form-group d-flex w-100 border-0">
										<div class="form-field w-100 align-items-center d-flex">
											<input type="submit" value="검색"
												class="align-self-stretch form-control btn btn-primary">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</form>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row mb-3">
				<div class="col-md-6 text-left"><h4 style="font-weight: bold;">인기골프장</h4></div>
				<div  class="col-md-6 text-right" style=" vertical-align: bottom;">
				<a href="list_all" style="font-size: 12px; color: gray;">더보기 ></a>
				</div>
			</div>
			<div class="row">
				<c:forEach var="golfFieldDto" items="${rank}">
					<div class="col-md-4 ftco-animate">
						<div class="project-wrap hotel">
						<c:choose>
							<c:when test="${golfFieldDto.attachmentNo != 0}">
								<a :href="'detail?fieldNo=${golfFieldDto.fieldNo}&teeTimeD='+tomorrow" class="img"
									style="background-image: url(${root}/attachment/download?attachmentNo=${golfFieldDto.attachmentNo});">
								</a>	
							</c:when>
							<c:otherwise>
								<a :href="'detail?fieldNo=${golfFieldDto.fieldNo}&teeTimeD='+tomorrow" class="img"
									style="background-image: url(${root}/images/golf-dummy.jpg);">
								</a>							
							</c:otherwise>
						</c:choose>
							<div class="text p-2">
								<span class="days">
								<div class="row">
									<div class="col-md-6 text-left">
										<fmt:formatNumber value="${golfFieldDto.fieldGreenfee-20000}" />원~</span>
									</div>
									<div class="col-md-6 text-right">
										<c:if test="${golfFieldDto.fieldPrepay==1}"> <span class="prepay" style="font-size: 8px;">선결제</span></c:if>
									</div>
								</div>
								<h3>${golfFieldDto.fieldName}</h3>
								<p class="location">
									<span class="fa fa-map-marker"> ${golfFieldDto.fieldArea}</span>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
				<div class="row mb-3">
					<div class="col-md-6 text-left"><h4 style="font-weight: bold;">선결제 골프장</h4></div>
					<div  class="col-md-6 text-right" style=" vertical-align: bottom;">
					<a href="list_all?type=field_prepay" style="font-size: 12px; color: gray;">더보기 ></a>
					</div>
				</div>
					<div class="row">
					<c:forEach var="golfFieldDto" items="${prepay}">
					<div class="col-md-4 ftco-animate">
						<div class="project-wrap hotel">
						<c:choose>
							<c:when test="${golfFieldDto.attachmentNo != 0}">
								<a :href="'detail?fieldNo=${golfFieldDto.fieldNo}&teeTimeD='+tomorrow" class="img"
									style="background-image: url(${root}/attachment/download?attachmentNo=${golfFieldDto.attachmentNo});">
								</a>	
							</c:when>
							<c:otherwise>
								<a :href="'detail?fieldNo=${golfFieldDto.fieldNo}&teeTimeD='+tomorrow" class="img"
									style="background-image: url(${root}/images/golf-dummy.jpg);">
								</a>							
							</c:otherwise>
						</c:choose>
							<div class="text p-2">
								<span class="days">
								<div class="row">
									<div class="col-md-6 text-left">
										<fmt:formatNumber value="${golfFieldDto.fieldGreenfee-20000}" />원~</span>
									</div>
									<div class="col-md-6 text-right">
										<c:if test="${golfFieldDto.fieldPrepay==1}"> <span class="prepay" style="font-size: 8px;">선결제</span></c:if>
									</div>
								</div>
								<h3><a href="#">${golfFieldDto.fieldName}</a></h3>
								<p class="location">
									<span class="fa fa-map-marker"> ${golfFieldDto.fieldArea}</span>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
				<div class="row mb-3">
					<div class="col-md-6 text-left"><h4 style="font-weight: bold;">비용 부담없이 가볍게</h4></div>
					<div  class="col-md-6 text-right" style=" vertical-align: bottom;">
					<a href="list_all?type=field_greenfee" style="font-size: 12px; color: gray;">더보기 ></a>
					</div>
				</div>
					<div class="row">
					<c:forEach var="golfFieldDto" items="${cheap}">
					<div class="col-md-4 ftco-animate">
						<div class="project-wrap hotel">
						<c:choose>
							<c:when test="${golfFieldDto.attachmentNo != 0}">
								<a :href="'detail?fieldNo=${golfFieldDto.fieldNo}&teeTimeD='+tomorrow" class="img"
									style="background-image: url(${root}/attachment/download?attachmentNo=${golfFieldDto.attachmentNo});">
								</a>	
							</c:when>
							<c:otherwise>
								<a :href="'detail?fieldNo=${golfFieldDto.fieldNo}&teeTimeD='+tomorrow" class="img"
									style="background-image: url(${root}/images/golf-dummy.jpg);">
								</a>							
							</c:otherwise>
						</c:choose>
							<div class="text p-2">
								<span class="days">
								<div class="row">
									<div class="col-md-6 text-left">
										<fmt:formatNumber value="${golfFieldDto.fieldGreenfee-20000}" />원~</span>
									</div>
									<div class="col-md-6 text-right">
										<c:if test="${golfFieldDto.fieldPrepay==1}"> <span class="prepay" style="font-size: 8px;">선결제</span></c:if>
									</div>
								</div>
								<h3><a href="#">${golfFieldDto.fieldName}</a></h3>
								<p class="location">
									<span class="fa fa-map-marker"> ${golfFieldDto.fieldArea}</span>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
</div>


<!-- vueJs -->
<script src="https://unpkg.com/vue@next"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            data(){
                return {
                	teeTimeD:"",
                	area:"",
                	part:"",
                	price:"",
                	tomorrow:"",
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            //- 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            //- 반드시 return을 통해 값을 반환해야 한다
            computed:{
				checkPartTime(){
					if(!this.part=="") return "partTime";
				},
				checkFieldArea(){
					if(!this.area=="") return "fieldArea";
				},
				checkGreenfee(){
					if(!this.price=="") return "fieldGreenfee";
				},
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
            	sendSearch(e){
            		if(this.teeTimeD==""){
            			alert("날짜를 선택해주세요")
            			e.preventDefault();
            		}
            	},
            	
            },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{

            },
            mounted(){
            	$.datepicker.setDefaults({
                    showMonthAfterYear: true,
                    changeMonth: true,
                    dateFormat: "yy-mm-dd",
                    nextText: "다음달",
                    prevText: "이전달",
                    dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
                    monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8",
                        "9", "10", "11", "12"
                    ],
                    minDate: '+1D',
                    maxDate: '+60D',
                    onSelect:(dateText)=>{
                    	this.teeTimeD = dateText;
                    },
                });
                $("#datepicker").datepicker(); 
                
            	//내일 날짜
            	 this.tomorrow = moment().add("1","d").format('YYYY-MM-DD');
            },
        });
        app.mount("#app");
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>