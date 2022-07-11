<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
<div class="container">
	<div class="mt-3">
		<h2>후기 작성</h2>
	</div>
	<div class="mt-3">
		<form action="write" method="post">
			<div class="mt-3">
				<input type="hidden" name="reviewWriter" value="${memberId}">
			</div>
			<br><br>
			<div class="mt-3">
				<input type="text" class="form-control" name="fieldName" value="${golfFieldDto.fieldName}" placeholder="골프장명">
			</div>
			<br><br>
			<div class="mt-3">
				<input type="text" class="form-control" name="reviewTitle" placeholder="글제목">
			</div>
			<br><br>
			<div class="mt-3">
				<input type="text" class="form-control" name="reviewRating" placeholder="개인평가 : 10점 만점">
			</div>
			<br><br>
			
			<div class="mt-3">
				<input type="text" class="form-control" name="reviewCaddie" placeholder="캐디 : 10점 만점">
			</div>
			<br><br>
			<div class="mt-3">
				<input type="text" class="form-control" name="reviewCos" placeholder="코스 : 10점 만점">
			</div>
			<br><br>
			<div class="mt-3">
				<input type="text" class="form-control" name="reviewPrice" placeholder="가격 : 10점 만점">
			</div>
			<br><br>
			<div class="mt-3">
				<input type="text" class="form-control" name="reviewFacility" placeholder="시설 : 10점 만점">
			</div>
			<br><br>
			<div class="mt-3">
				<span>글작성</span>
				<textarea rows="5" class="form-control" cols="60" name="reviewContent"></textarea>
			</div>
			<br><hr><br>
			<div class="mt-3">
				<input type="submit" class="btn btn-success btn-lg btn-block" value="등록">
			</div>
		</form>
	</div>
	<br><br><br><br>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>