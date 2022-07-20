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
					<span class="mr-2"><a href="/golboogi">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span class="mr-2"><a href="${root}/review/list">review <i class="fa fa-chevron-right"></i></a></span>
					<span class="mr-2"><a href="${root}/review/edit/${reviewDto.reviewNo}">edit <i class="fa fa-chevron-right"></i></a></span>
				</p>
				<p class="mb-0" style="font-size: 17px">${reviewDto.reviewNo}번 후기 게시글(수정)</p>
			</div>
		</div>
	</div>
</section>	
<br><br><br><br>
<div class="container">
	<div class="mt-3">
		<h2>${reviewDto.reviewNo}번 후기글 수정</h2>
	</div>
	<br><br>
	
	<!-- 수정할 부분 -->
	<div class="mt-3">
		<form method="post">
			<div class="mt-3">
				<label>글 제목</label>
				<input type="text" name="reviewTitle" class="form-control" value="${reviewDto.reviewTitle}">
			</div>
			<br>
			<div class="mt-3">
				<label>글 내용</label>
				<textarea rows="5" class="form-control" cols="60" name="reviewContent">${reviewDto.reviewContent}</textarea>
			</div>
			<br>
			<br><br>
			<div class="mt-3">
				<input type="submit" class="btn btn-success btn-lg btn-block" value="변경">
			</div>
		</form>
	</div>
	<br>
	<!-- 버튼 구역 -->
	<div class="mt-3">
		<a href="${root}/review/delete/${reviewDto.reviewNo}" class="btn btn-danger btn-lg btn-block">삭제</a>
	</div>
	<br>
	<div class="mt-3">
		<a href="${root}/review/detail/${reviewDto.reviewNo}" class="btn btn-secondary btn-lg btn-block">취소</a> 
	</div>
	<br><br>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>