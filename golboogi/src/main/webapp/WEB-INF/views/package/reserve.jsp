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



<!--예약 정보 입력-->
<section class="ftco-intro ftco-section ftco-no-pt">
  <div class="container">
    
    <div class="row justify-content-center">
    <div class="text-center mt-5 mb-5">
      <h3 style="font-weight: bold;">예약 신청</h3>
    </div>
    </div>
    <div class="row justify-content-center tour-product-info">
            <div class="product-info-item2" >
        <div class="product-info-title" ><h5 style="color: #000; font-weight: bold;">상품 정보</h5></div>
        <div class="item-cont">
          <h2 style="color:#17a2b8">${packageVo.stayDto.stayName}</h2> 
          <hr>
          <p>• 출발일 : ${packageVo.packageDto.packageDepart} </p>
          <p>• 기간 : 1박2일</p>
          <p>• 지역 : ${packageVo.stayDto.stayLocal}</p>
      </div>
                <div class="item-cont">
      <div class="img-box">
        <img src="${root}/images/hotel-resto-1.jpg" style="height: 200px; width: 200px; border-radius: 70%;">
      </div>
      </div>
    </div>
    </div>
      <div class="row justify-content-center tour-product-info">
        <div class="product-info-item2 " >
  <div class="product-info-title " ><h5 style="color: #000; font-weight: bold;">신청 정보</h5>
          <h6 class="red">* 필수입력</h6>
        </div>
          <div class="item-cont">
            <h6  >이름 * </h6>
               <input type="text" value="${memberDto.memberName}" readonly="readonly" style="pointer-events: none;  background-color: #e0e0e0;     border-radius: 4px; border-style : none;">
               <div class="field-button-box"></div>
                                          <h6 >이메일 *</h6> 
               <input type="text" value="${memberDto.memberEmail}"  readonly="readonly" style="pointer-events: none;  background-color: #e0e0e0;     border-radius: 4px; border-style : none;">
               <div class="field-button-box" style="width:100%"></div>
            </div>
                      <div class="item-cont">
            <h6  >휴대폰 * </h6>
               <input type="text" value="${memberDto.memberPhone}" readonly="readonly" style="pointer-events: none;  background-color: #e0e0e0;     border-radius: 4px; border-style : none;">
               <div class="field-button-box"></div>
            </div>
        </div>
        </div>

        <div class="row justify-content-center tour-product-info">
          <div class="product-info-item2 " >
            <div class="product-info-title" ><h5 style="color: #000; font-weight: bold;">티업 정보</h5>
            <h6 class="red">* 필수입력</h6>
          </div>
            <div class="item-cont">
            <h6  > 1일차  </h6>
            <div class="select-box" >
						<select  style="width:100%">
						    <option value="" >골프장 선택 </option>
      					<option >${packageVo.fieldDto.fieldName}</option>
      					</select>
      						<select  style="width:100%">
						    <option value="" >희망타임 선택 </option>
      					<option >새벽</option>
      					<option >오전</option>
      					<option >오후</option>
      					<option >야간</option> 					
      					</select>
          </div>
                 <br>
            <h6 > 2일차  </h6>
            <div class="select-box" >
						<select  style="width:100%">
						    <option value="" >골프장 선택 </option>
      					<option >${packageVo.fieldDto.fieldName}</option>
      					</select>
      						<select  style="width:100%">
						    <option value="" >희망타임 선택 </option>
      					 <option >새벽</option>
      					<option >오전</option>
      					<option >오후</option>
      					<option >야간</option>
      					</select>
          </div>
            
				<br>
				<p style="color:gray; text-align: center;"> * 희망타임 선택 시 골프장에서 티타임이 랜덤으로 배정됩니다.</p>
          	
          </div>
          </div>
          </div>
          <div class="row justify-content-center tour-product-info">
            <div class="product-info-item " >
              <div class="product-info-title" ><h2 >결제 정보</h2>
            </div>
              <div class="item-cont">
                <h5 style="color:#fff; text-align: center; text-style:bold;">[숙박]    1인 기준 : <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${packageVo.stayDto.stayPrice}" />  </h5> 
                <h5 style="color:#fff; text-align: center; text-style:bold;">[티업]    1인 기준 : <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${packageVo.fieldDto.fieldGreenfee}" />  </h5> 
                <h5 style="color:#fff; text-align: center; text-style:bold;">신청 인원 : 4인 1팀 </h5> 
                <hr style="background-color :#fff">
                <div >
                <h3 style="color:#ffc107; font-weight: bold; text-decoration: underline; text-align: center;"> 총  <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${(packageVo.stayDto.stayPrice)*4 + (packageVo.fieldDto.fieldGreenfee)*4}" /></h3>
                </div>
                <br>
<!-- 					<p style="text-align: center;">* 결제하시면 티오프시간 등 최종 확인 후 연락을 -->
<!-- 						드립니다.</p> -->
				</div>

            </div>
            </div>
    <div class="row justify-content-center">
              <div class="text-center mt-5" style="width: 400px;">
                <h4 style="font-weight: bold;">약관 동의</h4> 
                <hr>
                <h2 style="font-weight: bold;">전체 동의</h2>
                <h2 style="font-weight: bold;">개인정보 수집 및 이용동의</h2>
                <h2 style="font-weight: bold;">개인정보 제3자 정보제공 동의</h2>

              </div>
              </div>

				
    <!--예약 버튼 -->
    <form method="post" action="reserve">
      <input type="hidden" name="packageNo" value="${packageVo.packageDto.packageNo}">
      <input type="hidden" name="packageTotalPrice" value="${(packageVo.stayDto.stayPrice)*4 + (packageVo.fieldDto.fieldGreenfee)*4}">
      <input type="hidden" name="quantity" value="1" min="1" required>
      <div class="row justify-content-center mt-5 mb-5">
        <button  class="btn btn-success p-3">예약하기</button>
      </div>
      </form>

    </div>
    </section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
