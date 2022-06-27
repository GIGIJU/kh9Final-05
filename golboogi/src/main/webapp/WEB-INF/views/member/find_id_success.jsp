<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div class="container w400 m30">
	<div class="row center m30">
		<h1>아이디 찾기 결과</h1>
	</div>
	<div class="row center m30">
		아이디 : ${findUserId}
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>