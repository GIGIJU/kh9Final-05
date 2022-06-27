<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="exit" method="post">
	<div class="container w400 m30">
		<div class="row center m30">
			<h1>비밀번호 확인</h1>
		</div>
		<div class="row">
			<input type="password" name="memberPw" required
				class="form-input fill input-round">
		</div>
		<div class="row">
			<button type="submit" class="btn btn-primary fill">탈퇴하겠습니다</button>
		</div>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>