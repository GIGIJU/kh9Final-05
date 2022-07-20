<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<style>
p{
	font-size: 12px;	
	color: black;	
}
span{
	font-size: 12px;
	color: black;
	font-weight: 500;
}
.btn{
	color: white;
    background-color: black;
}
h6{
	color: black;
	font-weight: bold;
}
.tagcloud {
    text-transform: uppercase;
    display: inline-block;
    padding: 8px 12px;
    margin-bottom: 7px;
    margin-right: 4px;
    color: #000000;
    border: 1px solid #ccc;
    font-size: 12px;
    width: 200px;
    text-align: center;
}
/* 모달창 */
.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 75%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.modal-overlay {
	background-color: rgba(0, 0, 0, 0.6);
	width: 100%;
	height: 100%;
	position: absolute;
}

.modal-content {
	background-color: white;
	padding: 30px;
	text-align: center;
	position: relative;
	border-radius: 5px;
	width: 36em;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	max-height: 100%;
	overflow-y: auto;
}

.hidden {
	display: none;
}

textarea {
    width: 100%;
    height: 50em;
    border: none;
    resize: none;
    font-size: 9px;
    resize: none;
 }
 
 .btn-create {
    background: white;
    border: none;
    color: black;
    font-size: 11px;
}

.btn-create:hover {
    background-color: #white;
    border: none;
    color: gray;
    
}
.btn-cancel {
	background-color: white;
	border: none;
	color: black;
}
.btn-cancel:hover {
    background-color: white;
    color: gray;
}
</style>    
    
<div id="app">
 <section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
      <div class="col-md-9 ftco-animate pb-5 text-center">
       <p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>my booking <i class="fa fa-chevron-right"></i></span></p>
       <p class="mb-0" style="font-size: 15px">부킹, 모든 골프장 예약은 골북이로 통합니다.</p>
     </div>
   </div>
 </div>
</section>

<div class="container-fluid mt-5 mb-5" v-if="!isNoTeeTime">
	<div class="col-md-6 offset-md-3">
		<h4 style="font-weight: bold;">예약 상세내역</h4>
		<hr>
		<div class="row mb-3">
			<div class="col-md-4">
			<c:choose>
				<c:when test="${myBookingListVO.attachmentNo==null}">
					<img src="${root}/images/golf-dummy.jpg" width="200" height="190" style="border-radius: 100%;">
				</c:when>
				<c:otherwise>
					<img src="${root}/attachment/download?attachmentNo=${myBookingListVO.attachmentNo}" width="200" height="190" style="border-radius: 100%;">
				</c:otherwise>
			</c:choose>
			</div>
			<div class="col-md-7 mt-4 ml-3">
				<div>
					<h4>${myBookingListVO.fieldName}</h4>
				</div>				
				<div class="row mt-5">
					<div class="col">
						<p>일자</p>
						<fmt:parseDate var="teeDate"  value="${myBookingListVO.teeTimeD}" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${teeDate}" var="teeTimeD" pattern="yyyy-MM-dd"/>
						<span>${teeTimeD}</span>
					</div>
					<div class="col">
						<p>시간</p>
						<span>${myBookingListVO.teeTimeT}</span>
					</div>
					<div class="col">
						<p>코스</p>
						<span>${myBookingListVO.courseName}</span>
					</div>
					<div class="col">
						<p>홀정보</p>
						<span>${myBookingListVO.courseHole}</span>
					</div>
					
				</div>
			</div>
		</div>
		<hr>
		
		<div class="row mt-4">
			<div class="col-md-3 mt-2 text-center"> 
				<h6>예약자 정보</h6>
			</div>
			<div class="col-md-9 mt-2">
				<div class="row">
					<div class="col-md-3" style="font-weight: lighter;">
						<p>예약자명</p>
						<p>연락처</p>
						<p>예약인원</p>
					</div>
					<div class="col-md-3" style="font-weight: 500;">
						<p>${memberDto.memberName}</p>
						<p>${memberDto.memberPhone}</p>
						<p>4명</p>
					</div>
					<div class="col-md-3" style="font-weight: lighter;">
						<p>예약한날짜</p>
						<p>예약상태</p>
						<p>취소가능날짜</p>
					</div>
					<div class="col-md-3" style="font-weight: 500;">
						<p>${myBookingListVO.bookingDate}</p>
						<c:choose>
							<c:when test="${myBookingListVO.bookingStatus == '예약취소'}">
								<p style="color: #e74c3c;">${myBookingListVO.bookingStatus}</p>
								<p>-</p>
							</c:when>
							<c:otherwise>
								<p style="color: #2ecc71;">${myBookingListVO.bookingStatus}</p>
								<p style="color: red;" v-if="isBookingDrop">${myBookingListVO.bookingDropAble}</p>
								<p style="color: red;" v-else>취소불가</p>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>			
		</div>		
		<hr>
		<div class="row mt-4">
			<div class="col-md-3 mt-2 text-center"> 
				<h6>요금 정보</h6>
			</div>
			<div class="col-md-9 mt-2">
				<div class="row">
					<div class="col-md-3" style="font-weight: lighter;">
						<p>그린피 [1인]</p>
						<p>4인 합계</p>
						<p>요금조건</p>
					</div>
					<div class="col-md-3" style="font-weight: 500;">
						<p><fmt:formatNumber value="${myBookingListVO.bookingPrice/4}" />원</p>
						<p><fmt:formatNumber value="${myBookingListVO.bookingPrice}" />원</p>
						<p><c:choose>
							<c:when test="${myBookingListVO.fieldPrepay==0}">현장결제</c:when>
							<c:otherwise>선결제(결제완료)</c:otherwise>
						</c:choose></p>
					</div>
					<div class="col-md-2" style="font-weight: lighter;">
						<p>카트피</p>
						<p>캐디피</p>
					</div>
					<div class="col-md-4" style="font-weight: 500;">
						<p><fmt:formatNumber value="${myBookingListVO.fieldCartfee}" />원 (현장결제)</p>
						<p><fmt:formatNumber value="${myBookingListVO.fieldCaddiefee}" />원 (현장결제)</p>
					</div>
				</div>
			</div>			
		</div>		
		<hr>
		<c:if test="${paymentDto != null}">
		<div class="row mt-4">
		결제정보
		</div>	
		<hr>
		</c:if>
		<div class="row mt-4">
			<div class="col-md-3 mt-2 text-center"> 
				<h6>동의 내역</h6>
			</div>
			<div class="col-md-9">
				<div class="row mb-1">
					<div class="col-md-6">
						<i class="fa-solid fa-table-list"></i><button class="btn-create" @click="showModal1"> 골북이 부킹 계약 </button>						
					</div>
				</div>
				<div class="row mb-1">
					<div class="col-md-6">
						<i class="fa-solid fa-table-list"></i><button class="btn-create" @click="showModal2"> 골프장 예약/위약 규정 </button>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<i class="fa-solid fa-table-list"></i><button class="btn-create" @click="showModal3"> 골프장 이용 유의사항 </button>
					</div>
				</div>
			</div>			
		</div>	
		<hr>
		<c:if test="${myBookingListVO.bookingStatus == '예약완료'}">
			<div class="col-md-6 offset-md-3 text-center">
				<button class="tagcloud" @click="cancelBooking()" v-if="isBookingDrop">예약취소</button>	
			</div>
		</c:if>
	</div>
