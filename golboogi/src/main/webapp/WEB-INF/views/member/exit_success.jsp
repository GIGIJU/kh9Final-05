<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
<div class="container">
	<div class="mt-3" align="center">
		<img src="${root}/images/golboogi-logo.png">
	</div>
	<br>
	<div class="mt-3" align="center">
		<h2>회원탈퇴가 완료되었습니다.</h2>
	</div>
	<hr>
	<br><br>
		<div class="mt-3" align="center">
			<h1>그동안 Golboogi를 이용해주셔서 감사합니다</h1><br>
			<h4>보다 나은 서비스로 찾아 뵙겠습니다.</h4>
		</div>
		<br>
		<div class="mt-3" align="center">
			<a href="${root}/" class="btn btn-primary btn-lg">Golboogi</a>
		</div>
	<br><br>
	<hr>
</div>
<br><br><br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>