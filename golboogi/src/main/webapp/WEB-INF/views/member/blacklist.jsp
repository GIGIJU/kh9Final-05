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
					<span>Blacklist<i class="fa fa-chevron-right"></i></span>
				</p>
				<p class="mb-0" style="font-size: 17px">블랙리스트</p>
			</div>
		</div>
	</div>
</section>
<br><br>
<div class="container">
	<div class="mt-3 col-12" align="center">
		<img src="#" width="500px;" height="500px;" alt="사진">
	</div>
	<br>
	<div class="mt-3 col-12" align="center">
		<h1>블랙리스트에 등록된 아이디라  로그인할 수 없습니다.</h1>
	</div>
	<br><br>
	<div class="mt-3">
		<a href="${root}/" class="btn btn-success btn-lg btn-block">Golboogi</a>
	</div>
</div>
	
<br><br><br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>