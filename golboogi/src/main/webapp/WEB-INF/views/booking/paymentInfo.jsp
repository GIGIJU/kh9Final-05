<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
span {
	font-size: 11px;
	color: black;
}

p {
	font-size: 11px;
}
</style>

<section class="hero-wrap hero-wrap-2"
	style="background-image: url('${root}/images/bg_1.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-end justify-content-center"
			style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span>payment <i class="fa fa-chevron-right"></i></span>
				</p>
				<p class="mb-0" style="font-size: 17px">부킹, 모든 골프장 예약은 골북이로 통합니다.</p>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-no-pt ftco-no-pb">
	<div class="container">
		<div class="row col-10 offset-1">
			<div class="col-lg-8 ftco-animate py-md-5 mt-md-5">
				<div class="container">
					<div class="row mb-3">
						<div class="col-md-4">
							<img src="${root}/images/bg_1.jpg" width="150" height="150"
								style="border-radius: 100%;">
						</div>
						<div class="col-md-7 mt-4 ml-3">
							<div>
								<h4>${golfFieldDto.fieldName}</h4>
							</div>
							<div class="row mt-5">
								<div class="col-4">
									<p>일자</p>
									<span>${param.teeTimeD}</span>
								</div>
								<div class="col">
									<p>시간</p>
									<span>${teetimeVO.teeTimeT}</span>
								</div>
								<div class="col">
									<p>코스</p>
									<span>${teetimeVO.courseName}</span>
								</div>
								<div class="col">
									<p>지역</p>
									<span>지역</span>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row mt-4 ml-4" style="font-weight: bold;">
						<span>내장조건</span>
					</div>
					<div class="row mt-2 ml-2">
						<div class="col-md-4">
							<span>취소가능기한</span>
						</div>
						<div class="col-md-8">
							<span style="color: red;">2022-07-21</span>
						</div>
					</div>
					<div class="row mt-2 ml-2">
						<div class="col-md-4">
							<span>내장인원</span>
						</div>
						<div class="col-md-8">
							<span>4인 필수</span>
						</div>
					</div>
					<div class="row mt-2 ml-2">
						<div class="col-md-4">
							<span>결제조건</span>
						</div>
						<div class="col-md-8">
							<span>현장 결제</span>
						</div>
					</div>
					<hr>
				</div>
			</div>


			<!-- 오른쪽 (고정)-->
			<div class="col-lg-4 sidebar ftco-animate bg-light py-md-5">
				<div class="sidebar-box ftco-animate pt-md-5">
					<div class="categories">
						<h3>결제정보</h3>
						<div class="row">
							<span class="col-6" style="font-size: 14px">4인그린피</span> 
							<span class="col-6" style="font-size: 14px">
								<fmt:formatNumber value="${golfFieldDto.fieldGreenfee*4}"/></span>
						</div>
						<div class="row">
							<span class="col-6" style="color: gray;">-1인그린피</span>
							<span class="col-6" style="color: gray;">
								<fmt:formatNumber value="${golfFieldDto.fieldGreenfee}"/>
							</span>
						</div>
						<li>
							<div class="row">
								<span class="col-6" style="color: gray;">-인원</span>
								<span class="col-6" style="color: gray;">4인</span>
							</div>
						</li>

						<div class="row" style="color: black;">
							<h6 class="col-6">합계</h6>
							<h6 class="col-6"><fmt:formatNumber value="${golfFieldDto.fieldGreenfee*4}"/>원</h6>
						</div>
						<form action="reservation" method="post">
							<input type="hidden" name="teeTimeNo" value="${teetimeVO.teeTimeNo}">
							<input type="hidden" name="teeTimeD" value="${param.teeTimeD}">
							<input type="hidden" name="bookingPrice" value="${golfFieldDto.fieldGreenfee*4}">
							<div class="row mt-4 ml-1">
								<button class="btn" style="width: 90%">예약하기</button>
							</div>
						</form>
					</div>
				</div>


				<!--         <div class="sidebar-box ftco-animate">
          <h3>Paragraph</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
        </div> -->
			</div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>