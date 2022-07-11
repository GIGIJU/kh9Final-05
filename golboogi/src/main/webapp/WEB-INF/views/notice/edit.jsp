<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br><br><br>
<div class="container">
	<div align="center" class="mt-3">
		<h1>News & Notice</h1>
	</div>
	<br><br>

	<div class="mt-3">
		<form method="post">
			<div class="mt-3">
			<h3><label>Notice Head : </label></h3>
				<select name="noticeHead" class="form-control">
					<c:if test="${noticeDto.noticeHead != null}">
						<option value=""  <c:if test="${noticeDto.noticeHead == null}">selected</c:if>>선택</option>
						<option  <c:if test="${noticeDto.noticeHead == '이벤트'}">selected</c:if>>이벤트</option>
						<option  <c:if test="${noticeDto.noticeHead == '공지사항'}">selected</c:if>>공지사항</option>
						<option  <c:if test="${noticeDto.noticeHead == '정검'}">selected</c:if>>정검</option>
					</c:if>
				</select> 
			</div><br>
			<div class="mt-3">
				<h3><label>Notice Title : </label></h3>
				<input type="text" name="noticeTitle" value="${noticeDto.noticeTitle}" class="form-control">
			</div>
			<br><br>
			<div class="mt-3">
				<input type="submit" value="수정" class="btn btn-success btn-lg btn-block">
			</div>
		</form>
	</div>
	<br><hr><br>
	<div class="mt-3" align="center">
		<div class="mt-3">
			<a href="${root}/notice/delete/${noticeDto.noticeNo}" class="btn btn-danger btn-lg btn-block">삭제</a>
		</div>
		<br>
		<div class="mt-3">
			<a href="${root}/notice/detail/${noticeDto.noticeNo}" class="btn btn-success btn-lg btn-block">취소</a> 
		</div>
	</div>
</div>
<br><br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>