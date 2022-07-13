<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<style>
span {
	font-size: 12px;
	color: black;
}
p {
	font-size: 12px;
	margin-bottom: 0;
}
.tagcloud {
    text-transform: uppercase;
    display: inline-block;
    padding: 4px 10px;
    margin-right: 4px;
    border-radius: 4px;
    color: #000000;
    border: 1px solid #ccc;
    font-size: 11px;
}
.prepay{
	background-color: #ff7675;
	color: white;
	border-radius: 2px;
	padding: 3px 3px 3px 3px;
	height: 30%;
	vertical-align: middle;
}

</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<div id="app">
	<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center"
				style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span>detail <i class="fa fa-chevron-right"></i></span>
					</p>
					<p class="mb-0" style="font-size: 17px">부킹, 모든 골프장 예약은 골북이로 통합니다.</p>
				</div>
			</div>
		</div>
	</section>


	<div class="container-fluid">
		<div class="row mt-5 mb-5">
			<div class="col-md-6 offset-md-3 text-center">
				<span style="font-weight: bold; font-size: 30px;">${golfFieldDto.fieldName}</span>&nbsp;
				<c:if test="${golfFieldDto.fieldPrepay == 1}"><span class="prepay">선결제</span></c:if>
			</div>
			<div class="col-md-6 offset-md-3 text-center">
				<img src="${root}/images/bg_5.jpg" style="width: 300px; height: 300px; border-radius: 70%;">
			</div>
		</div>
		<div class="row mt-5" v-if="!isNoTeeTime">
			<div class="col-md-6 offset-md-3">
				<div class="row">
					<div class="col-4 text-left">
						<div v-show="showTeeTime"><i class="fa-solid fa-check"></i>&nbsp;
						<input type="text" id="datepicker" :value="teeTimeD" v-model="teeTimeD" style="width: 110px;"></div>
					</div>
					<div class="col-8 text-right">
 						<button class="btn" style="width: 100px;" @click="clickTime">타임정보</button>
						<button class="btn ml-1" style="width: 100px;" @click="clickGolf">골프장정보</button>
					</div>
				</div>
			<div class="row mt-4 mb-5" v-show="showTeeTime">
				<table class="table table-hover text-center" style="font-size: 12px;">
			 		<thead>
				 		<tr>
					 		<th>날짜</th>
					 		<th>시간</th>
					 		<th>코스</th>
					 		<th>파트</th>
					 		<th>가격</th>
					 		<th width="20%">예약</th>
					 	</tr>
				 	</thead>
				 	<tbody>
				 	<c:forEach var="teetimeVO" items="${teetimeList}">
					 	<tr height="10">
					 		<fmt:parseDate var="teeTimeD"  value="${param.teeTimeD}" pattern="yyyy-MM-dd"/>
					 		<td><fmt:formatDate value="${teeTimeD}" pattern="MM/dd"/></td>
					 		<td>${teetimeVO.teeTimeT}</td>
					 		<td>${teetimeVO.courseName}</td>
					 		
					 		<!-- 파트타임 -->
					 		<c:choose>
								<c:when test="${teetimeVO.partTime == 1}">
									 <td>새벽</td>
								</c:when>
								<c:when test="${teetimeVO.partTime == 2}">
									 <td>오전</td>
								</c:when>
								<c:when test="${teetimeVO.partTime == 3}">
									 <td>오후</td>
								</c:when>
								<c:otherwise>
									<td>저녁</td>
								</c:otherwise>
							</c:choose>
												 		
							<c:choose>
								<c:when test="${teetimeVO.partTime == 1}">
									 <td><fmt:formatNumber value="${teetimeVO.fieldGreenfee-20000}" />원</td>
								</c:when>
								<c:when test="${teetimeVO.partTime == 2 || teetimeVO.partTime == 4}">
									 <td><fmt:formatNumber value="${teetimeVO.fieldGreenfee-10000}" />원</td>
								</c:when>
								<c:otherwise>
									<td><fmt:formatNumber value="${teetimeVO.fieldGreenfee}" />원</td>
								</c:otherwise>
							</c:choose>
					 		<td width="20%"><a class="tagcloud" href="reservation?teeTimeNo=${teetimeVO.teeTimeNo}&teeTimeD=${param.teeTimeD}">예약하기</a></td>
					 	</tr>
				 	</c:forEach> 
				 	</tbody>
			 	</table>
			</div>	
			<div class="row mt-4" v-show="showGolfInfo">
				<h1>골프장 정보</h1>
			</div>
		</div>
	</div>
		<div class="row mt-5 mb-5" v-else>
			<div class="col-md-8 offset-md-2 text-center">
				<h5 style="font-weight: bold;">해당 날짜에 대한 예약 정보가 없습니다</h5>	
			</div>
		</div>
</div>
</div>
<!--vue js-->
<script src="http://unpkg.com/vue@next"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성해둔다
            data(){
                return {
                	teeTimeD:"${param.teeTimeD}",
                	maxDate:"",
                	showTeeTime:true,
                	showGolfInfo:false
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            //- 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            //- 반드시 return을 통해 값을 반환해야 한다
            computed:{
            	 isNoTeeTime(){
            		 return moment(this.teeTimeD) <= moment() || moment(this.teeTimeD) > moment(this.maxDate);
            	 }
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
            	clickTime(){
            		this.showTeeTime = true;
            		this.showGolfInfo = false
            	},
            	clickGolf(){
            		this.showTeeTime = false;
            		this.showGolfInfo = true;
            	},
            },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{
				
            },
            mounted(){
            	let teeTimeD = moment(this.teeTimeD);
				this.maxDate = moment().add("60","d").format('YYYY-MM-DD');
				
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
                    	window.location.href="${root}/booking/detail?fieldNo="+${param.fieldNo}+"&teeTimeD="+dateText;
                    },
                });
                $("#datepicker").datepicker(); 
            }, 
        });
        app.mount("#app");
    </script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>