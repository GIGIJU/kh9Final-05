<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div class="row center">
	<form action="login" method="post">
		아이디 : <input type="text" name="memberId"><br> <br>
		비밀번호 : <input type="password" name="memberPw"><br> <br>
		<input type="submit" value="로그인">
	</form>
</div>
<br>
<br>
<div class="row center">
	<a href="${root}/member/find_id">아이디 찾기</a> &nbsp; <span>/</span>
	&nbsp; <a href="${root}/member/find_pw">비밀번호 찾기</a>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>