<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<body>

 <!-- END nav -->
	<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/golboogi">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span>Mypage<i class="fa fa-chevron-right"></i></span>
					</p>
					<p class="mb-0" style="font-size: 17px">비밀번호 재설정</p>
				</div>
			</div>
		</div>
	</section>	
	
<div class="container">
	<br><br>
	<div class="mt-3" align="center">
		<h1>비밀번호 재설정 페이지</h1>
	</div>
	<br><br>
	<div class="mt-3">
		<form action="reset" method="post">
		<div class="mt-3">
			<span>인증번호</span>
			<input type="text" class="form-control" name="cert" value="${cert}" readonly>
		</div>
		<br>
		<div class="mt-3">
			<span>회원 아이디</span>
			<input type="text" class="form-control" name="memberId" value="${param.memberId}" readonly>
		</div>
		<br>
		<div class="mt-3">
			<span>바꿀 비밀번호</span>
			<input type="password" class="form-control" name="memberPw" required>
		</div>
		<br>
		<div class="mt-3" align="center">
			<input type="submit" class="btn btn-success btn-lg btn-block" value="변경">
		</div>
		<br>
		 <% if(request.getParameter("error") != null) { %>
			<div class="mt-3" align="center">
				<h3 style="color:red;">인증실패 다시 실행해 주세요</h3>
			</div>
		<% } %>
		</form>
	</div>
	<br><br>
</div>
<br><br><br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>