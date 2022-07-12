<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span>Review Board<i class="fa fa-chevron-right"></i></span>
					</p>
					<p class="mb-0" style="font-size: 17px">리뷰 게시판</p>
				</div>
			</div>
		</div>
	</section>	
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