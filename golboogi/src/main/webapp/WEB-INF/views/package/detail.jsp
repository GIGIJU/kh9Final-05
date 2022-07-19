<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<style>
.container{
	position: relative;
	height: 100%;
}

  /* 유진 커스텀 style */
    .tour-product-info {
      display: flex;
      align-items: center;
      flex-direction: column;
  }
    .tour-product-info .product-info-item+.product-info-item {
      margin-top: 30px;
  }

    .tour-product-info .product-info-item {
      display: flex;
      width: 100%;
      padding: 40px;
      background-color:#343a40;
      border-radius: 15px;
  }

  .tour-product-info .product-info-item2 {
    display: flex;
    width: 100%;
    padding: 40px;
    background-color:#f8f9fa;
    color: #000;
    border-radius: 15px;
    border-bottom: 1px solid #c7c7c7;
}

  .tour-product-info .product-info-item .item-title {
    width: 240px;
    font-size: 24px;
    font-weight: 700;
}

  .tour-product-info .product-info-item .item-cont {
    flex: 1;
    flex-grow: 1;
    flex-shrink: 1;
    flex-basis: 0%;
    margin-left: 100px;
    
}

.tour-product-info .product-info-item2 .item-title {
  width: 240px;
  font-size: 24px;
  font-weight: 700;
}

.tour-product-info .product-info-item2 .item-cont {
  flex: 1;
  flex-grow: 1;
  flex-shrink: 1;
  flex-basis: 0%;
  margin-left: 100px;
  
}

.button-toggle {
  justify-content: center;
  height: 60px;
  padding: 0 24px;
  font-size: 18px;
  color: #000;
  border: 1px solid rgba(0,0,0,.2);
}

.tour-detail-info {
  display: flex;
  justify-content: center;
}

.tour-detail-info .info-item {
  color: #343a40;
  width: 200px;
  text-align: center;
}

.tour-detail-info .info-item+.info-item {
  border-left: 1px solid rgba(0,0,0,.1);
}

.img-box {
  position: relative;}

  .img-box .img-thumb {
    position: absolute;
    width: inherit;
    height: inherit;
    top: 0;
    left: 0;
    background-color: #f7f7f7;
    background-size: cover;
    background-position: 50%;
    border-radius: inherit;
    transition: all .3s ease-in-out;
}

.button-toggle {
  justify-content: center;
  height: 60px;
  padding: 0 24px;
  font-size: 18px;
  color: #000;
  border: 1px solid rgba(0,0,0,.2);
}

.button-toggle+.button-toggle {
  border-left-width: 0;
}

.button-toggle:active{
  color: #fff;
  background-color: #000;
  border: 1px solid #000;
}

.button-toggle:hover{
  color: #fff;
  background-color: #000;
  border: 1px solid #000;
}

.red{
  color:#dc3545 ;
}

.swiper {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	display: inline-block;
	width: 100%;  
 	height: 100%; 
 	max-height: 873px; 
	max-width: 700px;
	object-fit: cover;
}

.place_swiper_container {
    position: relative;
    height: 500px;
}

.place_swiper_container .swiper-button-next {
    position: absolute;
    top: 50%;
    right: -40px;
}

.place_swiper_container .swiper-button-prev {
    position: absolute;
    top: 50%;
    left: -40px;
}

.swiper-button-lock {
    display: none;
}

.swiper-button-next, .swiper-rtl .swiper-button-prev {
    right: 10px;
    left: auto;
}

.club-detail {
    display: flex;
}

.club-detail .detail-score-info {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    width: 300px;
    height: 300px;
    background-color: #fff;
    border-radius: 50%;
    box-shadow: 0 0 20px 0 rgb(0 0 0 / 5%);
    text-align: center;
    word-break: break-all;
    position: relative;
}

.club-detail .detail-score-info h1 {
    font-size: 1.3em;
}

.club-detail .detail-score-info span {
    color: #7f7f7f;
}

.club-detail .detail-score-info p {
    font-size: 2.3em;
    color: #23aed2;
    font-weight: bold;
    letter-spacing: 3.6px;
    line-height: 0;
}

.club-detail .detail-club-info .list-item {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 10px 0;
    border-bottom: 1px solid #e0e0e0;
}

.club-detail .detail-club-info .list-item .title {
    width: 120px;
    font-size: 15px;
        color: #6c757d;
        font-weight: bold;
}

.flex-grow {
    flex: 1;
}

