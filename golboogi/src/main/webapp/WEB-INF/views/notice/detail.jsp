<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
<div class="container">
	<div align="center" class="mt-3">
		<h1>News & Notice</h1>
	</div>
	
	<div align="right" class="mt-3">
		<a href="${root}/notice/edit/${noticeDto.noticeNo}" class="btn btn-success btn-sm">수정</a>
	</div>
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
		
		<div class="mt-3" align="right">
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