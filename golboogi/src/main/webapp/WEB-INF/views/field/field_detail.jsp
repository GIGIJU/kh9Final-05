<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />

<!-- css 파일 추가 -->
<link rel="stylesheet" href="${root}/css/master.css">

<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<style>
html, body {
	position: relative;
	height: 100%;
}

body {
	background: #eee;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

.swiper {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>
</head>
<body>

	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${root}/images/img_home_title_booking.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center"
				style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-0 bread">골프장</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html"></i></a></span> <span>골프장
							정보 여기에 다 모였다</i>
						</span>
					</p>
				</div>
			</div>
		</div>
	</section>

	<section class="place_container">
		<h3>${info.fieldName}</h3>
		<div class="place_content">
			<p class="place_photo_tit">사진</p>
			<div class="place_swiper_container">
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper mySwiper round_swiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">Slide 1</div>
						<div class="swiper-slide">Slide 2</div>
						<div class="swiper-slide">Slide 3</div>
						<!-- <div class="swiper-slide">Slide 4</div>
                        <div class="swiper-slide">Slide 5</div>
                        <div class="swiper-slide">Slide 6</div>
                        <div class="swiper-slide">Slide 7</div>
                        <div class="swiper-slide">Slide 8</div> -->
					</div>

					<!-- <div class="swiper-pagination"></div> -->
				</div>

				<!-- Swiper JS -->
				<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

				<!-- Initialize Swiper -->
				<script>
                var swiper = new Swiper(".mySwiper", {
                    cssMode: true,
                    navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                    },
                    pagination: {
                    el: ".swiper-pagination",
                    },
                    mousewheel: true,
                    keyboard: true,
                });
                </script>
			</div>

			<h1>
				골프장 정보
				<h1>
					<hr>
					<h3></h3>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<!--  <div class=""> -->
						<!-- <div class=""> -->
						<p>${info.fieldInfo}</p>
						<div class="golf_field_info_content">
							<div class="golf_field_score">
								<div class="golf_field_score_content">
									<h1>내장객 평균 별점</h1>
									<c:if test="${rating == null}">
										<p>x</p>
									</c:if>
									
									<p>${rating}</p>
									<span>등록 라운드 330K</span>
								</div>
							</div>
							<div class="golf_field_info">
								<ul>
									<li><i class="bi bi-check"></i> ${info.fieldArea}</li>
									<li><i class="bi bi-check"></i> ${info.fieldBasicAddress}
									</li>
									<li><i class="bi bi-check"></i> ${info.fieldPhone}</li>
								</ul>
							</div>
						</div>
						<div class="place_round_btn_container">
							<button id="round_review_write_btn" onclick="">라운드 후기 작성</button>
							<button id="round_review_show_btn" onclick="">라운드 후기 보기</button>
						</div>

					</div>
		</div>
		</div>
		</script>
		</div>
	</section>
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
