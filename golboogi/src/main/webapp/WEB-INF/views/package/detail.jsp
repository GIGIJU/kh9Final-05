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

</style>

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
      <button class="btn btn-success p-2" style="margin-right: 5px">날짜변경</button>
      <button class="btn btn-success"><a href="${root}/package/reserve?packageNo=${packageVo.packageDto.packageNo}" style="color:white" >예약신청</a></button>
    </div>

    <!--페이지네이션 버튼 -->
    <div class="row justify-content-center mt-5 mb-5">
      <button class="button-toggle" style="width: 200px;"  >투어정보</button>
      <button class="button-toggle" style="width: 200px;"  >골프장</button>
      <button class="button-toggle" style="width: 200px;" >숙소</button>
      <button class="button-toggle" style="width: 200px;" >후기</button>
    </div>

   <!--투어정보 페이지1 -->
   <div class="row justify-content-center tour-product-info">
      <div class="product-info-item ">
        <div class="product-info-title"><h2>투어 정보</h2></div>
        <div class="item-cont">
		 <p>•조식 : ${packageVo.packageDto.packageBreakfast}</p> 
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

  <!--숙소소개 페이지3 -->

   <!--후기 페이지4 -->

   
   </section>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

