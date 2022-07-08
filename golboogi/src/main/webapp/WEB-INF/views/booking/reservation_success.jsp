<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>   
<section class="hero-wrap hero-wrap-2"
	style="background-image: url('${root}/images/bg_1.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-end justify-content-center"
			style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span>예약성공 <i class="fa fa-chevron-right"></i></span>
				</p>
				<p class="mb-0" style="font-size: 17px">부킹, 모든 골프장 예약은 골북이로 통합니다.</p>
			</div>
		</div>
	</div>
</section>

<div class="container-fluid mt-5" style="text-align: center; height: 500px;">
	<div class="col-md-4 offset-md-4 mb-5">
			<h5 style="font-weight: bold;">예약이 완료되었습니다</h5>
			<img src="https://image.smartscore.kr/pc4/img_illust_03.svg">
			<br><br>
			<a href="#" class="btn">내 예약 현황 보기</a>
	</div>
</div>
 
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>