.club-detail .detail-club-info .list-item .cont-box {
    display: flex;
    justify-content: flex-end;
    flex-wrap: wrap;
    flex: 1;
}

.club-detail .detail-club-info .list-item .cont-box .text {
    font-size: 18px;
    text-align: right;
        color: #6c757d;
}
</style>

<script>
	//토글버튼 함수
	$(function() {
		$("#button-toggle1").click(function() {
			$("#divToggle1").toggle();
		});
		$("#button-toggle2").click(function() {
			$("#divToggle2").toggle();
		});
		$("#button-toggle3").click(function() {
			$("#divToggle3").toggle();
		});
		$("#button-toggle4").click(function() {
			$("#divToggle4").toggle();
		});
	});
	
	function breakfastCheck(){//target==이벤트가 발생한 태그 객체
	    //준비 : 전체선택, 항목 체크박스들
	   var breakfast = ${packageVo.packageDto.packageBreakfast};
	   if(breakfast==0){
			breakfast.value("포함");   
	   }
	   else{
		   breakfast.value("불포함");   
	   }
	   }
	  
</script>

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
            var swiper = new Swiper(".mySwiper", {
                cssMode: true,
                navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
                },
                pagination: {
                el: ".swiper-pagination",
                },
                mousewheel: true,
                keyboard: true,
            });
            </script>
	
<!-- 헤더 밑 이미지 타이틀 세션 -->
<div id="app">
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
      <div class="col-md-9 ftco-animate pb-5 text-center">
       <p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>package <i class="fa fa-chevron-right"></i></span></p>
					<p class="mb-0" style="font-size: 17px">투어, 모든 골프장 예약은 골북이로 통합니다.</p>
     </div>
   </div>
 </div>
</section>

<!--숙소 사진-->
<section class="ftco-intro ftco-section ftco-no-pt">
  <div class="container">
    <div class="row justify-content-center">
    <div class="text-center mt-5 md-3">
      <h3 style="font-weight: bold;">${packageVo.stayDto.stayName}</h3>
    </div>
    </div>
    <div class="row justify-content-center">
    <div class="col-md-8 ftco-animate">
    <div class="row justify-content-center">
      <div class="img-box">
        <img src="${root}/images/hotel-resto-1.jpg" style="height: 300px; width: 300px; border-radius: 70%;">
      </div>
      </div>
     <div class="text-center p-1 mt-2 md-2">
      <h5 style="font-weight: thin;">1인 기준</h5>
      </div>
      <div class="text-center p-1 md-10">
      <h3 style="font-weight: bold; color: #fd7e14;"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${packageVo.stayDto.stayPrice}" /></h3>
    </div>
  </div>
  </div>

</div>



<!--숙소 상세-->
  <div class="container">
    <!--상세 내역 부분-->
    <div class="row justify-content-center">
      <div class="tour-detail-info">
        <div class="info-item">
          <p>출발일</p>
			<p>${packageVo.packageDto.packageDepart}</p>
        </div>
        <div class="info-item">
          <p>지역</p>
          <p>${packageVo.stayDto.stayLocal}</p> 
        </div>
        <div class="info-item">
          <p>기간</p>
          <p>1박2일</p>
        </div>
      </div>
    </div>

    <!--예약 버튼 -->
    <div class="row justify-content-center mt-5 mb-5">
