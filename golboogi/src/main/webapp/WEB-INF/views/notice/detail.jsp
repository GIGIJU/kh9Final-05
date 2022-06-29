<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
<div class="container w800 m30">
	<div align="center">
		<h1>News & Notice</h1>
	</div>
	<br><br>

	<div>
		<h2>
			<c:if test="${noticeDto.noticeHead != null}">
				[${noticeDto.noticeHead}]
			</c:if>
			${noticeDto.noticeTitle}
		</h2>
	</div>
	<br><br>
	
	<div>
		${noticeDto.noticeTime} 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${noticeDto.noticeReadcount}
	</div>
	<br><br>
	<hr>
	
	<div align="center">
		<a href="${root}/notice/list">목록</a>
	</div>
	
	<div align="right">
		<a href="${root}/notice/edit/${noticeDto.noticeNo}">수정</a>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>