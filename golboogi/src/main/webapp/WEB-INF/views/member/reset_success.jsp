<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
<div class="container">
	<div class="col-12 mt-3" align="center">
		<h1>비밀번호 재설정 완료</h1>
	</div>
	<br><br>
	<div class="mt-3" align="center">
		<h2><a href="${root}/member/login" class="btn btn-primary btn-lg">로그인</a></h2>
	</div>
	<br><br>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>