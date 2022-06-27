<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

 
 <section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/bg_1.jpg');">
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
      <div class="col-md-9 ftco-animate pb-5 text-center">
       <p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>Hotel <i class="fa fa-chevron-right"></i></span></p>
       <h1 class="mb-0 bread">booking</h1>
     </div>
   </div>
 </div>
</section>

<section class="ftco-section ftco-no-pb">
 <div class="container">
  <div class="row">
   <div class="col-md-12">
    <div class="search-wrap-1 ftco-animate">
     <form action="#" class="search-property-1">
      <div class="row no-gutters">
       <div class="col-lg d-flex">
        <div class="form-group p-4 border-0">
         <label for="#"> 어디로 가세요?</label>
         <div class="form-field">
           <div class="icon"><i class="fa-solid fa-location-dot"></i></div>
           <input type="text" class="form-control" placeholder="지역 선택">
         </div>
       </div>
     </div>
     <div class="col-lg d-flex">
      <div class="form-group p-4">
       <label for="#">언제 가세요?</label>
       <div class="form-field">
         <div class="icon"><span class="fa fa-calendar"></span></div>
         <input type="text" class="form-control checkin_date" placeholder="날짜 선택">
       </div>
     </div>
   </div>
 <div class="col-lg d-flex">
  <div class="form-group p-4">
   <label for="#">몇시에 치세요?</label>
   <div class="form-field">
     <div class="select-wrap">
      <div class="icon"><i class="fa-solid fa-golf-ball-tee"></i></div>
      <select name="" id="" class="form-control">
        <option value="">선택</option>
        <option value="">오전</option>
        <option value="">오후</option>
        <option value="">저녁</option>
        <option value="">야간</option>
      </select>
    </div>
  </div>
</div>
</div>
<div class="col-lg d-flex">
  <div class="form-group d-flex w-100 border-0">
   <div class="form-field w-100 align-items-center d-flex">
    <input type="submit" value="Search" class="align-self-stretch form-control btn btn-primary">
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
<section class="ftco-section">
 <div class="container">
  <div class="row">
<c:forEach var="golfFieldDto" items="${list}">
   <div class="col-md-4 ftco-animate">
    <div class="project-wrap hotel">
     <a href="detail?field_no=${golfFieldDto.fieldNo}" class="img" style="background-image: url(${root}/images/golf-dummy.jpg);">
    </a>
    <div class="text p-2">
      <span class="days"><fmt:formatNumber value="${golfFieldDto.fieldGreenfee}" />원~</span>
      <h3><a href="#">${golfFieldDto.fieldName}</a></h3>
      <p class="location"><span class="fa fa-map-marker"></span>지역</p>
   </div>
 </div>
</div>

</c:forEach>

</div>
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

<section class="ftco-intro ftco-section ftco-no-pt">
 <div class="container">
  <div class="row justify-content-center">
   <div class="col-md-12 text-center">
    <div class="img"  style="background-image: url(${root}/images/golf-dummy.jpg);">
     <div class="overlay"></div>
     <h2>We Are Pacific A Travel Agency</h2>
     <p>We can manage your dream building A small river named Duden flows by their place</p>
     <p class="mb-0"><a href="#" class="btn btn-primary px-4 py-3">Ask For A Quote</a></p>
   </div>
 </div>
</div>
</div>
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
