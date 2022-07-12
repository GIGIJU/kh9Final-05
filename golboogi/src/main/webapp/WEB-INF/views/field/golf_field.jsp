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
					<span>Field<i class="fa fa-chevron-right"></i></span>
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
							<a href="/field/detail/${golfFieldDto.fieldNo}" class="img"
								style="background-image: url(${root}/images/golf-dummy.jpg);">
							</a>
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


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>