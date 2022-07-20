<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/images/img_home_title_booking.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-end justify-content-center"
			style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span>err <i class="fa fa-chevron-right"></i></span>
				</p>
				<p class="mb-0" style="font-size: 15px">부킹, 모든 골프장 예약은 골북이로 통합니다.</p>
			</div>
		</div>
	</div>
</section>
<br><br><br><br>
	<div class="container mb-5">
	<div class="col-md-7 offset-md-3 text-center">
		<div class="row">
			<h1>페이지를 찾을 수 없습니다.</h1>
		</div>
		
		<div class="row mt-3" style="width: 60%; float:none; margin:0 auto">
			<img src = "${pageContext.request.contextPath}/images/404.jpg" class="fill img img">		
		</div>
	</div>
	</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>