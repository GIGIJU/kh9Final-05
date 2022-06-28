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


<section class="ftco-intro ftco-section ftco-no-pt mt-4">
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