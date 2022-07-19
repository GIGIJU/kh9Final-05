<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
       <p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>pay<i class="fa fa-chevron-right"></i></span></p>
       <h1 class="mb-0 bread">pay</h1>
     </div>
   </div>
 </div>
</section>

<section class="ftco-intro ftco-section ftco-no-pt">
  <div class="container">
    <div class="row justify-content-center">
        <div class="text-center mt-5 md-3">
            <h3  style="font-weight: bold; color: #23aed2 ">🎉</h3>
    <h3  style="font-weight: bold; color: #23aed2 ">결제가 완료되었습니다.</h3>
    <h5 style="font-size: medium; color:#7f7f7f ">이용해 주셔서 감사합니다. 최고의 서비스를 제공하는 골북이가 되겠습니다.</h5>
<div class="item-cont">
      <div class="img-box">
        <img src="${root}/images/success_image.jpg" >
      </div>
      </div>
            <div class="row justify-content-center mt-3 mb-3">
         <a href="${root}/booking/mybooking" class="btn btn-success" style="width:30%;font-size: 15px ">나의 부킹 예약 확인하기</a>
         <br>
         <a href="${root}/package/reserve_list" class="btn btn-success" style="width:30%;font-size: 15px">나의 투어 예약 확인하기</a>
         </div>
            <div class="row justify-content-center mt-2mb-3">
         <a href="/" style="width:30%; text-decoration: underline; text-underline-position:under; color:#7f7f7f" >메인으로</a>
      </div>

</div>
</div>
</div>
</section>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
