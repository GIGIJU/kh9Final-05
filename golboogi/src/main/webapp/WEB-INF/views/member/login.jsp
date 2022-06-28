<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br><br>
<div class="container w700 m30">
	<div class="row center m30">
		<form action="login" method="post" >
			아이디 : <input type="text" name="memberId"><br> <br>
			비밀번호 : <input type="password" name="memberPw"><br> <br>
			<input type="submit" value="로그인">
		</form>
		
	</div>
	<div class="row center m30">
		 <a href="${root}/member/find_id">아이디 찾기</a> &nbsp; <span>/</span> &nbsp; <a href="${root}/member/find_pw">비밀번호 찾기</a>
	</div>
	<div class="row center m30">
		<p>아이디 : testuser1 | 비밀번호 : Testuser1!</p>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>