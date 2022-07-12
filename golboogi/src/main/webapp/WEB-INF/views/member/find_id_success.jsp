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
						<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span>Mypage<i class="fa fa-chevron-right"></i></span>
					</p>
					<p class="mb-0" style="font-size: 17px">아이디 찾기</p>
				</div>
			</div>
		</div>
	</section>	
	
<div class="container">
	<br><br>
	<div class="mt-3" align="center">
		<img src="${root}/images/golboogi-logo.png">
	</div>
	<br><br>
	<div class="mt-3" align="center">
		<h1>아이디 찾기 결과</h1>
	</div>
	<br><br>
	<div class="mt-3" align="center">
		<h2>아이디 : ${findUserId} 입니다.</h2>
	</div>
	<br><hr><br>
	<div class="mt-3" align="center">
		<a href="${root}/member/login" class="btn btn-success btn-lg btn-block">로그인</a>
	</div>
	<br>
	<div class="mt-3" align="center">
		<a href="${roo}/member/find_pw" class="btn btn-success btn-lg btn-block">비밀번호 찾기</a>
	</div>
</div>
<br><br><br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>