</div>

<!-- 약관동의 모달창 1 -->
	
<div class="modal modal1" style="display: none;">
	<!-- <div class="modal-overlay"> -->
		<div class="modal-content">
			<div class="row">
				<div class="col-8 text-left">
					<h4 style="font-weight: bold;">계약규정 및 동의</h4>			
				</div>
				<div class="col-4 text-right">
					<button class="btn-cancel" @click="hiddenModal1"><i class="fa-solid fa-xmark"></i></button>
				</div>
			</div>
			<div class="row mt-2">
				<textarea>
	회원님들께서는 반드시 내장 전,
	해당 골프장의 공지사항 및 시설 운영 상황을 숙지하여 주시기 바랍니다.
	
	1. 스마트스코어는 건강한 골프부킹 문화를 만들어가기 위하여 최선을 다하겠습니다.
	2. 각 골프장별 예약 취소 가능 기한 및 위약 조건을 반드시 확인하시기 바랍니다.
	3. 예약/결제 시 골프장에 예약진행을 위한 제반정보(성명, 휴대폰번호 등)를 제공하게 됩니다.
	4. 스마트스코어 위약규정
	취소불가능기간 중 취소 또는 미내장(NO-SHOW) 발생시 다음과 같이 스마트스코어 
	부킹서비스 이용 자격을 제한합니다.
	(1) 미내장 및 당일취소 : 전체골프장 6개월 정지
	(2) 1일전 취소 : 전체골프장 5개월 정지
	(3) 2일전 취소 : 전체골프장 3개월 정지
	(4) 3일전~ 취소 : 전체골프장 1개월 정지
	그외, 해당 골프장의 자체 위약규정에 따른 예약 자격 정지 및 위약금이 추가로 발생합니다.
	5. 우천 및 기상악화 : 기상 예보만으로는 취소가 불가하며, 당일 현장 확인(내장 및 유선 확인) 
	후 우천취소 가능 시에만 정상취소 됩니다.
	6. 홀별정산 규정 : 해당 골프장 정상가 기준으로 홀정산 진행(
	골프장별 상이, 상세 내용 골프장 홈페이지 확인 필)
	7. 골프장 예약은 예약자 내장을 원칙으로 합니다. 예약자가 미내장 시 골프장 자체규정에 
	따라 위약 사유가 발생할 수 있으니 사전에 확인하시기 바랍니다.
	8. 다중 예약의 경우 무통보 취소 처리 될 수 있습니다.
	9. 선결제 상품의 경우 결제 후 결제수단 변경이 불가능합니다.
	10. 골프장별 공지사항은 골프장 안내 문자 및 홈페이지, 등을 참고하여 주시기 바랍니다.
				</textarea>
			</div>
		</div>
	</div>
