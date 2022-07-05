<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
<style>
	.table{
		border: 1px solid black;
	}
</style>
<div class="container">
	<div class="row">
		<h4>사진 후기</h4>
	</div>
	<br><br>
	
	<!-- 검색창 -->
	<div align="left">
		<!-- 검색창 -->
		<form action="list" method="get">
			<input type="search" name="keyword" placeholder="검색어 입력" value="${keyword}"> 
			<input type="submit" value="검색">
		</form>
		
		<a href="${root}/review/write">글쓰기</a>
	</div>
	<br><br>
	
	<!-- 테이블 -->
	<div>
		<table class="table">
			<thead>
				<tr>
					<th>순서</th>
					<th>사진</th>
					<th>골프장</th>
					<th>제목</th>
					<th>회원평점</th>
					<th>조회/추천</th>
					<th>등록일자</th>
				</tr>
			</thead>
				<c:if test="${list.isEmpty()}">
					<tr>
						<td colspan="7" align="center">검색결과가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="reviewDto" items="${list}">
						<tr>
							<td>${reviewDto.reviewNo}</td>
							<td><a href="detail/${reviewDto.reviewNo}">사진</a></td>
							<td>${reviewDto.fieldName}</td>
							<td width="40%"><a href="detail/${reviewDto.reviewNo}">${reviewDto.reviewTitle}</a></td>
							<td>${reviewDto.reviewRating}</td>
							<td>${reviewDto.reviewReadcount}/${reviewDto.reviewSuggestion}</td>
							<td>${reviewDto.reviewTime}</td>
						</tr>
				</c:forEach>
			<tbody>
			
			</tbody>
		</table>
	</div>
	<br><br>
	
	<!-- pagenation	 -->
	<div align="center">
		<c:if test="${p > 1}">
			<c:choose>
				<c:when test="${search}">
					<a href="list?p=1&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a>
				</c:when>
				<c:otherwise>
					<a href="list?p=1&s=${s}">&laquo;</a>
				</c:otherwise>
			</c:choose>
		</c:if>
		
		<c:if test="${startBlock > 1}">
			<c:choose>
				<c:when test="${search}">
					<a href="list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a>
				</c:when>
				<c:otherwise>
					<a href="list?p=${startBlock-1}&s=${s}">&laquo;</a>
				</c:otherwise>
			</c:choose>
		</c:if>
		
		<!-- 숫자 링크 영역 -->
		<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
			<c:choose>
				<c:when test="${search}">
					<c:choose>
						<c:when test="${i == p}">
							<a class="active" href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${i == p}">
							<a class="active" href="list?p=${i}&s=${s}">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="list?p=${i}&s=${s}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<!-- 다음 버튼 영역 -->
		<c:if test="${endBlock < lastPage}">
			<c:choose>
				<c:when test="${search}">
					<a href="list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}">&gt;</a>
				</c:when>
				<c:otherwise>
					<a href="list?p=${endBlock+1}&s=${s}">&gt;</a>
				</c:otherwise>
			</c:choose>
		</c:if>
		
		<c:if test="${p < lastPage}">
			<c:choose>
				<c:when test="${search}">
					<a href="list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}">&raquo;</a>
				</c:when>
				<c:otherwise>
					<a href="list?p=${lastPage}&s=${s}">&raquo;</a>
				</c:otherwise>
			</c:choose>
		</c:if>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>