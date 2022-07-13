<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span class="mr-2"><a href="${root}/notice/list">notice <i class="fa fa-chevron-right"></i></a></span>
					<span class="mr-2"><a href="${root}/notice/detail/${noticeDto.noticeNo}">detail <i class="fa fa-chevron-right"></i></a></span>
				</p>
				<p class="mb-0" style="font-size: 17px">${noticeDto.noticeNo}번 공지게시판 상세페이지</p>
			</div>
		</div>
	</div>
</section>	
<br><br><br><br>
<style>
	#menu-text{
		font-size: 1.2em;
	}
</style>
<div class="container">
	<div align="center" class="mt-3">
		<h1>News & Notice</h1>
	</div>
	<c:if test="${golfManagerDto.golfManagerId != null}">
		<div align="right" class="mt-3">
			<a href="${root}/notice/edit/${noticeDto.noticeNo}" class="btn btn-success btn-lg">수정</a>
		</div>
	</c:if>
	<br><br>

	<div class="mt-3">
		<div class="mt-3" align="left">
			<h2>
				<c:if test="${noticeDto.noticeHead != null}">
					[${noticeDto.noticeHead}]
				</c:if>
				${noticeDto.noticeTitle}
			</h2>
		</div>
		
		<div class="mt-3" align="right" id="menu-text">
			작성시간 : ${noticeDto.noticeTime} 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			조회수 : ${noticeDto.noticeReadcount}
		</div>
	</div>
	<br><br>
	<hr>
	<!-- 사진 영역 -->
	<br>
		<!-- 프로필 이미지 -->
		<div class="mt-3" align="center">
			<img src="${pageContext.request.contextPath}${profileUrl}" width="80%" height="100%" class="img img-circle img-shadow">
		</div>
	
	<br>
	<hr>
	<br><br>
	<div align="center" class="mt-3">
		<h2><a href="${root}/notice/list" class="btn btn-success btn-lg btn-block">목록</a></h2>
	</div>
</div>
<br><br><br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>