<!--       <button class="btn btn-success p-2" style="margin-right: 5px; width:10%; font-size: 15px;">날짜변경</button> -->
      <button class="btn btn-success" style="width:10%; font-size: 17px;"><a href="${root}/package/reserve?packageNo=${packageVo.packageDto.packageNo}" style="color:white" >예약신청</a></button>
    </div>

    <!--페이지네이션 버튼 -->
    <div class="row justify-content-center mt-5 mb-5" >
      <button class="button-toggle "  @click="buttonToggle1"  style="width: 200px;"  >투어정보</button>
      <button class="button-toggle "  @click="buttonToggle2"  style="width: 200px;"  >골프장</button>
      <button class="button-toggle "  @click="buttonToggle3"  style="width: 200px;" >숙소</button>
      <button class="button-toggle "  @click="buttonToggle4"  style="width: 200px;" >후기</button>
    </div>

   <!--투어정보 페이지1 -->
   <div v-show= "divToggle1">
   <div class="row justify-content-center tour-product-info">
      <div class="product-info-item ">
        <div class="product-info-title"><h2>투어 정보</h2></div>
        <div class="item-cont">
		 <!-- <p>•조식 : ${packageVo.packageDto.packageBreakfast}</p> -->
          <p>•골프장 도착 후 프론트 데스크 체크인이 필요합니다.</p>
          <p>•1박2일 패키지 상품입니다.</p>
          <p>•숙소는 4박1실 타입입니다.</p>
          <p>•교통편(개별출발)은 미포함 사항입니다.</p>
      </div>
    </div>
    <div class="product-info-item ">
      <div class="product-info-title"><h2>유의 사항</h2></div>
      <div class="item-cont">
      <p>•2팀이상 접수 불가합니다.</p>
      <p>•만실 시 객실 변동 있을 수 있으며, 현장에서 차액 지불 건이 발생할 수 있습니다.</p>
      <p>•출발일 7~4일 전 취소 : 총 상품가의 50% 제외 한 금액 환불</p>
      <p>•공휴일은 주말요금 적용됩니다.</p>
      <p>•[신청하기]는 예약확정이 아닌 '예약접수' 입니다.</p>
      <p>•[신청하기] 후 담당자와 유선연락으로 "예약확정" 받으신 분에 한해 정상적인 패키지 이용이 가능합니다.</p>
      <p>•예약확정 이후 취소 시 취소시점에 따라 위약금이 발생할 수 있습니다.</p>
    </div>
  </div>
    <div class="product-info-item ">
      <div class="product-info-title"><h2>취소 규정</h2></div>
      <div class="item-cont">
        <p>•출발일 15일전 취소: 취소 및 전액환불 가능</p>
        <p>•출발일 14~8일전 취소: 총 상품가의 10% 제외 한 금액 환불</p>
        <p>•출발일 7~4일 전 취소 : 총 상품가의 50% 제외 한 금액 환불</p>
        <p>•출발일 3일 전~당일 취소 : 전액 환불 불가</p>
        <p>•단, 골프장 취소수수료 규정이 자사의 규정보다 높을 경우 골프장에 따라 변경될 수 있습니다.</p>
    </div>
  </div>
</div>
</div>
 <!--골프장소개 페이지2 -->
 
      <div v-show= "divToggle2">
      <div class="container">
			
			<h3 style="font-weight: bold;">골프장 정보 </h3>
			<h5>${packageVo.fieldDto.fieldName}</h5>
					<hr>
					<div class="club-detail" >
					<div class="col-md-12 col-sm-12 col-xs-12 ">
						<!-- 골프장 안내문구 -->
						<p style="font-size: 13px;">${packageVo.fieldDto.fieldInfo}</p>
						
