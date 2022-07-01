<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="check1" value="${reviewDto.reviewNo}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
<style>
	.table{
		border: 1px solid black;
	}
</style>
<div class="container">
	<div>
		<h2>${reviewDto.reviewNo}번 후기글</h2>
	</div>
	<br><br>
	
	<!-- Head -->
	<div>
		<h4>${revieDto.reviewTitle}</h4><br><br>
		골프장명 : ${reviewDto.fieldName} &nbsp;&nbsp;&nbsp;&nbsp; 작성자 : ${reviewDto.reviewWriter} &nbsp;&nbsp;&nbsp;&nbsp;
		장성일 : ${reviewDto.reviewTime} &nbsp;&nbsp;&nbsp;&nbsp; 조회수/추천 : ${reviewDto.reviewReadcount}/${reviewDto.reviewSuggestion}
	</div>
	<br><br>
	<div>
		평점 : ${reviewDto.reviewRating} &nbsp;&nbsp; 캐디서비스 : ${reviewDto.reviewCaddie} &nbsp;&nbsp;
		코스관리 : ${reviewDto.reviewCos} &nbsp;&nbsp; 가격만족도 : ${reviewDto.reviewPrice} &nbsp;&nbsp; 시설만족도 : ${reviewDto.reviewFacility}
	</div>
	<br><br>
	
	<!-- 내용 -->
	<div>
<pre>
${reviewDto.reviewContent}
</pre>
	</div>
	<br><br>
	<hr>
	<br><br>
	<!-- otherlist -->
	<div>
		<table class="table">
			<thead>
				<tr>
					<th>순서</th>
					<th>아이디</th>
					<th width="40%">제목</th>
					<th>평점</th>
					<th>등록일자</th>
					<th>조회/추천</th>
				</tr>
			</thead>
				<c:if test="${list.isEmpty()}">
					<tr>
						<td colspan="6" align="center">검색결과가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="reviewDto" items="${list}">
					<c:if test="${reviewDto.reviewNo != check1}">
						<tr>
							<td>${reviewDto.reviewNo}</td>
							<td>${reviewDto.reviewWriter}</td>
							<td><a href="detail/${reviewDto.reviewNo}">${reviewDto.reviewTitle}</a></td>
							<td>${reviewDto.reviewRating}</td>
							<td>${reviewDto.reviewTime}</td>
							<td>${reviewDto.reviewReadcount}/${reviewDto.reviewSuggestion}</td>
						</tr>
					</c:if>
				</c:forEach>
			<tbody>
			</tbody>
		</table>
	</div>
	
	<!-- 버튼 -->
	<div align="center">
		<a href="${root}/review/list">목록</a>
	</div>
	
	<div align="right">
		<a href="${root}/review/edit/${reviewDto.reviewNo}">수정</a>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>