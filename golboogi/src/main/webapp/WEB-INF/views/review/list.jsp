<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!-- css 파일 추가 -->
    <link rel="stylesheet" href="${root}/css/mastar2.css">

<!--xeicon 추가 눈 아이콘 임시-->
<link rel="stylesheet" 
href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"
/>

<body>

 <!-- END nav -->
	<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span>Review Board<i class="fa fa-chevron-right"></i></span>
					</p>
					<p class="mb-0" style="font-size: 17px">리뷰 게시판</p>
				</div>
			</div>
		</div>
	</section>	


<div class="container">
	<div class="mt-3">
		<h2>Photo & Review</h2>
	</div>
	<br><br>
	
	<!-- 검색창 -->
	<div class="both" style="display: flex; justify-content: space-between;">
	<div align="left" class="form-inline">
		<form action="list" method="get">
			<input class="form-control" type="text" name="keyword" placeholder="검색어 입력">&nbsp;
			<input class="btn btn-success btn-lg" type="submit" value="검색">
		</form>
	</div>
	<div class="mt-3" align="right">
		<a href="${root}/review/write" class="btn btn-success btn-lg">글쓰기</a>
	</div>
	</div>
	<br><br>
	
	<!-- 테이블 -->
	<div class="photo_review_container" >
		<!-- <table class="table table table-bordered">
			<thead align="center">
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
			<tbody align="center">
				<c:if test="${list.isEmpty()}">
					<tr>
						<td colspan="7" align="center">검색결과가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="reviewDto" items="${list}">
						<tr>
							<td width="14%"><a href="${root}/review/detail/${reviewDto.reviewNo}"><img src="#" alt="사진"></a></td>
							<td width="40%" align="left"><a href="${root}/review/detail/${reviewDto.reviewNo}">${reviewDto.reviewTitle}</a></td>
							<td width="9%">${reviewDto.reviewRating}</td>
							<td width="9%">${reviewDto.reviewReadcount}&nbsp;/&nbsp;${reviewDto.reviewSuggestion}</td>
							<td width="12%">${reviewDto.reviewTime}</td>
						</tr>
				</c:forEach>
			</tbody>
		</table> -->

		<ul>
			<li>
				<div class="review_content">
					<div class="review_user_photo"><a href="${root}/review/detail/${reviewDto.reviewNo}"><span></span><!--<img src="#" alt="사진">--></a></div>
					<div class="review_user_comment">
						<div class="user_review_rating"><a href=""><!--${reviewDto.reviewRating}-->7.0<span>자세히보기</span></a></div>
						<div class="review_user_comment_name_con">
							<div class="user_review_name"><span>최**</span></div>
							<div class="user_review_con"><a href="${root}/review/detail/${reviewDto.reviewNo}">${reviewDto.reviewTitle}</a></div>
						</div>
						<div class="review_user_comment_time_read_count">
							<div class="user_review_time"><span>${reviewDto.reviewTime}</span></div>
							<!-- 임시로 xeicon 눈 -->
							<div class="user_review_read_icon"><span class="xi-eye-o"></span></div>
							<!-- <a href="https://www.flaticon.com/kr/free-icons/" title="눈 아이콘"></a> -->
							<div class="user_review_read">${reviewDto.reviewReadcount}</div>
						</div>
						
					</div>
				</div>
			</li>
		</ul>
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