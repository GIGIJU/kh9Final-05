<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	/*Yujin custom style*/
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
</style>

<!-- 패키지 상세  -->
<section class="ftco-intro ftco-section ftco-no-pt">
  <div class="container">
    
    <div class="row justify-content-center">
      <div class="tour-detail-info">
        <div class="info-item">
          <p>출발일</p>
          <p>날짜찍어줘</p>
        </div>
        <div class="info-item">
          <p>지역</p>
          <p>경상도</p>
        </div>
        <div class="info-item">
          <p>기간</p>
          <p>1박2일</p>
        </div>
      </div>
    </div>

    <!--예약 버튼 -->
    <div class="row justify-content-center">
      <div class="btn btn-primary">날짜변경</div>
      <div class="btn btn-primary">예약신청</div>
    </div>

    <!--페이지네이션 버튼 -->
    <div class="row justify-content-center">
    <div class="btn ">투어정보</div>
    <div class="btn ">골프장</div>
    <div class="btn">숙소</div>
  </div>

  <!--투어정보 페이지1 -->
   <div class="row justify-content-center tour-product-info">
      <div class="product-info-item ">
        <div class="product-info-title"><h2>투어 정보</h2></div>
        <div class="item-cont">
          <p>•뭘찍어줄까</p>
          <p>•어떤정보</p>
          <p>•출발일 7~4일 전 취소 : 총 상품가의 50% 제외 한 금액 환불</p>
          <p>•출발일 3일 전~당일 취소 : 전액 환불 불가</p>
          <p>•단, 골프장 취소수수료 규정이 자사의 규정보다 높을 경우 골프장에 따라 변경될 수 있습니다.</p>
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
 </section>

 <!--골프장소개 페이지2 -->


  <!--숙소소개 페이지3 -->


<form method="post">
	<input type="hidden" name="no" value="${stayDto.stayNo}">
	<!--<input type="number" name="quantity" value="1" min="1" required>-->
	<input type="submit" value="결제하기" formaction="pay_purchase">
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
