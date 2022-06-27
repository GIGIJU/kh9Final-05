<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
<div class="container w700 m30">
	<div>
		<h2>회원가입</h2>
	</div>
	<div>
	<form action="join" method="post">
		아이디 : <input type="text" name="memberId"><br><br>
		비밀번호 : <input type="password" name="memberPw"><br><br>
		이름 : <input type="text" name="memberName"><br><br>
		닉네임 : <input type="text" name="memberNick"><br><br>
		전화번호 : <input type="text" name="memberPhone"><br><br>
		이메일 : <input type="email" name="memberEmail"><br><br>
		생년월일 : <input type="date" name="memberBirth"><br><br>
		성별 : 
			<select name="memberGender">
				<option>남</option>
				<option>여</option>
			</select>
		<br><br>
		지역 : <input type="text" name="memberLocal"><br><br>
		<br> <input type="submit" value="회원가입">
	</form>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
