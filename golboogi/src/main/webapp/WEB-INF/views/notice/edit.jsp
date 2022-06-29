<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br><br><br>
<div class="container w800 m30">
	<div align="center">
		<h1>News & Notice</h1>
	</div>
	<br><br>

	<div>
		<form method="post">
			<select name="noticeHead">
				<c:if test="${noticeDto.noticeHead != null}">
					<option value=""  <c:if test="${noticeDto.noticeHead == null}">selected</c:if>>선택</option>
					<option  <c:if test="${noticeDto.noticeHead == '이벤트'}">selected</c:if>>이벤트</option>
					<option  <c:if test="${noticeDto.noticeHead == '공지사항'}">selected</c:if>>공지사항</option>
					<option  <c:if test="${noticeDto.noticeHead == '정검'}">selected</c:if>>정검</option>
				</c:if>
			</select> 
			<input type="text" name="noticeTitle" value="${noticeDto.noticeTitle}">
			<input type="submit" value="수정">
		</form>
	</div>
	
	<div align="center">
		<a href="${root}/notice/list">취소</a> 
		<a href="${root}/notice/delete/${noticeDto.noticeNo}">삭제</a>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>