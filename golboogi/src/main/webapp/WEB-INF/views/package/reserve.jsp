<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>

<!-- 헤더 밑 이미지 타이틀 세션 -->
<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_1.jpg');">
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 350px;">
      <div class="col-md-9 ftco-animate pb-5 text-center">
       <p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>package <i class="fa fa-chevron-right"></i></span></p>
       <h1 class="mb-0 bread">package</h1>
     </div>
   </div>
 </div>
</section>



<!--예약 정보 입력-->
<section class="ftco-intro ftco-section ftco-no-pt">
  <div class="container">
    
    <c:forEach var="stayDto" items="${list}" var="golfFieldDto" items="${list2}" var="packageDto" items="${list3} ">
    <div class="row justify-content-center">
    <div class="text-center mt-5">
      <h3 style="font-weight: bold;">예약 신청</h3>
    </div>
    </div>
    <div class="row justify-content-center tour-product-info">
      <div class="product-info-item " >
        <div class="product-info-title" ><h2>상품 정보</h2></div>
        <div class="item-cont">
          <h2 style="color:#17a2b8">${stayDto.stayName}</h2> 
          <p>• 출발일 : ${packageDto.packageDepart}</p>
          <p>• 기간 : 1박2일</p>
          <p>• 지역 : 어케 찍어주지</p>
      </div>
      <div class="img-box">
        <img src="images/hotel-resto-1.jpg" style="height: 200px; width: 200px; border-radius: 30%;">
      </div>
    </div>
    </div>
      <div class="row justify-content-center tour-product-info">
        <div class="product-info-item " >
          <div class="product-info-title" ><h2>신청 정보</h2>
          <p>* 필수입력 사항</p>
        </div>
          <div class="item-cont">
            <h2 style="color:#17a2b8">이름 *</h2> 
            <h2 style="color:#17a2b8">휴대폰 *</h2> 
            <h2 style="color:#17a2b8">이메일 *</h2> 
        </div>
        </div>
        </div>
        <div class="row justify-content-center tour-product-info">
          <div class="product-info-item " >
            <div class="product-info-title" ><h2>티업 정보</h2>
            <p>* 필수입력 사항</p>
          </div>
            <div class="item-cont">
              <h2 style="color:#17a2b8">킹즈락(구.힐데스하임)</h2> 
              <p>• 출발일 : 찍어줍니다</p>
              <p>• 기간 : 찍어줍니다</p>
              <p>• 지역 : 찍어줍니다</p>
          </div>
          </div>
          </div>
          <div class="row justify-content-center tour-product-info">
            <div class="product-info-item " >
              <div class="product-info-title" ><h2>결제 정보</h2>
            </div>
              <div class="item-cont">
                <h5 style="color:#fff;">1인 기준 : ${stayDto.stayPrice} </h5>
                <h5 style="color:#fff;  ">신청 인원 : 4인</h5>
                <h1 style="color:#ffc107; font-weight: bold; text-decoration: underline;"> 예상결제금액 2,000,000원</h1> 
                <p>•신청하시면 확정가격/티오프시간 등 최종 확인 후 연락을 드립니다.</p>
                <p>• 골프장여건에 따라 확정시 가격변동될 수 있습니다.
                </p>
            </div>
            </div>
            </div>
            <div class="row justify-content-center">
              <div class="text-center mt-5">
                <h3 style="font-weight: bold;">약관 동의 *</h3>
                <hr>
              </div>
              </div>


    <!--예약 버튼 -->
    <div class="row justify-content-center mt-5 mb-5">
      <button class="btn btn-success p-3">신청하기</button>
    </div>

</c:forEach>
    </div>
    </section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
