<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- fmt에서는 formatDate, formatNumber를 사용한다 --%>

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

</style>

<!-- 헤더 밑 이미지 타이틀 세션 -->
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
      <div class="col-md-9 ftco-animate pb-5 text-center">
       <p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>mypage<i class="fa fa-chevron-right"></i></span></p>
       <h1 class="mb-0 bread">mypage</h1>
     </div>
   </div>
 </div>
</section>

<h1>결제 내역 상세 페이지</h1>

<h2>대표 정보</h2>

<ul>
	<li>결제 번호 : ${paymentDto.paymentNo}</li>
	<li>거래 번호 : ${paymentDto.paymentTid}</li>
	<li>거래 상품명 : ${paymentDto.paymentName}</li>
	<li>거래 금액 : ${paymentDto.paymentTotal}</li>
	<li>거래 시각 : ${paymentDto.paymentTime}</li>
	<li>
		거래 시각 : 
		<fmt:formatDate 
				value="${paymentDto.paymentTime}" 
				pattern="y년 M월 d일 E a h시 m분 s초"></fmt:formatDate>
	</li>
</ul>

<a href="#">전체 취소</a>

<h2>상세 내역</h2>

<c:forEach var="paymentDetailDto" items="${paymentDetailList}">
	<div>
		<h3>
			이름 : ${paymentDetailDto.paymentDetailName} , 
			개수 : ${paymentDetailDto.paymentDetailQuantity}개 , 
			금액 : ${paymentDetailDto.paymentDetailPrice}원
<a href="cancel?paymentDetailNo=${paymentDetailDto.paymentDetailNo}">취소하기</a>
		</h3>
	</div>
</c:forEach>

<h2>API 조회 결과</h2>

<ul>
	<li>결제 상태 : ${responseVO.status}</li>
	<li>결제 방법 : ${responseVO.payment_method_type}</li>
</ul>

<h3>결제 진행 단계</h3>
<ul>
	<c:forEach var="paymentActionDetailVO" items="${responseVO.payment_action_details}">
		<li>
			[${paymentActionDetailVO.payment_action_type}]
			금액 : ${paymentActionDetailVO.amount}원
			(${paymentActionDetailVO.approved_at})

		</li>
	</c:forEach>
</ul>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>