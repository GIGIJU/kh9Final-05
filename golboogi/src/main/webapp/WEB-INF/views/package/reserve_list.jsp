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

<!-- 예약목록 -->
<section class="ftco-intro ftco-section ftco-no-pt">
  <div class="container">
  <div class="text-center mt-5 mb-5">
  <h3 style="font-weight: bold;">나의 투어 예약현황</h3>
  <hr>
  </div>
  <div class="tour-consult">
  <div style="margin:18px">
<ul id="rsvList" class="consult-list v-custom-scrollbar-y mCustomScrollbar " style="width: 430p; padding-right:32px; overflow: visible; height: 1285px;">
  <div id="mCSB_1" class="mCustomScrollBox" style="max-height: none;" tabindex="0">
  <div id="mCSB_1_container" class="mCSB_container" style="position: relative; top: 0px; left: 0px;" dir="ltr">
    <li id="reserve" class="list-item active">
  	<div class="item-cont">
  	 	<div class="flex-center">
  	 	  	 	<div class="label-box flex-grow">
  	 	  	 	<div>
  	 	  	 	<span class="tag-label">예약취소</span>
  	 	  	 	</div>
  	 	  	 	</div>
  	 	  	 	<p style="font-size: 15px; color: #ababab">2022-07-14</p>
  	 	 </div>
  	<p style="font-size: 24px; font-weight: 500; margin-top: 20px; width: 300px; color:black" class="ellipsis">파인밸리</p>
  	<div class="dp-f ">
  	<div class="cont-box">
  		<p class="mt-20" style="font-size: 18px; color:#black;">36홀그린피+골프텔+조식+로고상품</p>
  		<p class="mt-10 " style="font-size: 15px; color:#7f7f7f;">강원 • 삼척시</p>
  		</div>
  		<div class=img-box>
  		<img src="${root}/images/img_home_title_booking.jpg" class="img-thumb">
  		</div>
  	  	</div>
  	  	<div class="item-cont">
  	  	<div class="dp-f align-items-end">
  	  	<p>출발일 :</p>
  	  	<p>4명</p>  
  	  	</div>
  	</div>
  	
  </li>
  </div>
  </div>
  </ul>
  </div>
  </div>
  </section>
  


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
