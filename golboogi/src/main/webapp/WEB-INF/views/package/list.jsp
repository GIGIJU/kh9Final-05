<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- 패키지 리스트  -->
<c:forEach var="stayDto" items="${list}">
	<div>
		숙소이름 : ${stayDto.stayName} ,
		숙소타입 : ${stayDto.stayType} ,
		숙소가격 : ${stayDto.stayPrice}원
		숙소상태 : ${stayDto.stayStatus}
		<a href="detail?stayNo=${stayDto.stayNo}">예약하기</a>
	</div>
</c:forEach>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