<!-- 						사진 영역 -->
						<div class="place_container">
							<div class="place_content">
								<div class="place_swiper_container">
									<div class="swiper-button-next" style="color: #b8e994;"></div>
									<div class="swiper-button-prev" style="color: #b8e994;"></div>
									<div class="swiper mySwiper round_swiper">
										<div class="swiper-wrapper">
											<c:choose>
												<c:when test="${empty list}">
													<div class="swiper-slide">
														<img src="${root}${profileUrl}">
													</div>
												</c:when>
												<c:otherwise>
													<c:forEach var="list" items="${list}">
														<div class="swiper-slide">
															<img src="${root}${profileUrl}${list.attachmentNo}">
														</div>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
						</div>
				</div>

						<!-- 골프장 정보 영역 -->
							<div class="container flex-grow ml-100"  >
								<ul class="detail-club-info">
									<li class="list-item">	
									<p class="title">지역</p>
									<div class="cont-box"><p class="text">${packageVo.fieldDto.fieldArea}</p></div>
									</li>
									<li class="list-item">
									<p class="title">상세주소</p>
									 <div class="cont-box"><p class="text">${packageVo.fieldDto.fieldBasicAddress}</p></div>
									</li>
									<li class="list-item">
									<p class="title">대표전화</p>
									 <div class="cont-box"><p class="text">${packageVo.fieldDto.fieldPhone}</p></div>
									</li>
									<li class="list-item">
									<p class="title">캐디피/카트피</p>
									 <div class="cont-box"><p class="text">${packageVo.fieldDto.fieldCartfee}원/ ${packageVo.fieldDto.fieldCaddiefee}원</p></div>
									</li>
									<li class="list-item">
									<p class="title">그린피</p>
									 <div class="cont-box"><p class="text">${packageVo.fieldDto.fieldGreenfee}원</p></div>
									</li>
								     <li class="list-item">
									<p class="title">개장일</p>
									 <div class="cont-box"><p class="text">${packageVo.fieldDto.fieldOpenday}</p></div>
									</li>
								</ul>
							</div>
		
		</div>
      </div>
      </div>
      </div>
  <!--숙소소개 페이지3 -->

      <div v-show= "divToggle3">
      <div class="container">
			
			<h3 style="font-weight: bold;">숙소 정보 </h3>
			<h5>${packageVo.stayDto.stayName}</h5>
					<hr>
					<div class="club-detail" >
					<div class="col-md-12 col-sm-12 col-xs-12 ">
						
						<!-- 사진 영역 -->
						<div class="place_container">
							<div class="place_content">
								<div class="place_swiper_container">
									<div class="swiper-button-next" style="color: #b8e994;"></div>
									<div class="swiper-button-prev" style="color: #b8e994;"></div>
									<div class="swiper mySwiper round_swiper">
										<div class="swiper-wrapper">
											<c:choose>
												<c:when test="${empty list}">
													<div class="swiper-slide">
														<img src="${root}${profileUrl}">
													</div>
												</c:when>
												<c:otherwise>
													<c:forEach var="list" items="${list}">
														<div class="swiper-slide">
															<img src="${root}${profileUrl}${list.attachmentNo}">
														</div>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
								</div>
							</div>

						<!-- 골프장 정보 영역 -->
							<div class="container flex-grow ml-100"  >
								<ul class="detail-club-info">
									<li class="list-item">	
									<p class="title">숙박방식</p>
									<div class="cont-box"><p class="text">${packageVo.stayDto.stayType}</p></div>
									</li>
									<li class="list-item">	
									<p class="title">숙박타입</p>
									<div class="cont-box"><p class="text">${packageVo.stayDto.stayRoom}</p></div>
									</li>
									<li class="list-item">	
									<p class="title">우편번호</p>
									<div class="cont-box"><p class="text">${packageVo.stayDto.stayPostAddress}</p></div>
									</li>
									<li class="list-item">
									<p class="title">상세주소</p>
									 <div class="cont-box"><p class="text">${packageVo.stayDto.stayBasicAddress}</p></div>
									</li>
									<li class="list-item">
									<p class="title">대표전화</p>
									 <div class="cont-box"><p class="text">${packageVo.stayDto.stayPhone}</p></div>
									</li>
								</ul>
							</div>
					
		
		</div>
      </div>
      </div>
      </div>
      
      
   <!--후기 페이지4 -->
      <div v-show= "divToggle4">
			<div class="row justify-content-center" >
				<div class="text-center mt-5 md-3">
					<h2 style="font-size: large; color: #7f7f7f">모든 골프장 후기를 모아모아,</h2>
					<h2 style="font-size: large; color: #7f7f7f">오직 골북이에서 골퍼들의 리뷰를 확인해보세요</h2>
					<div class="item-cont">
						<div class="img-box mt-5 mb-5">
							<h1 style="font-weight: bold; color: #afc666">⛳ . . . 🐢</h1>
						</div>
					</div>
					<div class="row justify-content-center mt-3 mb-3">
						<a href="${root}/review/list" class="btn"
							style="width: 50%; font-size: large">생생한 후기 보러가기</a>
				</div>
				</div>
				</div>
		</div>
				
				</section>
</div>

<script src="http://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const app = Vue.createApp({
        data(){
            return {
            	divToggle1:true,
            	divToggle2:false,
            	divToggle3:false,
            	divToggle4:false,
            };
        },
        computed:{

        },
        methods:{
        	buttonToggle1(){
        		this.divToggle1=true;
        		this.divToggle2=false;
        		this.divToggle3=false;
        		this.divToggle4=false;
        	},
        	buttonToggle2(){
        		this.divToggle1=false;
        		this.divToggle2=true;
        		this.divToggle3=false;
        		this.divToggle4=false;
        	},
        	buttonToggle3(){
        		this.divToggle1=false;
        		this.divToggle2=false;
        		this.divToggle3=true;
        		this.divToggle4=false;
        	},
        	buttonToggle4(){
        		this.divToggle1=false;
        		this.divToggle2=false;
        		this.divToggle3=false;
        		this.divToggle4=true;
        	},
        },
        watch:{

        },
        mounted(){

        }
    });
    app.mount("#app");
</script>

   
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

