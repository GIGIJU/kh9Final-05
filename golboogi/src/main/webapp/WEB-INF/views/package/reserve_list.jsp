<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
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
      width: 80%;
      padding: 30px;
      background-color:#343a40;
      border-radius: 15px;
  }

  .tour-product-info .product-info-item2 {
    display: flex;
    width: 80%;
    padding: 30px;
    background-color:#f8f9fa;
    color: #000;
    border-radius: 15px;
    border-bottom: 1px solid #c7c7c7;
}

  .tour-product-info .product-info-item .item-title {
    width: 240px;
    font-size: 20px;
    font-weight: 700;

}

  .tour-product-info .product-info-item .item-cont {
    flex: 1;
    flex-grow: 1;
    flex-shrink: 1;
    flex-basis: 0%;
    margin-left: 80px;
    
}

.tour-product-info .product-info-item2 .item-title {
  width: 240px;
  font-size: 20px;
  font-weight: 700;
     
}

.tour-product-info .product-info-item2 .item-cont {
  flex: 1;
  flex-grow: 1;
  flex-shrink: 1;
  flex-basis: 0%;
  margin-left: 80px;
  
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

.field-button-box {
    display: flex;
    align-items: center;
    position: relative;
    height: 30px;
    z-index: 2;
}

.select-box {
    display: flex;
    position: relative;
    width: 100%;
    cursor: pointer;
}


    <!-- 셀렉 박스 눌렀을시 placehoder 설정 -->
        select option[value=""][disabled] {
	        display: none;
        }
        
.tour-consult {
    display: flex;
}

.tour-consult .consult-list {
    position: relative;
    width: 400px;
    margin-right: 50px;
}

.mCustomScrollbar {
    touch-action: pinch-zoom;
}

.mCustomScrollBox {
    position: relative;
    overflow: hidden;
    height: 100%;
    max-width: 100%;
    outline: none;
    direction: ltr;
}

.mCSB_container {
    overflow: hidden;
    width: auto;
    height: auto;
}

.tour-consult .consult-list .list-item {
    padding: 20px;
    background-color: #fff;
    border: 2px solid transparent;
    border-radius: 15px;
    cursor: pointer;
    transition: all .3s ease-in-out;
}

.tour-consult .consult-list .list-item.active {
    border-color: #00cbe2;
    cursor: default;
}

.flex-center {
    display: flex;
    justify-content: center!important;
    align-items: center!important;
    position: relative;
}

.label-box {
    display: flex;
    z-index: 2;
}

.flex-grow {
    flex: 1;
}

.tag-label {
    display: inline-flex;
    justify-content: center;
    align-items: center;
    position: relative;
    height: 26px;
    padding: 0 8px;
    line-height: 1.3;
    font-size: 13px;
    font-weight: 400;
    color: #fff!important;
    letter-spacing: .2px;
    white-space: nowrap;
    background-color: rgba(0,0,0,.3);
    border-radius: 5px;
}

.ellipsis {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.dp-f {
    display: flex;
}

.tour-consult .consult-list .item-cont .cont-box {
    flex: 1;
}

.align-items-end {
    align-items: flex-end!important;
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
    background-color: #999999;
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


.booking-detail-list {
    display: flex;
    flex-direction: column;
    position: relative;
    margin-top: 20px
px
;
    background-color: #fff;
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
	});
	</script>
<!-- 헤더 밑 이미지 타이틀 세션 -->
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
      <div class="col-md-9 ftco-animate pb-5 text-center">
       <p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>package <i class="fa fa-chevron-right"></i></span></p>
       <h1 class="mb-0 bread">package</h1>
     </div>
   </div>
 </div>
</section>

<!-- 예약목록 -->
<section class="ftco-intro ftco-section ftco-no-pt">
  <div class="container">
  <div class="text-center mt-5 mb-5">
  <h3 style="font-weight: bold;">나의 투어 예약현황</h3>
  <hr>
  </div>
  </div>
  
  <!-- 토글버튼 -->
      <div class="row justify-content-center mt-5 mb-5" >
      <button class="button-toggle "  id="button-toggle1"  style="width: 200px;"  >예약(현장결제)</button>
      <button class="button-toggle "  id="button-toggle2"  style="width: 200px;"  >선결제</button>
      </div>
      
   <!--현장결제 페이지1 -->
   <div id= "divToggle1" style="display: none ; ">
   <div class="row justify-content-center tour-product-info">
	<div  class="booking-detail-list">
	<div class="container" style="padding:40px; color:#999999">
			<h6>예약상태</h6>
			<h5>예약날짜</h5>
			<h5>예약날짜</h5>
			<hr>
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
									<p class="title">출발일</p>
									 <div class="cont-box"><p class="text">${packageVo.fieldDto.fieldPhone}</p></div>
									</li>
									<li class="list-item">
									<p class="title"></p>
									 <div class="cont-box"><p class="text">${packageVo.fieldDto.fieldCartfee}원/ ${packageVo.fieldDto.fieldCaddiefee}원</p></div>
									</li>
									<li class="list-item">
									<p class="title">그린피</p>
									 <div class="cont-box"><p class="text">${packageVo.fieldDto.fieldGreenfee}원</p></div>
									</li>
								</ul>
							</div>
	<hr>
		
	</div>
  </div>
  </div>
  </div>
  
     <!--선결제 페이지2 -->
   <div id= "divToggle2" style="display: none ; ">
   <div class="row justify-content-center tour-product-info">
	<div  class="booking-detail-list">
	<div class="container" style="padding:40px; color:#999999">
			<h6>예약상태</h6>
			<h5>예약날짜</h5>
			<h5>예약날짜</h5>
			<hr>
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
									<p class="title">출발일</p>
									 <div class="cont-box"><p class="text">${packageVo.fieldDto.fieldPhone}</p></div>
									</li>
									<li class="list-item">
									<p class="title"></p>
									 <div class="cont-box"><p class="text">${packageVo.fieldDto.fieldCartfee}원/ ${packageVo.fieldDto.fieldCaddiefee}원</p></div>
									</li>
									<li class="list-item">
									<p class="title">그린피</p>
									 <div class="cont-box"><p class="text">${packageVo.fieldDto.fieldGreenfee}원</p></div>
									</li>
								</ul>
							</div>
	<hr>
		
	</div>
  </div>
  </div>
  </div>
  </section>
  


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
