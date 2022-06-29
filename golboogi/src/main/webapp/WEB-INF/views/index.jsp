<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
	<div class="hero-wrap js-fullheight" style="background-image: url('images/main4.jpeg');">
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
				<a href="https://vimeo.com/45830194" class="icon-video popup-vimeo d-flex align-items-center justify-content-center mb-4">
					<span class="fa fa-play"></span>
				</a>
			</div>
		</div>
	</div>
		<section class="ftco-section img ftco-select-destination" style="background-image: url(images/bg_3.jpg);">
			<div class="container">
				<div class="row justify-content-center pb-4">
					<div class="col-md-12 heading-section text-center ftco-animate">
						<span class="subheading">Provide Places</span>
						<h2 class="mb-4">Select Your Destination</h2>
					</div>
				</div>
			</div>
			<div class="container container-2">
				<div class="row">
					<div class="col-md-12">
						<div class="carousel-destination owl-carousel ftco-animate">
							<div class="item">
								<div class="project-destination">
									<a href="#" class="img" style="background-image: url(images/main_Yongin.jpeg);">
										<div class="text">
											<h3>Yongin</h3>
											<span>8 Tours</span>
										</div>
									</a>
								</div>
							</div>
							<div class="item">
								<div class="project-destination">
									<a href="#" class="img" style="background-image: url(images/main_Ansung.jpeg);">
										<div class="text">
											<h3>Ansung</h3>
											<span>2 Tours</span>
										</div>
									</a>
								</div>
							</div>
							<div class="item">
								<div class="project-destination">
									<a href="#" class="img" style="background-image: url(images/main_Icheon.jpeg);">
										<div class="text">
											<h3>Icheon</h3>
											<span>5 Tours</span>
										</div>
									</a>
								</div>
							</div>
							<div class="item">
								<div class="project-destination">
									<a href="#" class="img" style="background-image: url(images/main_Incheon.jpeg);">
										<div class="text">
											<h3>Incheon</h3>
											<span>5 Tours</span>
										</div>
									</a>
								</div>
							</div>
							<div class="item">
								<div class="project-destination">
									<a href="#" class="img" style="background-image: url(images/main_pocheon.jpeg);">
										<div class="text">
											<h3>Pocheon</h3>
											<span>7 Tours</span>
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
						<span class="subheading">Destination</span>
						<h2 class="mb-4">Tour Destination</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 ftco-animate">
						<div class="project-wrap">
							<a href="#" class="img" style="background-image: url(images/main_jeju.avif);">
								<span class="price">₩ 325,000won/person</span>
							</a>
							<div class="text p-4">
								<span class="days">2 Days Tour</span>
								<h3><a href="#">Jeju</a></h3>
								<p class="location"><span class="fa fa-map-marker"></span> Jeju, Korea</p>
								<ul>
									<li><span class="flaticon-mountains"></span>Near Beach</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-4 ftco-animate">
						<div class="project-wrap">
							<a href="#" class="img" style="background-image: url(images/main_gyeonnam.jpeg);">
								<span class="price">₩ 364,000/person</span>
							</a>
							<div class="text p-4">
								<span class="days">10 Days Tour</span>
								<h3><a href="#">Gyeongnam</a></h3>
								<p class="location"><span class="fa fa-map-marker"></span> Gyeongnam, Korea</p>
								<ul>
									<li><span class="flaticon-sun-umbrella"></span>Near Mountain</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-4 ftco-animate">
						<div class="project-wrap">
							<a href="#" class="img" style="background-image: url(images/main_gangwon.jpeg);">
								<span class="price">₩ 335,000/person</span>
							</a>
							<div class="text p-4">
								<span class="days">7 Days Tour</span>
								<h3><a href="#">Gangwon</a></h3>
								<p class="location"><span class="fa fa-map-marker"></span> Gangwon, Korea</p>
								<ul>
									<li><span class="flaticon-sun-umbrella"></span>Near Beach</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="col-md-4 ftco-animate">
						<div class="project-wrap">
							<a href="#" class="img" style="background-image: url(images/main_jeonnam.jpeg);">
								<span class="price">₩ 325,000/person</span>
							</a>
							<div class="text p-4">
								<span class="days">8 Days Tour</span>
								<h3><a href="#">Jeonnam</a></h3>
								<p class="location"><span class="fa fa-map-marker"></span> Jeonnam, Korea</p>
								<ul>
									<li><span class="flaticon-sun-umbrella"></span>Near Mountain</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-4 ftco-animate">
						<div class="project-wrap">
							<a href="#" class="img" style="background-image: url(images/main_chungnam.jpeg);">
								<span class="price">₩ 330,000/person</span>
							</a>
							<div class="text p-4">
								<span class="days">10 Days Tour</span>
								<h3><a href="#">Chungnam</a></h3>
								<p class="location"><span class="fa fa-map-marker"></span> Chungnam, Korea</p>
								<ul>
									<li><span class="flaticon-sun-umbrella"></span>Near Mountain</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-4 ftco-animate">
						<div class="project-wrap">
							<a href="#" class="img" style="background-image: url(images/main_Yongin.jpeg);">
								<span class="price">₩ 425,000/person</span>
							</a>
							<div class="text p-4">
								<span class="days">7 Days Tour</span>
								<h3><a href="#">Gyeonggi</a></h3>
								<p class="location"><span class="fa fa-map-marker"></span> Gyeonggi, Korea</p>
								<ul>
									<li><span class="flaticon-sun-umbrella"></span>Near River</li>
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
										<span class="subheading">About Us</span>
										<h2 class="mb-4">Make Your Golf Memorable and Joy With Us</h2>
										<p><a href="#" class="btn btn-primary">Book Your Tee-time</a></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="ftco-section testimony-section bg-bottom" style="background-image: url(images/main_123.avif);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row justify-content-center pb-4">
					<div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
						<span class="subheading">Experiences</span>
						<h2 class="mb-4">Golfer Feedback</h2>
					</div>
				</div>
				<div class="row ftco-animate">
					<div class="col-md-12">
						<div class="carousel-testimony owl-carousel">
							<div class="item">
								<div class="testimony-wrap py-4">
									<div class="text">
										<p class="star">
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
										</p>
										<p class="mb-4">나중에 게시판 구현 뒤 한명씩 작성해주세여</p>
										<div class="d-flex align-items-center">
											<div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
											<div class="pl-3">
												<p class="name">이기주</p>
												<span class="position">마케팅 매니저</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="testimony-wrap py-4">
									<div class="text">
										<p class="star">
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
										</p>
										<p class="mb-4">알겠져?</p>
										<div class="d-flex align-items-center">
											<div class="user-img" style="background-image: url(images/person_2.jpg)"></div>
											<div class="pl-3">
												<p class="name">박소영</p>
												<span class="position">프로덕트 매니저</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="testimony-wrap py-4">
									<div class="text">
										<p class="star">
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
										</p>
										<p class="mb-4">~.~</p>
										<div class="d-flex align-items-center">
											<div class="user-img" style="background-image: url(images/person_3.jpg)"></div>
											<div class="pl-3">
												<p class="name">정유진</p>
												<span class="position">소프트웨어 엔지니어</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="testimony-wrap py-4">
									<div class="text">
										<p class="star">
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
										</p>
										<p class="mb-4">ㅇㅇ</p>
										<div class="d-flex align-items-center">
											<div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
											<div class="pl-3">
												<p class="name">김범진</p>
												<span class="position">회계사</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="testimony-wrap py-4">
									<div class="text">
										<p class="star">
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
										</p>
										<p class="mb-4">ㅇㅇ~</p>
										<div class="d-flex align-items-center">
											<div class="user-img" style="background-image: url(images/person_2.jpg)"></div>
											<div class="pl-3">
												<p class="name">이지은</p>
												<span class="position">서비스 기획자</span>
											</div>
										</div>
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
						<span class="subheading">Our Blog</span>
						<h2 class="mb-4">Recent Post</h2>
					</div>
				</div>
				<div class="row d-flex">
					<div class="col-md-4 d-flex ftco-animate">
						<div class="blog-entry justify-content-end">
							<a href="blog-single.html" class="block-20" style="background-image: url('images/image_1.jpg');">
							</a>
							<div class="text">
								<div class="d-flex align-items-center mb-4 topp">
									<div class="one">
										<span class="day">11</span>
									</div>
									<div class="two">
										<span class="yr">2020</span>
										<span class="mos">September</span>
									</div>
								</div>
								<h3 class="heading"><a href="#">~~님의 ~~cc 라운딩 후기!</a></h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
								<p><a href="#" class="btn btn-primary">자세히 보기</a></p>
							</div>
						</div>
					</div>
					<div class="col-md-4 d-flex ftco-animate">
						<div class="blog-entry justify-content-end">
							<a href="blog-single.html" class="block-20" style="background-image: url('images/image_2.jpg');">
							</a>
							<div class="text">
								<div class="d-flex align-items-center mb-4 topp">
									<div class="one">
										<span class="day">11</span>
									</div>
									<div class="two">
										<span class="yr">2020</span>
										<span class="mos">September</span>
									</div>
								</div>
								<h3 class="heading"><a href="#">~~님의 ~~cc 라운딩 후기!</a></h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
								<p><a href="#" class="btn btn-primary">자세히 보기</a></p>
							</div>
						</div>
					</div>
					<div class="col-md-4 d-flex ftco-animate">
						<div class="blog-entry">
							<a href="blog-single.html" class="block-20" style="background-image: url('images/image_3.jpg');">
							</a>
							<div class="text">
								<div class="d-flex align-items-center mb-4 topp">
									<div class="one">
										<span class="day">11</span>
									</div>
									<div class="two">
										<span class="yr">2020</span>
										<span class="mos">September</span>
									</div>
								</div>
								<h3 class="heading"><a href="#">~~님의 ~~cc 라운딩 후기!</a></h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
								<p><a href="#" class="btn btn-primary">자세히 보기</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

