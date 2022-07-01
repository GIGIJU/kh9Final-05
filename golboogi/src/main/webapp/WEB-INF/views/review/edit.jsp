<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br><br><br>
<div class="container w800 m30">
	<div>
		<h2>${reviewDto.reviewNo}번 후기글 수정</h2>
	</div>
	<br><br>
	
	<!-- 수정할 부분 -->
	<div>
		<form method="post">
			<div>
				<label>글 제목</label>
				<input type="text" name="reviewTitle" value="${reviewDto.reviewTitle}">
			</div>
			<div>
				<label>글 내용</label>
				<textarea rows="5" cols="60" name="reviewContent">${reviewDto.reviewContent}</textarea>
			</div>
			<div>
				<input type="submit" value="변경">
			</div>
		</form>
	</div>
	
	<!-- 버튼 구역 -->
	<div>
		<a href="${root}/review/list">취소</a> 
		<a href="${root}/review/delete/${reviewDto.reviewNo}">삭제</a>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>