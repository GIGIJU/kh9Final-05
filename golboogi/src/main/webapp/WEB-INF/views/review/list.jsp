<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span><a href="${root}/review/list">review <i class="fa fa-chevron-right"></i></a></span>
				</p>
				<p class="mb-0" style="font-size: 17px">Review 게시판</p>
			</div>
		</div>
	</div>
</section>	
<br><br><br><br>
<style>
	.table{
		border: 1px solid black;
	}
</style>
<div class="container">
	<div class="mt-3">
		<h2>Photo & Review</h2>
	</div>
	<br><br>
	
	<!-- 검색창 -->
	<div align="left" class="form-inline">
		<form action="list" method="get">
			<input class="form-control" type="text" name="keyword" placeholder="검색어 입력">&nbsp;
			<input class="btn btn-success btn-lg" type="submit" value="검색">
		</form>
	</div>
	<div class="mt-3" align="right">
		<a href="${root}/review/write" class="btn btn-success btn-lg">글쓰기</a>
	</div>
	<br><br>
	
	<!-- 테이블 -->
	<div>
		<table class="table table table-bordered">
			<thead align="center">
				<tr>
					<th>순서</th>
					<th>골프장</th>
					<th>제목</th>
					<th>회원평점</th>
					<th>조회/추천</th>
					<th>등록일자</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:if test="${list.isEmpty()}">
					<tr>
						<td colspan="7" align="center">검색결과가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="reviewDto" items="${list}">
						<tr>
							<td width="6%">${reviewDto.reviewNo}</td>
							<td width="10%">${reviewDto.fieldName}</td>
							<td width="40%" align="left"><a href="${root}/review/detail/${reviewDto.reviewNo}">${reviewDto.reviewTitle}</a></td>
							<td width="9%">${reviewDto.reviewRating}</td>
							<td width="9%">${reviewDto.reviewReadcount}&nbsp;/&nbsp;${reviewDto.reviewSuggestion}</td>
							<td width="12%">${reviewDto.reviewTime}</td>
						</tr>
				</c:forEach>
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
	<br><br><br>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>