<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
p{
	font-size: 10px;	
}
span{
	font-size: 10px;
	color: black;
}
.btn{
	color: white;
    background-color: black;
}
</style>
 <section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/bg_1.jpg');">
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
      <div class="col-md-9 ftco-animate pb-5 text-center">
       <p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>booking <i class="fa fa-chevron-right"></i></span></p>
       <h2 class="mb-0 bread" style="color: white;">예약하기</h2>
     </div>
   </div>
 </div>
</section>

<div class="container-fluid mt-5 mb-5">
	<div class="col-md-6 offset-md-3">
		<h4 style="font-weight: bold;">티타임 정보</h4>
		<hr>
		<div class="row mb-3">
			<div class="col-md-4">
				<img src="${root}/images/bg_1.jpg" width="200" height="190" style="border-radius: 100%;">
			</div>
			<div class="col-md-7 mt-4 ml-5">
				<div>
					<h4>${golfFieldDto.fieldName}</h4>
				</div>
				<a href="teetime?courseNo=${teetimeVO.courseNo}"><button class="btn btn-primary">티타임등록</button></a>
				<div class="row mt-5">
					<div class="col">
						<p>일자</p>
						<span>2022-07-28</span>
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
		
		<div class="row mt-4">
			<div class="col-md-4 mt-2"> 
				<h5><i class="fa-solid fa-book-open"></i> 내장조건</h5>
			</div>
			<div class="col-md-7">
				<span>취소가능기한</span>
				<p>2022-07-21</p>
				<span>${golfFieldDto.fieldPeople}인 필수</span>
				<p>코스</p>
			</div>			
		</div>		
		<hr>
		<div class="row mt-4">
			<div class="col-md-4 mt-2"> 
				<h5><i class="fa-solid fa-golf-ball-tee"></i> 부대비용</h5>
			</div>
			<div class="col-md-7">
				<span>주간 캐디피 (현장결제)</span>
				<p><fmt:formatNumber value="${golfFieldDto.fieldCartfee}" />원</p>
				<span>야간 캐디피 (현장결제)</span>
				<p><fmt:formatNumber value="${golfFieldDto.fieldCaddiefee}" />원</p>
			</div>			
		</div>		
		<hr>
		<div class="row mt-4">
			<div class="col-md-4 mt-2"> 
				<h5><i class="fa-solid fa-sack-dollar"></i> 요금정보</h5>
			</div>
			<div class="col-md-7">
				<span>그린피 [1인당]</span>
				<p><fmt:formatNumber value="${golfFieldDto.fieldGreenfee}" />원</p>
				<span>${golfFieldDto.fieldPeople}인 필수</span> 
				<p><fmt:formatNumber value="" />원</p>
			</div>			
		</div>		
		<hr>
		<div class="row mt-4">
			<div class="col-md-4 mt-2"> 
				<h5><i class="fa-solid fa-check"></i>  동의</h5>
			</div>
			<div class="col-md-7">
				<span>* 계약 규정 및 동의</span>
				<hr>
				<i class="fa-solid fa-table-list"></i><span> 계약 규정 및 동의</span><br>
				<i class="fa-solid fa-table-list"></i><span> 계약 규정 및 동의</span><br>
				<i class="fa-solid fa-table-list"></i><span> 계약 규정 및 동의</span><br>
				
			</div>			
		</div>		
		<hr>
	<div class="col-md-4 offset-md-4 mt-5">
			<button class="btn">예약하기</button>
	</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>