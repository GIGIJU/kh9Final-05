<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div class="row center">
	<form action="join" method="post">
		아이디 : <input type="text" name="memberId"><br><br>
		비밀번호 : <input type="password" name="memberPw"><br><br>
		이름 : <input type="text" name="memberName"><br><br>
		닉네임 : <input type="text" name="memberNick"><br><br>
		전화번호 : <input type="text" name="memberPhone"><br><br>
		이메일 : <input type="email" name="memberEmail"><br><br>
		생년월일 : <input type="date" name="memberBirth"><br><br>
		성별 : <input type="text" name="memberGender"><br><br>
		지역 : <input type="text" name="memberLocal"><br><br>
		<br> <input type="submit" value="회원가입">
	</form>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
