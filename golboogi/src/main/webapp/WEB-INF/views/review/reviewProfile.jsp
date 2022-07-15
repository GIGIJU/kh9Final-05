<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
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
		<c:if test="${attachmentNo != 0}">
		<label>기존 사진</label>
			<ul>
				<li>${attachmentDto.attachmentUploadname}</li>
			</ul>
			<br>
		</c:if>
	</div>
	<div class="mt-3">
		<form method="post" enctype="multipart/form-data">
			<div class="mt-3">
				<span>사진</span>
				<input type="file" name="reviewProfile" class="form-control" value="null">
			</div>
			<br><br>
			<div class="mt-3">
				<input type="submit" value="수정" class="btn btn-success btn-lg btn-block">
			</div>
		</form>
	</div>
</div>
<br><br><br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>