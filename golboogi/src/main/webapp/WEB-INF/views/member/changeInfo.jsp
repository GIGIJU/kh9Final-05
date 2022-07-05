<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
<div class="container">
	<div class="mt-3" align="center">
		<h2>회원 정보 변경</h2>
	</div>
	<br><br><br>
	<div class="row col-12">
		<div class="col-5">
			<div class="mt-3" align="center">
				<a href="${root}/member/edit"><img src="${root}/images/pro.png" width="300px;" height="300px;"></a>
			</div>
			<br><br>
			<div class="mt-3" align="center">
				<h2><a href="${root}/member/edit">정보수정</a></h2>
			</div>
		</div>
		<div class="col-2"></div>
		<div class="col-5">
			<div class="mt-3" align="center">
				<a href="${root}/member/password"><img src="${root}/images/password.png" width="300px;" height="300px;"></a>
			</div>
			<br><br>
			<div class="mt-3" align="center">
				<h2><a href="${root}/member/password">비밀번호 변경</a></h2>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br>
	<div class="col-12">
		<div class="col-3 offset-9">
			<div class="mt-3" align="center">
				<a href="${root}/member/exit">
					<img src="${root}/images/exit.png" width="70px;" height="70px;"> <br><br>
				</a>
			</div>
			<div class="mt-3" align="center">
				<h4><a href="${root}/member/eixt">탈퇴</a></h4>	
			</div>
		</div>
	</div>
</div>
<br><br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>