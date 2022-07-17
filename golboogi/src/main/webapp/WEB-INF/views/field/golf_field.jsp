<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<body>

	<!-- END nav -->
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${root}/images/img_home_title_booking.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center"
				style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/">Home <i
								class="fa fa-chevron-right"></i></a></span> <span>Field<i
							class="fa fa-chevron-right"></i></span>
					</p>
					<p class="mb-0" style="font-size: 17px">골프장</p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<c:forEach var="golfFieldDto" items="${list}">
					<div class="col-md-4 ftco-animate">
						<div class="project-wrap hotel">
							<c:choose>
								<c:when test="${golfFieldDto.attachmentNo != 0}">
									<a href="${root}/field/detail/${golfFieldDto.fieldNo}" class="img"
									style="background-image: url(${root}/attachment/download?attachmentNo=${golfFieldDto.attachmentNo});">
									</a>
								</c:when>
								<c:otherwise>
									<a href="${root}/field/detail/${golfFieldDto.fieldNo}" class="img"
									style="background-image: url(${root}/images/golf-dummy.jpg);">
									</a>							
								</c:otherwise>
							</c:choose>
							<div class="text p-2">
								<h3>
									<a href="#">${golfFieldDto.fieldName}</a>
								</h3>
								<p class="location">
									<span class="fa fa-map-marker"></span>지역
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	
	<!-- 페이지네이션 -->
			<div class="row mt-5 mb-5">
				<div class="col text-center">
					<div class="block-27">
						<ul>
							<c:if test="${p > 1}">
								<c:choose>
									<c:when test="${search}">
										<li><a href="golf_field?p=1&s=${s}&type=${type}&keyword=${keyword}" class="link">&laquo;</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="golf_field?p=1&s=${s}" class="link">&laquo;</a></li>
									</c:otherwise>			
								</c:choose>
							</c:if>
							<c:if test="${startBlock > 1}">
								<c:choose>
									<c:when test="${search}">
										<li><a href="golf_field?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}" class="link">&lt;</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="golf_field?p=${startBlock-1}&s=${s}" class="link">&lt;</a></li>
									</c:otherwise>			
								</c:choose>
							</c:if>
							<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
								<c:choose>
									<c:when test="${search}">
										<li><a href="golf_field?p=${i}&s=${s}&type=${type}&keyword=${keyword}" class="link">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="golf_field?p=${i}&s=${s}" class="link">${i}</a></li>
									</c:otherwise>			
								</c:choose>		
							</c:forEach>			
							<!-- 다음 버튼 영역 -->
							<c:if test="${endBlock < lastPage}">
								<c:choose>
									<c:when test="${search}">
										<li><a href="golf_field?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}" class="link">&gt;</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="golf_field?p=${endBlock+1}&s=${s}" class="link">&gt;</a></li>
									</c:otherwise>			
								</c:choose>
							</c:if>
							<c:if test="${p < lastPage}">
								<c:choose>
									<c:when test="${search}">
										<li><a href="golf_field?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}" class="link">&raquo;</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="golf_field?p=${lastPage}&s=${s}" class="link">&raquo;</a></li>
									</c:otherwise>			
								</c:choose>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
	

	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>