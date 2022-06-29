<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- 패키지 상세  -->

<hr>
	<h2>숙소 상세</h2>
	<h2>숙소 번호 : ${stayDto.stayNo}</h2>
	<h2>숙소 이름 : ${stayDto.stayName}</h2>
	<h2>상품 유형 : ${stayDto.stayType}</h2>
	<h2>숙소 타입 : ${stayDto.stayRoom}</h2>
	<h2>숙소 연락처 : ${stayDto.stayPhone}</h2>
	<h2>1인당 가격 : ${stayDto.stayPrice}원</h2>
	<h2>숙소 연락처 : ${stayDto.stayPhone}</h2>
	
	<h2>숙소 우편번호 : ${stayDto.stayPostAddress}</h2>
	<h2>숙소 주소 : ${stayDto.stayBasicAddress}</h2>
	<h2>숙소 상세주소 : ${stayDto.stayDetailAddress}</h2>

<hr>

<form method="post">
	<input type="hidden" name="no" value="${stayDto.stayNo}">
	<!--<input type="number" name="quantity" value="1" min="1" required>-->
	<input type="submit" value="결제하기" formaction="pay_purchase">
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
