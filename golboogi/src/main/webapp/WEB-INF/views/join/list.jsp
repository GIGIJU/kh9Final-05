<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span>join <i class="fa fa-chevron-right"></i></span>
				</p>
				<p class="mb-0" style="font-size: 17px">부킹, 모든 골프장 예약은 골북이로 통합니다.</p>
			</div>
		</div>
	</div>
</section>	
<div class="container-fluid">
	<div class="col-6 offset-3 mt-5">
		<h4>조인게시판</h4>
	<div class="row mt-4 mb-5">
			<table class="table table-hover text-center" style="font-size: 12px;">
		 		<thead>
			 		<tr>
				 		<th>날짜</th>
				 		<th>타임</th>
				 		<th>지역</th>
				 		<th>골프장</th>
				 		<th>필요인원</th>
				 		<th>인당그린피</th>
				 		<th>등록일</th>
				 		<th>등록자</th>
				 	</tr>
			 	</thead>
			 	<tbody>
			 	<c:forEach var="joinListVO" items="${list}">
				 	<tr>
				 		<fmt:parseDate var="teeTimeD"  value="${joinListVO.teeTimeD}" pattern="yyyy-MM-dd"/>
					 	<td><fmt:formatDate value="${teeTimeD}" pattern="MM/dd"/></td>
				 		<td>${joinListVO.teeTimeT}</td>
				 		<td>${joinListVO.fieldArea}</td>
				 		<td>${joinListVO.fieldName}</td>
				 		<td>${joinListVO.joinPeople}명</td>
				 		<td><fmt:formatNumber value="${joinListVO.bookingPrice}" />원</td>
				 		<fmt:parseDate var="teeTimeD"  value="${joinListVO.joinTime}" pattern="yyyy-MM-dd"/>
					 	<td><fmt:formatDate value="${teeTimeD}" pattern="MM/dd"/></td>
				 		<td>${joinListVO.memberNick}</td>
				 	</tr>
			 	</c:forEach>
			 	</tbody>
			 </table>
		</div>
		
					<div class="row mt-5 mb-5">
				<div class="col text-center">
					<div class="block-27">
						<ul>
							<li><a href="#">&lt;</a></li>
							<li class="active"><span>1</span></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&gt;</a></li>
						</ul>
					</div>
				</div>
			</div>
	</div>
	
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>