<!-- 약관동의 모달창 2 -->
	
<div class="modal modal2" style="display: none;">
	<!-- <div class="modal-overlay"> -->
		<div class="modal-content">
			<div class="row">
				<div class="col-8 text-left">
					<h4 style="font-weight: bold;">골프장 예약/위약 규정</h4>			
				</div>
				<div class="col-4 text-right">
					<button class="btn-cancel" @click="hiddenModal2"><i class="fa-solid fa-xmark"></i></button>
				</div>
			</div>
			<div class="row mt-2">
				<textarea>
	★기한 후 취소 시 위약금 발생됩니다. 신중한 예약 부탁드립니다.
	
	[정상 취소 기한]
	라운드일 제외 7일 전 17시 까지
	
	[위약 안내]
	- 6일 전 취소: 위약금 20만원 발생
	- 5~4일 전 취소: 위약금 30만원 발생
	- 3~2일 전 취소: 위약금 40만원 발생+기존 예약건 전체 취소
	- 1일전 취소: 위약금 60만원 발생+기존 예약건 전체 취소
	- 당일 취소: 위약금 60만원 발생+기존 예약건 전체 취소
	
	[예약자 본인내장 필수]
	- 예약자 본인 내장 필수 (본인 미내장 시 위약발생)
	- 예약자명 변경처리 불가
	
	· 기상 악화 및 우천 예보만으로는 사전 취소 불가, 당일 골프장 직접 문의 요망 (유선 및 현장 확인)
	· 기상 악화 등의 사유로 인한, 18홀 미 종료 시 : 골프장 정상 요금 기준 홀별 정산(세금 별도 책정)
				</textarea>
			</div>
		</div>
	</div>
<!-- 약관동의 모달창 3 -->
	
<div class="modal modal3" style="display: none;">
	<!-- <div class="modal-overlay"> -->
		<div class="modal-content">
			<div class="row">
				<div class="col-8 text-left">
					<h4 style="font-weight: bold;">골프장 이용 유의사항</h4>			
				</div>
				<div class="col-4 text-right">
					<button class="btn-cancel" @click="hiddenModal3"><i class="fa-solid fa-xmark"></i></button>
				</div>
			</div>
			<div class="row mt-2">
			<textarea>
	1. 내장시 준수사항
	-클럽의 품위 유지를 위하여 내장시에는 청바지, 반바지, 짧은치마, 운동화 등 착용을 자제해 주시기 바랍니다.
	-라운드 시작 20분 전까지 스타트에 준비 완료해 주시기 바랍니다.
	2. 경기진행시 준수사항 등 특이사항
	- 티간격은 7분 또는 8분으로 운영됩니다.
	3. 하계 복장 : 골프장별 상이, 각 골프장 규정 확인 필수
	4. 골프장 별 특정 골프화 착용금지
	5. 예약자 본인 내장 원칙입니다.
	6. 골프장별 공지사항(이벤트/복장규정/요금/우천 규정,등)은 골프장 홈페이지 참고하여 주시기 바랍니다.
	7. 그린피는 골프장 사정에 따라 변경 될 수 있습니다.
			</textarea>
			</div>
		</div>
	</div>	
</div>

 	<script src="http://unpkg.com/vue@next"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
    <script>
        const app = Vue.createApp({
            data(){
                return {
                	bookingDrop:"${myBookingListVO.bookingDropAble}",
                };
            },
            computed:{
             	isBookingDrop(){
            		console.log(moment(this.bookingDrop) > moment());
            		return moment(this.bookingDrop) > moment();
            	}, 
            },
            methods:{              
                showModal1(){
                	$(".modal1").show();
                },
                showModal2(){
                	$(".modal2").show();
                },
                showModal3(){
                	$(".modal3").show();
                },
                hiddenModal1(){
                	$(".modal1").hide();
                },
                hiddenModal2(){
                	$(".modal2").hide();
                },
                hiddenModal3(){
                	$(".modal3").hide();
                },
                cancelBooking(){
             		if(confirm("정말로 예약 취소 하시겠습니까?")){
             			console.log("${root}/booking/cancel?bookingNo=${myBookingListVO.bookingNo}&fieldName=${myBookingListVO.fieldName}");
    	        		window.location.href="${root}/booking/cancel?bookingNo=${myBookingListVO.bookingNo}&fieldName=${myBookingListVO.fieldName}";
            		}
            	},

            },
            watch:{

            },
            mounted(){
				
            },   	 
        });
        app.mount("#app");
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>