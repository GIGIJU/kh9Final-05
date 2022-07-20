<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<body>

 <!-- END nav -->
	<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/golboogi">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span>Mypage<i class="fa fa-chevron-right"></i></span>
					</p>
					<p class="mb-0" style="font-size: 17px">회원 탈퇴</p>
				</div>
			</div>
		</div>
	</section>	
<div class="container">
	<div class="mt-3" align="center">
		<img src="${root}/images/golboogi-logo.png">
	</div>
	<br>
	<div class="mt-3" align="center">
		<h2>회원탈퇴가 완료되었습니다.</h2>
	</div>
	<hr>
	<br><br>
		<div class="mt-3" align="center">
			<h1>그동안 Golboogi를 이용해주셔서 감사합니다</h1><br>
			<h4>보다 나은 서비스로 찾아 뵙겠습니다.</h4>
		</div>
		<br>
		<div class="mt-3" align="center">
			<a href="${root}/" class="btn btn-success btn-lg btn-block">Golboogi</a>
		</div>
	<br><br>
	<hr>
</div>
<br><br><br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>