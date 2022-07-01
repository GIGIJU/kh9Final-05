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

<!-- 검색바 -->
<section class="ftco-section ftco-no-pb">
 <div class="container">
  <div class="row">
   <div class="col-md-12">
    <div class="search-wrap-1 ftco-animate fadeInUp ftco-animated">
     <form action="#" class="search-property-1">
      <div class="row no-gutters">
       <div class="col-lg d-flex">
        <div class="form-group p-4 border-0">
         <label for="#">지역</label>
         <div class="form-field">
<!--            <div class="icon"><span class="fa fa-search"></span></div> -->
            <div class="icon"><span class="fa fa-chevron-down"></span></div>
                 <select name="" id="" class="form-control">
                    <option value="">전체</option>
			        <option value="">경기도</option>
			        <option value="">강원도</option>
			        <option value="">전라도</option>
			        <option value="">경상도</option>
			        <option value="">제주도</option>
		      </select>
         </div>
       </div>
     </div>  
     <div class="col-lg d-flex">
      <div class="form-group p-4">
       <label for="#">체크인</label>
       <div class="form-field">
         <div class="icon"><span class="fa fa-calendar"></span></div>
         <input type="text" class="form-control checkin_date" placeholder="Check In">
       </div>
     </div>
   </div>
   <div class="col-lg d-flex">
    <div class="form-group p-4">
     <label for="#">체크아웃</label>
     <div class="form-field">
       <div class="icon"><span class="fa fa-calendar"></span></div>
       <input type="text" class="form-control checkout_date" placeholder="Check Out">
     </div>
   </div>
 </div>
 <div class="col-lg d-flex">
  <div class="form-group p-4">
   <label for="#">가격대</label>
   <div class="form-field">
     <div class="select-wrap">
      <div class="icon"><span class="fa fa-chevron-down"></span></div>
      <select name="" id="" class="form-control">
        <option value="">전체</option>
        <option value="">알뜰</option>
        <option value="">일반</option>
        <option value="">프리미엄</option>
      </select>
    </div>
  </div>
</div>
</div>
<div class="col-lg d-flex">
  <div class="form-group d-flex w-100 border-0">
   <div class="form-field w-100 align-items-center d-flex">
    <input type="submit" value="검색" class="align-self-stretch form-control btn btn-primary">
  </div>
</div>
</div>
</div>
</form>
</div>
</div>
</div>
</div>
</section>

<!-- 숙소 리스트 -->
<section class="ftco-section">
 <div class="container">
 
 <c:forEach var="stayDto" items="${list}" var="golfFieldDto" items="${list2}">
  <div class="row">
   <div class="col-md-4 ftco-animate fadeInUp ftco-animated">
    <div class="project-wrap hotel">
     <a href="detail?stayNo=${stayDto.stayNo}" class="img" style="background-image: url(images/hotel-resto-1.jpg);">
      <span class="price">알뜰</span>
    </a>
    <div class="text p-4">
      <span class="days"><fmt:formatNumber value=“${stayDto.stayPrice} ” type=“currency”/>~</span>
      <h3><a href="detail?stayNo=${stayDto.stayNo}">${stayDto.stayName}</a></h3>
      <p class="location"><span class="fa fa-map-marker"></span>지역</p>
      <ul>
       <li><span class="flaticon-mountains"></span>${golfFieldDto.fieldName}</li>
       <li><span class="flaticon-king-size"></span>${stayDto.stayType}</li>
     </ul>
   </div>
 </div>
</div>
</div>
</c:forEach>

<!-- 페이지네이션 -->
<div class="row mt-5">
  <div class="col text-center">
    <div class="block-27">
      <ul>
        <li><a href="#">&lt;</a></li>
        <li class="active"><span>1</span></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">&gt;</a></li>
      </ul>
    </div>
  </div>
</div>
</div>
</section>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
