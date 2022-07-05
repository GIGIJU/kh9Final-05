<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
<div class="container">
	<div>
		<h2>후기 작성</h2>
	</div>
	<div>
		<form action="write" method="post">
			<div>
				<input type="hidden" name="reviewWriter" value="${memberId}">
			</div>
			<br><br>
			
			<div>
				<input type="text" name="fieldName" value="${golfFieldDto.fieldName}" placeholder="골프장명">
			</div>
			<br><br>
			
			<div>
				<input type="text" name="reviewTitle" placeholder="글제목">
			</div>
			<br><br>
			
			
			<div>
				<input type="text" name="reviewRating" placeholder="개인평가 : 10점 만점">
			</div>
			<br><br>
			
			<div>
				<input type="text" name="reviewCaddie" placeholder="캐디 : 10점 만점">
			</div>
			<br><br>
			
			<div>
				<input type="text" name="reviewCos" placeholder="코스 : 10점 만점">
			</div>
			<br><br>
			
			<div>
				<input type="text" name="reviewPrice" placeholder="가격 : 10점 만점">
			</div>
			<br><br>
			
			<div>
				<input type="text" name="reviewFacility" placeholder="시설 : 10점 만점">
			</div>
			<br><br>
			<hr>
			
			<div>
				<textarea rows="5" cols="60" name="reviewContent"></textarea>
			</div>
			
			<div>
				<input type="submit" value="등록">
			</div>
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>