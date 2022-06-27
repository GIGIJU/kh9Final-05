<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br><br>
<div class="container w450 m30">
	<div class="row center m30">
		<h1>비밀번호 재설정 페이지</h1>
	</div>
	<div class="row center m30">
		<form action="reset" method="post">
			<input type="hidden" name="cert" value="${cert}">
			<input type="hidden" name="memberId" value="${param.memberId}">
			바꿀 비밀번호 : <input type="password" name="memberPw" required>
			<input type="submit" value="변경">
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>