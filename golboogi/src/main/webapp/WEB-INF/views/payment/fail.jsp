<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>결제가 실패했습니다</h1>
<p>
	카드 한도나 충전 금액 등을 확인해보세요
</p>

<h2><a href="${pageContext.request.contextPath}">홈으로</a></h2>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
