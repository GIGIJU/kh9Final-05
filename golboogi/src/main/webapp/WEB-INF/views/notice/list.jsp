<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
<div class="container w700 m30">
	<div class="row center">
		<h1>공지 게시판</h1>
	</div>
	<br> <br>
	<div align="right">
		<a href="write">글쓰기</a>
	</div>
	<br> <br>

	<div align="right">
		<!-- 검색창 -->
		<form action="list" method="get">
			<input type="search" name="keyword" placeholder="검색어 입력"
				value="${keyword}"> <input type="submit" value="검색">
		</form>
	</div>
	<br> <br>

	<div>
		<table class="table table-border">
			<thead>
				<tr>
					<th>번호</th>
					<th width="60%;">제목</th>
					<th>조회수</th>
					<th>시간</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${list.isEmpty()}">
					<tr>
						<td colspan="4" align="center">검색결과가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="noticeDto" items="${list}">
					<tr>
						<td>${noticeDto.noticeNo}</td>
						<td><a href="detail/${noticeDto.noticeNo}">
							<c:if test="${noticeDto.noticeHead != null}">
								[${noticeDto.noticeHead}] 
							</c:if>
								${noticeDto.noticeTitle} </a></td>
						<td>${noticeDto.noticeReadcount}</td>
						<td>${noticeDto.noticeTime}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

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