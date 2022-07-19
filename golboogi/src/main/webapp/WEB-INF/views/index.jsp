<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	<div class="hero-wrap js-fullheight" style="background-image: url('images/main4.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center" data-scrollax-parent="true">
				<div class="col-md-7 ftco-animate">
					<br><br><br><br><br>
					<span class="subheading">One-Stop Golf Platform</span>
					<br>
					<h1 class="mb-4">골프의 모든 것<br>오직 골북이에서</h1>  
					<p class="caps">골프는 자연과 건강이 함께하는 스포츠입니다. 관리하며, 알고 치는 골프는 더 즐겁습니다</p>
				</div>
			</div>
		</div>
	</div>
		<section class="ftco-section img ftco-select-destination" style="background-image: url(images/);">
			<div class="container">
				<div class="row justify-content-center pb-4">
					<div class="col-md-12 heading-section text-center ftco-animate">
						<span class="subheading">Provide Places</span>
						<h2 class="mb-4">골프부킹, 국내 최대 부킹서비스</h2>
					</div>
				</div>
			</div>
			<div class="container container-2">
				<div class="row">
					<div class="col-md-12">
						<div class="carousel-destination owl-carousel ftco-animate">
							<div class="item">
								<div class="project-destination">
									<a href="${root}/booking/list_all?fieldArea=경기" class="img" style="background-image: url(images/main_Yongin.jpeg);">
										<div class="text">
											<h3>경기</h3>
										</div>
									</a>
								</div>
							</div>
							<div class="item">
								<div class="project-destination">
									<a href="${root}/booking/list_all?fieldArea=강원" class="img" style="background-image: url(images/main_Ansung.jpeg);">
										<div class="text">
											<h3>강원</h3>
										</div>
									</a>
								</div>
							</div>
							<div class="item">
								<div class="project-destination">
									<a href="${root}/booking/list_all?fieldArea=경상도" class="img" style="background-image: url(images/main_Icheon.jpeg);">
										<div class="text">
											<h3>경상도</h3>
										</div>
									</a>
								</div>
							</div>
							<div class="item">
								<div class="project-destination">
									<a href="${root}/booking/list_all?fieldArea=전라도" class="img" style="background-image: url(images/main_Incheon.jpeg);">
										<div class="text">
											<h3>전라도</h3>
										</div>
									</a>
								</div>
							</div>
							<div class="item">
								<div class="project-destination">
									<a href="${root}/booking/list_all?fieldArea=제주도" class="img" style="background-image: url(images/main_pocheon.jpeg);">
										<div class="text">
											<h3>제주도</h3>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center pb-4">
					<div class="col-md-12 heading-section text-center ftco-animate">
						<span class="subheading">Tour Destination</span>
						<h2 class="mb-4">골프 투어, 나만을 위한 럭셔리 맞춤 서비스</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 ftco-animate">
						<div class="project-wrap">
							<a href="${root}/package/list?stayPrice=100000"class="img" style="background-image: url(images/main_jeju.avif);">
								<span class="price">알뜰</span>
							</a>
							<div class="text p-4">
								<h3><a href="${root}/package/list?stayPrice=100000" style="font-weight:bold;">가볍고 똑똑한 골프🙌</a></h3>
								<p class="location">💰 ~100,000원 </p>
								<ul>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-4 ftco-animate">
						<div class="project-wrap">
							<a href=${root}/package/list?stayPrice=300000" class="img" style="background-image: url(images/main_gyeonnam.jpeg);">
								<span class="price">일반</span>
							</a>
							<div class="text p-4">
							
								<h3><a href=${root}/package/list?stayPrice=300000" style="font-weight:bold;">남녀노소 모두의 골프🏌️‍♀️‍</a></h3>
								<p class="location">💰 100,000~300,000원</p>
								<ul>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-4 ftco-animate">
						<div class="project-wrap">
							<a href="${root}/package/list?stayPrice=500000" class="img" style="background-image: url(images/main_Yongin.jpeg);">
								<span class="price">프리미엄</span>
							</a>
							<div class="text p-4">
								<h3><a href="${root}/package/list?stayPrice=500000" style="font-weight:bold;">당신의 FLEX를 위해💸</a></h3>
								<p class="location">💰 300,000원~</p>
								<ul>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<section class="ftco-section ftco-about img"style="background-image: url(images/main12.avif);">
			<div class="overlay"></div>
			<div class="container py-md-5">
				<div class="row py-md-5">

				</div>
			</div>
		</section>

		<section class="ftco-section ftco-about ftco-no-pt img">
			<div class="container">
				<div class="row d-flex">
					<div class="col-md-12 about-intro">
						<div class="row">
							<div class="col-md-6 d-flex align-items-stretch">
								<div class="img d-flex w-100 align-items-center justify-content-center" style="background-image:url(images/main222.avif);">
								</div>
							</div>
							<div class="col-md-6 pl-md-5 py-5">
								<div class="row justify-content-start pb-3">
									<div class="col-md-12 heading-section ftco-animate">
										<span class="subheading">Join</span>
										<h2 class="mb-4">조인, 믿을 수 있는 동반자를 찾는 방법</h2>
										<p><a href="${root}/join/list" class="btn btn-primary" style="width:95%; font-size:20px;">Find Your Join-partner</a></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center pb-4">
					<div class="col-md-12 heading-section text-center ftco-animate">
						<span class="subheading">Our Review</span>
						<h2 class="mb-4">최근 게시글</h2>
					</div>
				</div>
				<div class="row d-flex">
				<c:forEach var = "recentVO" items = "${recentList}">
					<div class="col-md-4 d-flex ftco-animate">
						<div class="blog-entry justify-content-end">
							<a href="blog-single.html" class="block-20" style="background-image: url('images/image_1.jpg');">
							</a>
							<div class="text">
								<div class="d-flex align-items-center mb-4 topp">
									<div class="two">
										<span class="yr"><fmt:formatDate value="${recentVO.reviewTime}" pattern="y.M.d"/></span>
									</div>
								</div>
								<h3 class="heading"><a href="${root}/review/detail/${recentVO.reviewNo}">${recentVO.memberNick}님의 ${recentVO.fieldName} 라운딩 후기!</a></h3>
								<!-- <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
								<p><a href="${root}/review/detail/${recentVO.reviewNo}" class="btn btn-primary">자세히 보기</a></p>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
