<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
<div class="container">
	<br><br>
	<div class="mt-3" align="center">
		<img src="${root}/images/golboogi-logo.png">
	</div>
	<br><br>
	<div class="mt-3" align="center">
		<h1>아이디 찾기 결과</h1>
	</div>
	<br><br>
	<div class="mt-3" align="center">
		<h2>아이디 : ${findUserId} 입니다.</h2>
	</div>
	<br><hr><br>
	<div class="mt-3" align="center">
		<a href="${root}/member/login" class="btn btn-success btn-lg btn-block">로그인</a>
	</div>
	<br>
	<div class="mt-3" align="center">
		<a href="${roo}/member/find_pw" class="btn btn-success btn-lg btn-block">비밀번호 찾기</a>
	</div>
</div>
<br><br><br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>