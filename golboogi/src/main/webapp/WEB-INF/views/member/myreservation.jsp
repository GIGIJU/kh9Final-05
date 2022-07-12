<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span><a href="${root}/member/myreservation">MyReservation <i class="fa fa-chevron-right"></i></a></span>
				</p>
				<p class="mb-0" style="font-size: 17px">내예약 정보</p>
			</div>
		</div>
	</div>
</section>	
<br><br><br><br>
<style>
    #myreservation{
        text-align: center;
        font-size: 2em;
    }
</style>
<div class="container">
    <div class="mt-3 col-12">
        <h2 id="myreservation">내 예약 정보</h2>
    </div>
    <br><br>
    <div class="mt-3">
    	<table class="table table-border">
    		<thead>
				<tr>
					<th>예약번호</th>
					<th>예약자명</th>
					<th>예약인원</th>
					<th>T타임</th>
					<th>BookingDate</th>
					<th>가격</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${list.isEmpty()}">
					<tr>
						<td colspan="7" align="center">예약 정보 없음</td>
					</tr>
				</c:if>
				<c:forEach var="bookingDto" items="${list}">
					<tr>
						<td>${bookingDto.bookingNo}</td>
						<td>${bookingDto.bookingName}</td>
						<td>${bookingDto.bookingPeople}</td>
						<td>${bookingDto.teeTimeD}</td>
						<td>${bookingDto.bookingDate}</td>
						<td>${bookingDto.bookingPrice}</td>
						<td>${bookingDto.bookingStatus}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
    </div>
</div>
<br><br><br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>