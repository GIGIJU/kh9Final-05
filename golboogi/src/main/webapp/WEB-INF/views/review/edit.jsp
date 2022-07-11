<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br><br><br>
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
		<a href="${root}/review/list" class="btn btn-secondary btn-lg btn-block">취소</a> 
	</div>
	<br><br>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>