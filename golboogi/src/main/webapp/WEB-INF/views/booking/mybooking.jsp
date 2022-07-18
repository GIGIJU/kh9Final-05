<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<style>
.b12 {
	font-size: 12px;
	color: black;
}
.comment-list li {
    padding: 15px 20px 20px 20px;
    float: left;
    width: 100%;
    clear: both;
    list-style: none;
    background-color: #f1f2f6;
    border: #dfe4ea solid 1px;
}
.prepay{
	background-color: #ff7675;
	color: white;
	border-radius: 2px;
	padding: 3px 3px 3px 3px;
	font-size: 9px;
}
.modal {
	position: fixed;
	top: 20%;
	left: 5%;
	width: 90%;
	height: 57%;
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
	padding: 30px 50px;
	text-align: center;
	position: relative;
	border-radius: 5px;
	width: 35em;
	height: 80%;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	max-height: 100%;
	overflow-y: auto;
}

textarea {
    width: 100%;
    height: 14em;
    text-align: left;
    font-size: 11px;
    color: black;
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
.showbtn{
	display: inline-block!important; 
}
</style>
<div id="app">
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span>mypage <i class="fa fa-chevron-right"></i></span>
				</p>
				<p class="mb-0" style="font-size: 17px">부킹, 모든 골프장 예약은 골북이로 통합니다.</p>
			</div>
		</div>
	</div>
</section>	

	<div class="container-fluid">
		<div class="row mt-5 mb-5">
			<div class="col-md-6 offset-md-3">
			<div class="text-center"><h2 class="mb-5" style="font-size: 25px; font-weight: bold;">나의 예약 내역</h2></div>		
			<c:if test="${list.isEmpty()}">
	 	 	<div class="col-md-6 offset-md-3 text-center">
	 	 	<img src="https://image.smartscore.kr/pc4/no-round.svg">
	 	 	<br><span style="font-size: 17px;">예약 내역이 없습니다.</span>
	 	 	</div>

 			</c:if>
				<ul class="comment-list">
					<c:forEach var="myBookingListVO" items="${list}">
						<li class="comment mb-4">	
							<div class="row">
								<div class="col-md-5 text-left ml-3">
									<span class="b12" style="font-weight: bold; font-size: 15px;">${myBookingListVO.fieldName}</span><br>
								</div>
								<div class="col-md-6 ml-3 text-right">
								<c:choose>
									<c:when test="${myBookingListVO.bookingStatus == '예약취소'}">
										<span style="color: #e74c3c; font-size: 13px;">${myBookingListVO.bookingStatus}</span>
									</c:when>
									<c:otherwise>
										<span style="color: #27ae60; font-size: 13px;">${myBookingListVO.bookingStatus}</span>
									</c:otherwise>
								</c:choose>
								</div>
							</div>
							<hr>
							<div class="row mt-3">
								<div class="col-md-3 text-center">
									<a href="mybooking_detail/${myBookingListVO.bookingNo}">
									<img src="${root}/images/golf-dummy.jpg" style="height: 120px; width: 120px; 
									<c:if test="${myBookingListVO.bookingStatus == '예약취소'}"> opacity: 0.4;
									</c:if>	">
									</a>
								</div>
								<div class="col-md-4">
									<fmt:parseDate var="teeDate"  value="${myBookingListVO.teeTimeD}" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${teeDate}" var="teeTimeD" pattern="yyyy-MM-dd"/>
									<span class="b12">일자 : ${teeTimeD}</span><br>
									<span class="b12">시간 : ${myBookingListVO.teeTimeT}</span><br>
									<span class="b12">코스 : ${myBookingListVO.courseName}</span><br>
									<span class="b12">홀정보 : ${myBookingListVO.courseHole}</span>
								</div>

							<c:if test="${myBookingListVO.bookingStatus != '예약취소'}"> 
								<div class="col-md-4 ml-5 text-right">
										<button class="btn mb-2" :class="{'showbtn':!showJoin('${myBookingListVO.teeTimeD}','${myBookingListVO.teeTimeT}')}" style="display: none;" @click="locationReview('${myBookingListVO.fieldName}')" v-if="!showJoin('${myBookingListVO.teeTimeD}','${myBookingListVO.teeTimeT}')">리뷰작성</button>
										<button class="btn mb-2" v-else @click="showModal(${myBookingListVO.bookingNo})">조인등록</button><br>
										
										<c:choose>
											<c:when test="${myBookingListVO.bookingStatus == '예약완료'}">
												<button class="btn" style="display: none;" :class="{'showbtn':bookingDrop('${myBookingListVO.bookingDropAble}')}" v-if="bookingDrop('${myBookingListVO.bookingDropAble}')" @click="cancelBooking(${myBookingListVO.bookingNo},'${myBookingListVO.fieldName}')">예약취소</button>
											</c:when>
											<c:otherwise>
												<button class="btn" style="display: none;" :class="{'showbtn':bookingDrop('${myBookingListVO.bookingDropAble}')}" v-if="bookingDrop('${myBookingListVO.bookingDropAble}')" @click="cancelPayment(${myBookingListVO.bookingNo},'${myBookingListVO.fieldName}')">결제취소</button>
											</c:otherwise>
										</c:choose>
										<button class="btn" v-else style="background-color: gray; cursor: default;" disabled>취소불가</button><br><br> 
										<c:if test="${myBookingListVO.fieldPrepay==0}"><span class="prepay mr-2">현장결제</span></c:if>
										<span class="b12" style="font-size: 14px;"><fmt:formatNumber value="${myBookingListVO.bookingPrice}" />원</span>
								</div>
							 </c:if>
							</div>
						</li>
					
					</c:forEach>
				</ul>
			</div>
		</div>
	</div> 

	<!-- 조인등록 창 -->
	<div class="modal" style="display: none;">
		<div class="modal-content">
		<div class="row">
			<div class="col-8 text-left" style="padding-left: 0px;">
				<span style="font-weight: bold; color: black;">조인 글 등록</span>			
			</div>
			<div class="col-4 text-right">
				<button class="btn-cancel" @click="hiddenModal"><i class="fa-solid fa-xmark"></i></button>
			</div>
		</div>
		<form action="${root}/join/insert" method="post">
			<input type="hidden" :value="bookingNo" name="bookingNo">
			<div class="row mt-2">
				<span style="color: black; font-size: 11px; margin-right: 3px;">필요 인원 수 : </span> 
				<select name="joinPeople">	
					<c:forEach var="i" begin="1" end="3">
						<option>${i}</option>
					</c:forEach>
				</select>
			</div>
			<div class="row mt-2">
				<textarea name="joinInfo" placeholder="나와 동반자를 표현하는 글을 작성해보세요"></textarea>
			</div>
			<div class="row" style="font-size: 9px; text-align: left;">
				<span><i class="fa-solid fa-circle-exclamation"></i> 타 회원이 신청 후 조인수락이되면, 방장님과 회원님간의 핸드폰번호가 서로 공개됩니다.</span>
				<span><i class="fa-solid fa-circle-exclamation"></i> 조인서비스는 자유 공간입니다.이용 중 발생하는 사고에 대해 어떠한 법적 책임도 지지 않습니다.</span>
			</div>
			<div class="row mt-4">
				<div class="col text-center">
					<button class="btn" style="width: 50%">등록</button>
				</div>
			</div>
		</form>
		</div>
	</div>
</div>
<!-- vue js -->
<script src="http://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script>
    //div[id=app]을 제어할 수 있는 Vue instance를 생성
    const app = Vue.createApp({
        //data : 화면을 구현하는데 필요한 데이터를 작성해둔다
        data(){
            return {
				bookingNo:"",
				dropAble:"",
            };
        },
        //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
        //- 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
        //- 반드시 return을 통해 값을 반환해야 한다
        computed:{

        },
        //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
        methods:{
        	showModal(bookingNo){
        		this.bookingNo = bookingNo;
       			$(".modal").show();
        	},
        	hiddenModal(){
        		$(".modal").hide();
        	},
        	cancelBooking(bookingNo,fieldName){
         		if(confirm("정말로 예약 취소 하시겠습니까?")){
	        		window.location.href="${root}/booking/cancel?bookingNo="+bookingNo+"&fieldName="+fieldName;
        		}
        	},
        	bookingDrop(date){
        		return moment(date) > moment();
        	},
        	showJoin(date,time){
        		teetime = moment(date).add(time,'hour').format('YYYY-MM-DD hh:mm');
        		now = moment().format('YYYY-MM-DD hh:mm');
        		console.log(teetime);
        		console.log(now);
        		console.log(moment(teetime) > moment(now));
        		return moment(teetime) > moment(now);
        	},
        	locationReview(fieldName){
        		window.location.href="${root}/review/write/"+fieldName;
        	},
        	cancelPayment(bookingNo,fieldName){
        		if(confirm("정말로 결제 취소 하시겠습니까?")){
	        		window.location.href="${root}/booking/cancelPayment?bookingNo="+bookingNo+"&fieldName="+fieldName;
        		}
        	},
        },
        //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
        watch:{

        },
        mounted(){

        }
    });
    app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>