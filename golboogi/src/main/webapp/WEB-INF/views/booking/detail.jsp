<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<style>

</style>
 
 <section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/bg_1.jpg');">
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
      <div class="col-md-9 ftco-animate pb-5 text-center">
       <p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>booking <i class="fa fa-chevron-right"></i></span></p>
       <h1 class="mb-0 bread">detail</h1>
     </div>
   </div>
 </div>
</section>


<div class="container-fluid">
	<div class="row mt-5">
		<div class="col-md-6 offset-md-3 text-center">
			<h2 style="font-weight: bold;">${golfFieldDto.fieldName}</h2>
		</div>
		<div class="col-md-6 offset-md-3 text-center">
			<img src="${root}/images/golf-dummy.jpg" width="400px" height="300px">
		</div>
		<div class="col-md-4 offset-md-4 mt-2">
			<span style="font-size: 9px;">${golfFieldDto.fieldInfo}</span>
		</div>
	</div>
	<div class="row mt-5">
		<div class="col-md-8 offset-md-2 text-center">
			<button class="btn btn-success">타임정보</button>
			<button class="btn btn-success">골프장정보</button>
		</div>
	</div>
	<div class="row mt-5 text-center col-md-6 offset-md-3"> 
	<c:forEach var="i" begin="1" end="10" step="1">
		<div class="col-md-4 ftco-animate mt-2">
			<div style="border: black solid 1px">
		      <span class="days"><fmt:formatNumber value="${golfFieldDto.fieldGreenfee}" />원~</span>
		      <h5><a href="#">${golfFieldDto.fieldName}</a></h5>
		   </div>
		</div>
	</c:forEach>
	
	<hr>
	<c:forEach var="i" begin="1" end="10" step="1">
		
	</c:forEach>
	</div>
	
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>