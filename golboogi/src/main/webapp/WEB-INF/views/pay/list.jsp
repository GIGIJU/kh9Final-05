<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>결제 목록</h1>
<ul>
<c:forEach var="paymentDto" items="${list}">
	<li>
		${paymentDto}
		<a href="more?paymentNo=${paymentDto.paymentNo}">더보기</a>
	</li>
</c:forEach>  
</ul>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
