<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<body>

 <!-- END nav -->
	<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span>Notice<i class="fa fa-chevron-right"></i></span>
					</p>
					<p class="mb-0" style="font-size: 17px">공지사항</p>
				</div>
			</div>
		</div>
	</section>	


<div class="container">
	<div class="mt-3">
		<h1>News & Notice</h1>
	</div>
	<br> <br>
	<div class="offset-8" align="right">
		<!-- 검색창 -->
		<form class="form-inline" action="list" method="get">
			<div class="form-group col-xs-4" align="right">
				<input type="search" class="form-control" name="keyword" placeholder="검색어 입력"> 
		    </div>
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" class="btn btn-success btn-lg" value="검색">
		</form>
	</div>
	<br><br>
	
	<!-- 광고?,사진? -->
	
	<br><br>
	<div class="offset-10" align="right">
		<a href="write" class="btn btn-success btn-lg btn-block">글쓰기</a>
	</div>
	<br>
	<div class="mt-3">
		<table class="table table-border">
			<thead>
				<tr>
					<th>번호</th>
					<th>사진</th>
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
						<td>
							<a href="${root}/notice/detail/${noticeDto.noticeNo}">
								<img src="${pageContext.request.contextPath}${profileUrl}">
							</a>
						</td>
						<td><a href="${root}/notice/detail/${noticeDto.noticeNo}">
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
		<br><br>
		<!-- 숫자 링크 영역 -->
		<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
			<c:choose>
				<c:when test="${search}">
					<c:choose>
						<c:when test="${i == p}">
							<a class="active" href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i} &nbsp;</a>
						</c:when>
						<c:otherwise>
							<a href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i} &nbsp;</a>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${i == p}">
							<a class="active" href="list?p=${i}&s=${s}">${i} &nbsp;</a>
						</c:when>
						<c:otherwise>
							<a href="list?p=${i}&s=${s}">${i} &nbsp;</a>
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
<br><br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>