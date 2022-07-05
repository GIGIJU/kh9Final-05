<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<style>
p{
	font-size: 11px;	
}
span{
	font-size: 11px;
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
			<div class="col-md-7 mt-4 ml-3">
				<div>
					<h4>${golfFieldDto.fieldName}</h4>
				</div>				
				<div class="row mt-5">
					<div class="col">
						<p>일자</p>
						<span>${teeTimeD}</span>
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
						<span>${golfFieldDto.fieldArea}</span>
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
				<p>${teeTimeD}</p>
				<span>내장인원</span>
				<p>${golfFieldDto.fieldPeople}인 필수</p>
			</div>			
		</div>		
		<hr>
		<div class="row mt-4">
			<div class="col-md-4 mt-2"> 
				<h5><i class="fa-solid fa-golf-ball-tee"></i> 부대비용</h5>
			</div>
			<div class="col-md-7">
				<span>카트피 (현장결제)</span>
				<p><fmt:formatNumber value="${golfFieldDto.fieldCartfee}" />원</p>
				<span>캐디피 (현장결제)</span>
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
				
				<c:choose>
					<c:when test="${teetimeVO.partTime == 1}">
						 <p><fmt:formatNumber value="${golfFieldDto.fieldGreenfee-20000}" />원</p>					
						<span>${golfFieldDto.fieldPeople}인 필수</span> 
						<p><fmt:formatNumber value="${(golfFieldDto.fieldGreenfee-20000)*4}" />원</p>
					</c:when>
					<c:when test="${teetimeVO.partTime == 2 || teetimeVO.partTime == 4}">
						 <p><fmt:formatNumber value="${golfFieldDto.fieldGreenfee-10000}" />원</p>					
						<span>${golfFieldDto.fieldPeople}인 필수</span> 
						<p><fmt:formatNumber value="${(golfFieldDto.fieldGreenfee-10000)*4}" />원</p>
					</c:when>
					<c:otherwise>
						<p><fmt:formatNumber value="${golfFieldDto.fieldGreenfee}" />원</p>					
						<span>${golfFieldDto.fieldPeople}인 필수</span> 
						<p><fmt:formatNumber value="${golfFieldDto.fieldGreenfee*4}" />원</p>
					</c:otherwise>
				</c:choose>
			
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
		<form action="paymentInfo" method="get">
			<div class="col-md-4 offset-md-4 mt-5">
					<input type="hidden" name="teeTimeNo" value="${teetimeVO.teeTimeNo}">
					<input type="hidden" name="teeTimeD" value="${param.teeTimeD}">
					<%-- <input type="hidden" name="prepay" value="${golfFieldDto.fieldPrepay}"> --%>
			</div>
					<button class="btn" style="width: 100%;">결제정보</button>
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>